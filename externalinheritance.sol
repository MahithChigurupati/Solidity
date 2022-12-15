//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol';

contract ownerTest is Ownable{

    function onlyTheOwnerCancall() public view onlyOwner returns(uint){
        return 100;
    }

}

