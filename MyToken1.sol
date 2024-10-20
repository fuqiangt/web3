// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Permit.sol";

contract MyToken1 is ERC20, ERC20Permit {
    constructor() ERC20("MyToken1", "MTK2") ERC20Permit("MyToken1") {
        _mint(msg.sender, 10000000 * 10 ** decimals());
    }
}

contract MyToken4 is ERC20, ERC20Permit {
    constructor() ERC20("MyToken4", "MTK4") ERC20Permit("MyToken4") {
        _mint(msg.sender, 200000000 * 10 ** decimals());
    }
}