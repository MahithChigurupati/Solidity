//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract A{

    uint private value = 100;

    function getValue() view public returns(uint){
        return value;
    }

    function changeValue(uint newValue) public {
        value = newValue;
    }

}

contract B{

    function same() public view returns(uint){

        return A(0x9C9fF5DE0968dF850905E74bAA6a17FED1Ba042a).getValue();

        //return contractA.getValue();
    }
}