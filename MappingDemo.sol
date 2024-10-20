// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract MappingDemo {
    mapping(address => uint256) public balance;

    function balanceOf() public view returns (uint256) {
        return balance[msg.sender];
    }

    function setBalance (uint256 value) public {
        //msg.sender是指合约的发送者
        balance[msg.sender] = value;
    }
}
