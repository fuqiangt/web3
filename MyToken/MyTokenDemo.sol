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

    // 授权代币的转发
    function approve(address spender, uint256 amount) public returns (bool) {
        //银行授权给我(银行要贷款给我)
        address owner = _msgSender();
        //owner 是授权人
        //spender 被授权人
        _approve(owner, spender, amount);
        return true;
    }

    // 返回授权代币数量
    function allowanceOf(address owner, address spender)
        public
        view
        returns (uint256)
    {
        return _allowance[owner][spender];
    }

    // 授权代币转发
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public returns (bool) {
        address owner = _msgSender();
        //更新授权账户信息,from:表示银行，owner：谁操作这个函数的人，
        _spendAllowance(from, owner, amount);
        //执行转账,from：银行，to:我自己，中介公司，买房人
        _transfer(from, to, amount);

        return true;
    }

    //5.事件,主要是返回给前端调用
    event Transfer(address from, address to, uint256 amount);
    event Approval(address owner, address spender, uint256 amount);

    //6.合约内部函数
    function _mint(address account, uint256 amount) internal {
        require(account != address(0), "ERC20:mint to the zero address");
        // 初始化货币数量
        _totalSupply += amount;
        // 给某个账号注入起始资金
        unchecked {
            _balances[account] += amount;
        }
    }

    function _transfer(
        address from,
        address to,
        uint256 amount
    ) internal {
        require(
            from != address(0),
            "ERC20:_transfer to the zero [from] address"
        );
        require(to != address(0), "ERC20:_transfer to the zero [to] address");
        uint256 fromBalance = _balances[from];
        require(fromBalance >= amount, "ERC20:amount is less than fromBalance");
        unchecked {
            _balances[from] = fromBalance - amount;
            _balances[to] += amount;
        }
        emit  Transfer(from,to,amount);
    }

    /*

    0x5B38Da6a701c568545dCfcB03FcB875f56beddC4
    0xAb8483F64d9C6d1EcF9b849Ae677dD3315835cb2
    0x358AA13c52544ECCEF6B0ADD0f801012ADAD5eE3
    

    合约地址：
    0x4B04415bb6aa7Bbc6cc7F99428A8a8Aa9f19Ae78
    0xa15540037B3976420a8e10029555972990B2Bb24   
    0x04C8e9c3E164524AE440CAf34087DCa94D933048
    0x47ced995b0d6d7acaab7688ffec565c708086202

    _allowance存储数据结构：
    {
        0x4B04415bb6aa7Bbc6cc7F99428A8a8Aa9f19Ae78:{
            0xa15540037B3976420a8e10029555972990B2Bb24:100w
        },
        [0x4B04415bb6aa7Bbc6cc7F99428A8a8Aa9f19Ae78][0xa15540037B3976420a8e10029555972990B2Bb24]=100w
        0xa15540037B3976420a8e10029555972990B2Bb24:{
            0x04C8e9c3E164524AE440CAf34087DCa94D933048:200w
        }
    }
    */
    function _approve(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        require(owner != address(0), "ERC20:_approve to the zero address");
        require(spender != address(0), "ERC20:_approve to the zero address");
        //执行授权
        _allowance[owner][spender] = amount;
        emit Approval(owner,spender,amount);
    }

    /*
    owner:表示银行，
    spender：谁操作这个函数的人，
    */
    function _spendAllowance(
        address owner,
        address spender,
        uint256 amount
    ) internal {
        uint256 currentAllowance = allowanceOf(owner, spender);
        if (currentAllowance != type(uint256).max) {
            require(
                currentAllowance >= amount,
                unicode"ERC20：owner balance is less than amount!"
            );
            unchecked {
                _approve(owner, spender, currentAllowance - amount);
            }
        }
    }

    /*
        事件
        
    */
}