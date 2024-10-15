// SPDX-License-Identifier: MIT

//智能合约的许可协议
pragma solidity ^0.8.7;

contract Visible {
    uint private x;

    constructor(uint _x) {
        x = _x;
    }

    //external- 只有其他合约或者账号可以调用，定义该函数的合约不能调用,除非使用this关键字
    function getX() external view returns (uint){
        return x;
    }

}