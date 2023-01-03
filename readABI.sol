//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract readable{

    uint public age = 25;

    string public name = "Mahith";

    function incrementAge() public view returns(uint){
        return age+1;
    }

    function getName() public view returns(string memory){
        return string.concat(name,"!");
    }
}