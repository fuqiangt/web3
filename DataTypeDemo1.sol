// SPDX-License-Identifier: MIT

pragma solidity ^0.8.7;

contract DataTypeDemo1 {
    // int8 x = 127;
    // uint y = 100;

    // // int 的最大最小值
    // int public minInt = type(int8).min;
    // int public mmaxInt = type(int8).max;

    // // uint 的最大最小值
    // uint public uminInt = type(uint8).min;
    // uint public ummaxInt = type(uint8).max;
    constructor () payable {

    }
    address public x1 = msg.sender;
    address public x2 = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    // 合约自己的地址
    address public x3 = address(this);
    //0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db

}