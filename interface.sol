//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

interface ISource{
    function getValue() external view returns(uint);

}

contract user{

    address private useAddress;

    constructor(address sourceAddress){
        useAddress = sourceAddress;
    }

    function same() public view returns(uint){

        ISource contractSource = ISource(useAddress);
        return contractSource.getValue();
    }
    
}