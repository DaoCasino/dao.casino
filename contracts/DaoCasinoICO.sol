pragma solidity ^0.4.4;

import 'foundation/Crowdfunding.sol';

contract DaoCasinoICO is Crowdfunding {
    /**
     * @dev Crowdfunding contract initial 
     * @param _fund Destination account address
     * @param _bounty Bounty token address
     * @param _reference Reference documentation link
     * @param _startBlock Funding start block number
     * @param _stopBlock Funding stop block nubmer
     * @param _minValue Minimal funded value in wei 
     * @param _maxValue Maximal funded value in wei
     * @param _scale Bounty scaling factor by funded value
     * @param _startRatio Initial bounty ratio
     * @param _reductionStep Bounty reduction step in blocks 
     * @param _reductionValue Bounty reduction value
     * @notice this contract should be owner of bounty token
     */
    function DaoCasinoICO(
        address _fund,
        address _bounty,
        string  _reference,
        uint256 _startBlock,
        uint256 _stopBlock,
        uint256 _minValue,
        uint256 _maxValue,
        uint256 _scale,
        uint256 _startRatio,
        uint256 _reductionStep,
        uint256 _reductionValue
    ) Crowdfunding(_fund, _bounty, _reference, _startBlock, _stopBlock, _minValue, _maxValue, _scale, _startRatio, _reductionStep, _reductionValue) {}

    // ONLY FOR 16.44s block time
    uint256 public constant BLOCKS_IN_DAY = 5256;

    /**
     * @dev Calculate bounty value by static equation
     * @param _value Input donation value
     * @param _block Input block number
     * @return Bounty value
     */
    function bountyValue(uint256 _value, uint256 _block) constant returns (uint256) {
        uint256 ratio = 0;
        uint256 start = config.startBlock;

        // 1st day bounty
        if (_block >= start && _block < start + BLOCKS_IN_DAY)
            ratio = 2000;

        // [2; 15) day bounty
        if (_block >= start + BLOCKS_IN_DAY && _block < start + 15*BLOCKS_IN_DAY)
            ratio = 1800;

        // [15; 18) day bounty
        if (_block >= start + 15*BLOCKS_IN_DAY && _block < start + 18*BLOCKS_IN_DAY)
            ratio = 1700;

        // [18; 21) day bounty
        if (_block >= start + 18*BLOCKS_IN_DAY && _block < start + 21*BLOCKS_IN_DAY)
            ratio = 1600;

        // [21; 23) day bounty
        if (_block >= start + 21*BLOCKS_IN_DAY && _block < start + 23*BLOCKS_IN_DAY)
            ratio = 1500;

        // [23; 26) day bounty
        if (_block >= start + 23*BLOCKS_IN_DAY && _block < start + 26*BLOCKS_IN_DAY)
            ratio = 1400;

        // [26; 29) day bounty
        if (_block >= start + 26*BLOCKS_IN_DAY && _block <= config.stopBlock)
            ratio = 1300;

        return _value * ratio / config.bountyScale;
    }

    /**
     * @dev Withdrawal balance on successfull finish
     */
    function withdraw() onlySuccess {
        withdrawDone = true;

        if (msg.sender != fund) throw;
        if (!fund.send(this.balance)) throw;

        var bountyVal = bounty.totalSupply() / 76 * 26; 
        bounty.emission(bountyVal);
        if (!bounty.transfer(fund, bountyVal)) throw;
    }

    bool withdrawDone = false;
}
