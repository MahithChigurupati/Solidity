//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract airDrop is ERC20("AIRDROP","AIR"){

    address public creator;

    constructor() payable{
        creator = msg.sender;
    }

    modifier onlyOwner(){
        require(msg.sender == creator, "Only owner is allowed");
        _;
    }

    function mintNewTokens(address[] memory addresses, uint amount) public onlyOwner{

        for(uint i=0;i<addresses.length;i++){
            _mint(addresses[i], amount*(10**18));
        }
        
    }
}