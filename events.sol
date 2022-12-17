//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract events{

    event log1(uint a, address ad, string text);
    event log2(uint indexed a, address ad, string text);
    event log3(uint a, address ad, string indexed text);

    function callLog1() public{
        emit log1(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "test" );
    }

    function callLog2() public{
        emit log2(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "test" );
    }

    function callLog3() public{
        emit log3(5, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "test" );
    }
}