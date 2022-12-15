//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract functions{
    function add(int a, int b) public pure returns(int){
        return a+b;
    }

    function addTwos() private pure returns(int){
        return 2+2;
    }


    string private name = "Dan";
    function getName() public view returns(string memory){
        return name;
    }

    function setName(string memory newName) public{
        name = newName;
    }
}