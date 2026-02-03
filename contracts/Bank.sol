// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Bank {
    struct Accounts {
        address owner;
        uint balance;
        bool isActive;
    }

    mapping (address => Accounts) accounts;
     
    function createAccount() public {
        require(!accounts[msg.sender].isActive , "account already exist");
        accounts[msg.sender] = Accounts(msg.sender , 0 , true);
    }

    function deposit() public payable  {
       require(accounts[msg.sender].isActive , "Account is not active");
       require(msg.value > 0 , "deposit amount must be greater than 0");
       accounts[msg.sender].balance += msg.value;
    }

    function withdraw(uint _amount ) public {
        require(accounts[msg.sender].isActive, "Account not active");
        require(_amount > 0, "Amount should be greater than 0");
        require(accounts[msg.sender].balance >= _amount, "Insufficient balance");
        payable(msg.sender).transfer(_amount);
    }

    function deactivateAccount() public {
        require(accounts[msg.sender].isActive, "Account already inactive");
        accounts[msg.sender].isActive = false;
    }

    function getAccountDetails() public view returns (address , uint , bool){
        Accounts memory acc = accounts[msg.sender];
        return (acc.owner , acc.balance , acc.isActive);
    }
}