//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token is ERC20("MahithTest","MCT"){

    address public creator;
    mapping(address => uint) public points; 

    constructor() payable{
        creator = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == creator, "Only owner is allowed");
        _;
    }

    function mintNewToken(uint amount) public onlyOwner{
        _mint(msg.sender, amount);
    }

    function burnAndAdd(uint amount) public {
        _burn(msg.sender,amount);
        points[msg.sender] += amount;
    }

    function burned(address check) public view returns(uint){
        return points[check];
    }

    function win() public {
        if(points[msg.sender] > 5){
            selfdestruct(payable(msg.sender));
        }else{
            revert("you don't have enough tokens to win");
        }
    }

}