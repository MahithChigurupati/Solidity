//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/v4.0.0/contracts/token/ERC20/IERC20.sol";


contract marketplaceItem1{
    mapping(address => bool) public alreadyBought;
    uint public price = 10;
    address public owner = payable(msg.sender);

    IERC20 public usdcFToken = IERC20(0xd9145CCE52D386f254917e481eB44e9943F39138);
    IERC20 public usdtFToken = IERC20(0xD7ACd2a9FD159E69Bb102A1ca21C9a3e3A5F771B);

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

    function payInETH() public returns(bool){
      //get chainlink data
      return true;
    }
}