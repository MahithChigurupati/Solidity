//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract elbow{

    uint private age = 24;

    function bend() public pure virtual returns(string memory){
        return "Bending";
    }

    function getAge() public view returns(uint){
        return age;
    }

}

contract leftArm is elbow{

    function raise() public virtual returns(string memory){
        return string.concat("Left Arm is ",bend());
    }
}

contract rightArm is elbow{

    function raise() public virtual returns(string memory){
        return string.concat("Right Arm is ",bend());
    }
}

contract knee is elbow{

    function getBend() public pure returns(string memory){
        return super.bend();
        
    }
    function kick() public pure returns(string memory){
        return "kicking";
    }
}

contract person is leftArm,rightArm{

    function raise() public pure override(leftArm,rightArm) returns(string memory){
        return string.concat("Both arms are", bend());
    }
}

contract alien is rightArm, knee{

    function bend() public pure override returns(string memory){
        return "flying";
    }

    function fly() public pure returns(string memory){
        return string.concat(kick(),bend());
    }
}
