//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract tokenHard{

    address private creator;

    constructor(){
        creator = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == creator , "only owner can be able to mint");
        _;
    }

    string public tokenName = "Nothing";
    string public symbol = "NOT";
    uint public supply = 0;
    mapping(address => uint) public holders;

    function getBalance(address toCheck) public view returns(uint){
        return holders[toCheck];
    }

    function mint() public onlyOwner{
        holders[creator] += 1;
        supply += 1;
    }

    function transfer(address to, uint amount) public returns(bool){
        require(holders[msg.sender]-amount>0, "Insufficient Balance");
        require(to != address(0),"can't transfer to zero address");
        
        holders[msg.sender] -= amount;
        holders[to] += amount;
        return true;
    }
}