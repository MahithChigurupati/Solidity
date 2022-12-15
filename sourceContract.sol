//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Source{

    uint private value = 100;

    function getValue() view public returns(uint){
        return value;
    }

    function changeValue(uint newValue) public {
        value = newValue;
    }

}