//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract multiSign{

    address[] public owners;
    mapping(address => bool) public ownerList;
    mapping(uint => mapping(address => bool)) public alreadyVoted;
    uint public approvalsNeeded;

    struct transaction{
        address sendTo;
        uint amount;
        uint approvals;
        bool execution;
    }

    transaction[] public proposedTransactions;

    constructor(){
        ownerList[msg.sender] = true;
        owners.push(msg.sender);
    }
    
    receive() external payable{}

    modifier onlyOwner{
        require(ownerList[msg.sender] == true, "Only owner is allowed");
        _;
    }

    function setApprovalsNeeded(uint need) public {
        approvalsNeeded = need;
    }

    function addOwner(address newOwner) onlyOwner public {
        owners.push(newOwner);
        ownerList[newOwner] = true;
    }

    function proposeTransaction(address to, uint value) public {
        proposedTransactions.push(transaction({
            sendTo: to,
            amount: value,
            approvals: 0,
            execution: false
        }));

    }

    function voteTransaction(uint index) onlyOwner public {
        require(alreadyVoted[index][msg.sender]==false, "Already voted");
        proposedTransactions[index].approvals += 1;
        alreadyVoted[index][msg.sender] = true;
    }

    function revokeVote(uint index) onlyOwner public {
        require(alreadyVoted[index][msg.sender]==true, "No Previous vote found to revoke");
        proposedTransactions[index].approvals -= 1;
        alreadyVoted[index][msg.sender] = false;
    }

    function executeTx(uint index) onlyOwner public{
        require(proposedTransactions[index].approvals >= approvalsNeeded,"No enough approvals");
        require(proposedTransactions[index].execution==false, "Already executed");

        address payable sender = payable(proposedTransactions[index].sendTo);
        (bool tryToSend,) = sender.call{value: proposedTransactions[index].amount, gas: 5000}("");
        require(tryToSend== true,"No enough ETH balance");
        proposedTransactions[index].execution = true;

    }

}

