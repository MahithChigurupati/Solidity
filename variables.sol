//SPDX-License-Identifier: MIT
// pragma solidity 0.8.13;
pragma solidity ^0.8.13;
// pragma solidity >= 0.8.13 < 0.9.5;


contract variables{
    int number1 =-1;
    int8 number22 = 22;
    int16 number222 = 222;
    int32 public number11 = 11;

    uint public number01 = 1;

    string public greet = 'hello world';
    string[2] public names = ['ram','laxman'];
    uint[] public infinite = [1,2,3,4,5,6];
    string[] public namesInfinite = ['robert','tom','chris'];

    mapping(string => int) public mapEx;

    address public myAddress = 0x61236DE2834fDcE9A4b4Fa3B68dDe39Eca7199Cb;

    enum  cryogen{gas,liquid,solid}

    cryogen public fuel = cryogen.gas;

    bool public switcher = true;

    bytes public eg = "0x1";
    bytes3 public e = "abc";


    struct car {
        uint wheels;
        string model;
        
    }

    car public mycar=car(4,"i20");

}

contract newOne{
    uint[3] newArray = [1,2,3];

    enum testOne{cloud, java, solidity}
    testOne test = testOne.cloud;

    struct cat{
        uint legs;
        string name;
    }

    cat nico = cat(4,"nico");

    mapping(int=>string) public testing;

}