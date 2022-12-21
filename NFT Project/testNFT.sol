//SPDX-License-Identifier: MIT

pragma solidity 0.8.13;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';
import '@openzeppelin/contracts/access/Ownable.sol';

contract testNFT is ERC721, Ownable{
    uint totalSupply;
    uint maxSupply;
    string baseURL;
constructor(string memory enteredURL, uint max)ERC721("testNFT","TN"){
   
    maxSupply = max;
    baseURL = enteredURL;

}

function _baseURI() internal view override returns(string memory){
    return baseURL;
}

function safeMint(address to) public onlyOwner{
    require(maxSupply > totalSupply,"already minted max");
    uint tokenID = totalSupply;
    totalSupply++;
    _mint(to,tokenID);
}
}