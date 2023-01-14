//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";
import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract marketplaceItem1{

   AggregatorV3Interface internal priceFeed = AggregatorV3Interface(0xD4a33860578De61DBAbDc8BFdb98FD742fA7028e);

    mapping(address => bool) public alreadyBought;
    uint public price = 10*10**18;
    address public owner = payable(msg.sender);

    IERC20 public usdcFToken = IERC20(0x1194D7A94fe9894Ce4f411DA64733a61720bff6a);
    IERC20 public usdtFToken = IERC20(0x1194D7A94fe9894Ce4f411DA64733a61720bff6a);

    function payInUSDC() public returns(bool){
       require(alreadyBought[msg.sender]==false,"you already bought");
       usdcFToken.transferFrom(msg.sender,owner,price);
       alreadyBought[msg.sender] = true;
       return alreadyBought[msg.sender];
    }

    function payInUSDT() public returns(bool){
       require(alreadyBought[msg.sender]==false,"you already bought");
       usdtFToken.transferFrom(msg.sender,owner,price);
       alreadyBought[msg.sender] = true;
       return alreadyBought[msg.sender];
    }

    function getCurrentPriceofEth() public view returns(int){
       (/*data1*/, int priceOfETH,/*data1*/ ,/*data1*/,/*data1*/) = priceFeed.latestRoundData();
       return priceOfETH / 10**8;
    }

    function getPriceOfETH() public view returns(int){
       return int(price)/getCurrentPriceofEth();
    }

    function payInETH() public payable returns(bool){
       require(msg.value == uint(getPriceOfETH()), "amount is insufficient");
       (bool sent, /*data*/) = owner.call{value: msg.value}("");
       require(sent == true, "error occured");
       alreadyBought[msg.sender] = true;
       return alreadyBought[msg.sender];
    }

    function changeOwner(address newOwner) public{
       require(msg.sender == owner, "Not owner");
       owner = newOwner;
    }

    function changePrice(uint newPrice) public{
       require(msg.sender == owner, "Not owner");
       price = newPrice;
    }
}