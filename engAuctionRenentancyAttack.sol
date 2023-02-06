//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract EnglishAuction{
    address payable public seller;
    uint256 public timeToEnd;
    bool public running;

    address public highestBidder;
    uint public highestBid;

    mapping(address => uint256) public deposits;

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

        deposits[msg.sender] += msg.value;

        //payable(highestBidder).transfer(highestBid);

        highestBidder = msg.sender;
        highestBid = msg.value;

    }

    function win() public{
        require(running);
        require(timeToEnd <= block.timestamp);

        running = false;
        seller.transfer(highestBid);
    }

    function takeOut() public {
        require(msg.sender != highestBidder);
        require(deposits[msg.sender]!=0);

        (bool tryToSend,) = msg.sender.call{value: deposits[msg.sender]}("");
        require(tryToSend);

        deposits[msg.sender] = 0;

    }

    function getBalance() public view returns(uint256){
        return deposits[msg.sender];
    }


}