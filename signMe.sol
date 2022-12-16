//SPDX-License-Identifier:MIT

pragma solidity ^0.8.13;

// Sign my contract by using the "signMe" function. 
// Here is the address on Polygon POS: 0x#######...
// You have to give it who is signing as the first argument (an address).
// You have to give it the signature (the message) as the second argument (a string).
// It returns a string. 
// Hint: Since you don't have the code, use an interface

interface ISign{
    function signMe(address signer,string memory signature) external returns(string memory);
}

contract sign{

    function signing(address addressToSign) public {
        ISign IS = ISign(addressToSign);
        IS.signMe(msg.sender,"message");
    }
}

// Create a token with your name, and give 5 tokens to the contract above.

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract myToken is ERC20("MAHITH","MC"){

    function sendToken(address toAddress, uint amount) public{
        _mint(toAddress,amount);
    }
    
}