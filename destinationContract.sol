//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import './sourceContract.sol';

contract destinationContract{

    address private use;
    constructor(address usable){
        use = usable;
    }

    function same() public view returns(uint){

        return Source(use).getValue();

        //return contractA.getValue();
    }
}