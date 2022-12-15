//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract impBasics{

    address private contractOwner;
    uint private value = 100;
    bool switcher = false;

    //will run only when contract is deployed
    constructor(address accessableAddress){
        contractOwner = accessableAddress;
    }



    function tryingBasics() public view returns(uint,uint,uint){
        return (block.chainid,block.difficulty,block.number);
    }

    modifier onlyOwner(){
        require(contractOwner == msg.sender, "Only onwer is allowed to run");
        _;
    }

    modifier flip(){
        if(switcher != true ){
            revert("switch is off");
        }
        _;
    }

    function getValue() public view onlyOwner returns(uint){
        return value;
    }

    function run() public view returns(uint){
        assert(value==100);
        return value;
    }

    function changeFlip(bool option) public{
        switcher = option;
    }

    function runner() public view flip returns(uint){
        return value;
    }



}