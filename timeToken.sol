//SPDX-License-Identifier:MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract timedToken is ERC20("TIME TOKEN","TT") {

    mapping(address => uint) public lastSpent;
    mapping(address => uint) public alreadySpent;
    mapping(address => bool) public exclusions;

    uint public limitPerDay = 5;

    function timedTransfer(address to, uint amount) public {
        if(exclusions[msg.sender] == false){ 
            if(block.timestamp - lastSpent[msg.sender] > 1 minutes){
            lastSpent[msg.sender] = block.timestamp;
            alreadySpent[msg.sender] = amount;
            _transfer(msg.sender, to, amount);
        }else{
            if((alreadySpent[msg.sender] + amount) > limitPerDay){
                revert("limit exceeded");
            }else{
                lastSpent[msg.sender] = block.timestamp;
                alreadySpent[msg.sender] += amount;
                _transfer(msg.sender, to, amount);
            }
        }
        }else{
        _transfer(msg.sender, to, amount);
        }

    }

    function mint() public{
        _mint(msg.sender,5);
    }

    function addToExclusion(address exclude) public{
        exclusions[exclude] = !exclusions[exclude];
    }
    
}
