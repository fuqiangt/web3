// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract MyTokenDemo {
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
    mapping(address=>mapping(address=>uint256)) private _allowance;

    // - 2.初始化-
    constructor(){
        _name = "TangCoin";
        _symbol = "TGC";
        _decimals = 18;
        
    }

    /*  
        方法
        function name() public view returns (string)
        function symbol() public view returns (string)
        function decimals() public view returns (uint8)
        function totalSupply() public view returns (uint256)
        function balanceOf(address _owner) public view returns (uint256 balance)
        function transfer(address _to, uint256 _value) public returns (bool success)
        function transferFrom(address _from, address _to, uint256 _value) public returns (bool success)
        function approve(address _spender, uint256 _value) public returns (bool success)
        function allowance(address _owner, address _spender) public view returns (uint256 remaining)
    */

    /*
        事件
        event Transfer(address indexed _from, address indexed _to, uint256 _value)
        event Approval(address indexed _owner, address indexed _spender, uint256 _value)
    */
}
