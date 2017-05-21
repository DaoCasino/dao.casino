pragma solidity ^0.4.4;

import 'common/Owned.sol';
import './RefStore.sol';

/**
 * @title Simple owned-access based storage
 */
contract OwnedStore is Owned, RefStore {
    /**
     * @dev Set player adviser
     */
    function setAdviser(address _player, address _adviser) onlyOwner
    { adviserOf[_player] = _adviser; }

    /**
     * @dev Set player operator
     */
    function setOperator(address _player, address _operator) onlyOwner
    { operatorOf[_player] = _operator; }
}
