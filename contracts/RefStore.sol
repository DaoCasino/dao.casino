pragma solidity ^0.4.4;

/**
 * @dev Referral storage interface
 */
contract RefStore {
    /**
     * @dev Player adviser,
     *      the one who invited the person to the game
     */
    mapping(address => address) public adviserOf;

    /**
     * @dev Player operator
     */
    mapping(address => address) public operatorOf;
}
