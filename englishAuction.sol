//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EnglishAuction{
    address payable public seller;
    uint256 public timeToEnd;
    bool public running;

    address public highestBidder;
    uint public highestBid;

    constructor(){
        seller = payable(msg.sender);

        
    }

    function startAuction() public{
        require(!running);
        require(seller == msg.sender);
        
        running = true;
        timeToEnd = block.timestamp + 1 minutes;

    }

    function bid() public payable{
        require(running);

        require(msg.value > highestBid);

        payable(highestBidder).transfer(highestBid);

        highestBidder = msg.sender;
        highestBid = msg.value;

    }

    function win() public{
        require(running);
        require(timeToEnd <= block.timestamp);

        running = false;
        seller.transfer(highestBid);
    }
}