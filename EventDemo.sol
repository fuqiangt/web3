// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract EventDemo {
    event Log(uint);
    event Log(string);
    event Log(address);

    function foo() public {
        emit Log(100);
        emit Log(unicode"你好!");
        emit Log(msg.sender);
    }
}