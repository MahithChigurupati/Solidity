//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract homeWork{
    function addNumbers(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    string public name = "Mahith";

    function myName() public view returns(string memory){
        return name;
    }

    function cookies(string memory food) public pure returns(string memory){
        if(keccak256(bytes(food))==keccak256(bytes("cookie"))){
            return 'yum';
        }else{
            return 'yuck';
        }
    }

    function party(int a, int b) public pure returns(string memory){
        if(a+b==10){
            return "party";
        }else{
            return "";
        }
        
    }


    function multiples(int a) public pure returns(int){
        int count = 1;
        for(int i=0; i<a; i++){
            count=count*2;
        }
        return count;
    }
}