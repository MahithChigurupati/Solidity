//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract vault{
    address payable creator;

    constructor() payable{
        creator = payable(msg.sender);
    }

    modifier onlyOwner(){
        require(creator == msg.sender,"only owner is allowed to withdraw");
        _;
    }

    receive() external payable{}

    function depositSomeMoney() public payable returns(uint){
        return msg.value;
    }

    function getBalance() public view returns(uint){
        return address(this).balance;
    }

    function takeOutWithTransfer(uint amount) onlyOwner public{
        address payable mine = payable(msg.sender);
        mine.transfer(amount*(10**18));
    }

    function takeOutWithSend(uint amount) onlyOwner public returns(bool){
        address payable mine = payable(msg.sender);
        bool tryToSend = mine.send(amount*(10**18));
        return tryToSend;
    }

    function takeOutWithCall(uint amount) onlyOwner public returns(bool,bytes memory){
        address payable mine = payable(msg.sender);
        (bool tryToSend, bytes memory data) = mine.call{value:amount*(10**18), gas:5000}("");
        return (tryToSend,data);
    }

}