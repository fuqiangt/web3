// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ErrorDemo {
    uint public x = 100;
    uint public y = 200;

    function setX() public returns (uint) {
        //assert(x > y);
        require(x>y,unicode"100不大于200");
        y = 3000;
        return y;
    }
}
