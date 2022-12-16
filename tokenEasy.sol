//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract tokenEasy is ERC20("NOTHING", "NOT") {

    address public owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == owner, "not the onwer");
        _;
    }

    function mintToken(uint amount) onlyOwner public{
        _mint(msg.sender,amount);
    }




}