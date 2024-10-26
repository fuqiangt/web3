// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

import "./Context.sol";

contract MyTokenDemo is Context {
    // - 1.代币信息设置-
    // - 代币名称 name,变量使用下划线表示只能当前合约(contract)访问。
    string private _name;
    // - 代币标识 symbol
    string private _symbol;
    // - 代币精度(小数位数) decimals,10的18次方，1eth=10的18次方Wei
    uint8 private _decimals;
    // - 代币总发行量 totalSupply
    uint256 private _totalSupply;
    // - 代币数量 balanceOf,某个账号下面有多少代币?
    mapping(address => uint256) private _balances;
    // - 授权代币数量 allowance
    mapping(address => mapping(address => uint256)) private _allowance;

    // - 2.初始化-
    constructor() {
        _name = "TangCoin";
        _symbol = "TGC";
        _decimals = 18;
        // 初始化货币池
        _mint(_msgSender(), 100000000 * 10**_decimals);
    }

    // - 合约内部函数-
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20:mint to the zero address");
        // 初始化货币数量
        _totalSupply += amount;
        // 给某个账号注入起始资金
        unchecked {
            _balances[account] += amount;
        }
    }

    // -3.取值器-
    // 返回代币的名字 name()
    function name() public view returns (string memory) {
        return _name;
    }

    // 返回代币标识
    function symbol() public view returns (string memory) {
        return _symbol;
    }

    // 返回代币的小数位数
    function decimals() public view returns (uint8) {
        return _decimals;
    }

    // 返回代币的总发行量
    function totalSupply() public view returns (uint256) {
        return _totalSupply;
    }

    // 返回账户拥有的代币数量
    function balanceOf(address _owner) public view returns (uint256 balance) {
        return _balances[_owner];
    }

    // - 4.函数 -
    // 代币转账
    function transfer(address _to, uint256 _value) public returns (bool) {
        address ower = _msgSender();
        _transfer(ower, _to, _value);
        return true;
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal {
        require(from != address(0), "ERC20:mint to the zero address");
        require(to != address(0), "ERC20:mint to the zero address");
        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20:amount is less than fromBalance");
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }
    }

    function transferFrom(address _from,address _to,uint256 amount) public returns (bool) {
        address owner = _msgSender();
        _transfer(owner, _to, amount);

        return true;
    }

    /*  
        方法        
        function approve(address _spender, uint256 _value) public returns (bool success)
        function allowance(address _owner, address _spender) public view returns (uint256 remaining)
    */

    /*
        事件
        event Transfer(address indexed _from, address indexed _to, uint256 _value)
        event Approval(address indexed _owner, address indexed _spender, uint256 _value)
    */
}
