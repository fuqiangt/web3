// SPDX-License-Identifier: MIT

//智能合约的许可协议
pragma solidity ^0.8.7;

contract HelloWorld {
    // 状态变量，放在区域链上
    string public name;
    uint public version;

    constructor() {
        name = "web3";
        version = 1;
    }

    function sayName() public view returns (string memory) {
        return name;
    }

    function changeName(string memory _name) public  {
        // 局部变量
        uint num = 123;
        version = num;
        name = _name;        
    }
}
