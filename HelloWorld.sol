// SPDX-License-Identifier: MIT

//智能合约的许可协议
pragma solidity ^0.8.7;
contract HelloWorld {
    string public name;
    int public version;

    constructor() {
        name = 'web3';
        version = 1;
    }
}