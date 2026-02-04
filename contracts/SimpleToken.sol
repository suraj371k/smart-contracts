// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Token {
    uint public totalSupply;
    mapping (address => uint) balances;
    address public creator;

    constructor (uint _totalSupply){
        totalSupply = _totalSupply;
        creator = msg.sender;
        balances[msg.sender] = _totalSupply;
    }

    function getBalance(address _addr) public view returns (uint) {
        return balances[_addr];
    }

    function transferBalance(address _to , uint _amount) public {
        require(balances[msg.sender] > _amount , "insufficient balance" );
        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}