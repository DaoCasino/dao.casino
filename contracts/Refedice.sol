pragma solidity ^0.4.4;

import './Signidice.sol';
import './RefStore.sol';

/**
 * @dev Signidice game with service reward out of the box
 * Howto use this contract:
 *   contract MyDice is Refedice {
 *      function MyDice(address d, address s, uint256 e) Refedice(d, s, e) Signidice(1 ether) {}
 *
 *      function playerReward(uint256 _id, uint256 _lucky) internal returns (bool) {
 *          var random = _lucky % 100;
 *          var game = games[_id];
 *          // Primitive HI/LO game
 *          var win =  ((game.bet == 0) && (random < 45))
 *                  || ((game.bet > 0) && (random > 55));
 *          if (win) if (!game.player.send(game.value * 2)) throw;
 *          // Do service reward 
 *          return serviceReward(game.player, game.value);
 *      }
 *   }
 */
contract Refedice is Signidice {
    /**
     * @dev Profit distribution:
     * +-----+-----------------------
     * | 25% | Game developer 
     * | 25% | Player adviser (from RefStore contract) 
     * | 25% | Game operator (from RefStore contract) 
     * | 25% | Stay on game contract
     * +-----+-----------------------
     */

    address  public gameDeveloper;
    RefStore public referralStore;
    uint256  public houseEdge;

    /**
     * @dev Change referral storage of the game
     * @param _store New storage address
     */
    function setReferralStorage(RefStore _store) onlyOwner
    { referralStore = _store; }

    /**
     * @dev Game constructor
     * @param _developer Game developer account address
     * @param _store Referral storage contract address
     * @param _house_edge Expected value of game profit
     */
    function Refedice(address _developer, address _store, uint256 _house_edge) {
        gameDeveloper = _developer;
        referralStore = RefStore(_store);
        houseEdge     = _house_edge;
    }

    /**
     * @dev Process service rewarding scheme 
     * @param _player Player account address
     * @param _value Player bid value
     */
    function serviceReward(address _player, uint256 _value) internal returns (bool) {
        var profit   = _value * houseEdge / 100;
        var reward   = profit * 25 / 100;

        var operator = referralStore.operatorOf(_player);
        var adviser  = referralStore.adviserOf(_player);

        if (!gameDeveloper.send(reward)) throw;
        if (!operator.send(reward)) throw;
        if (!adviser.send(reward)) throw;

        return true;
    }
}
