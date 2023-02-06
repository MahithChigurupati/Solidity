//SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

interface IEnglishAuction{
    function bid() external payable;
}

contract auctionHack{
    IEnglishAuction public auctionContrcat;

    constructor(address addy){
        auctionContrcat = IEnglishAuction(addy);
    } 

    function bid() public payable{
        auctionContrcat.bid{value: msg.value}();
    }

    fallback() external payable{

    }

    receive() external payable{
        
    }
}