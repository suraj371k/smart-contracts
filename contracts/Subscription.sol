// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Subscription {
    enum State {
        Inactive , Active , Suspended , Cancelled
    }

    mapping (address => State) public status;

    function makeActive(address _addr) public {
        status[_addr] = State.Active;
    }

    function suspend(address _addr) public {
        status[_addr] = State.Suspended;
    }

    function cancel(address _addr) public {
        status[_addr] = State.Cancelled;
    }

    function isActive() public view returns (bool){
        return status[msg.sender] == State.Active;
    }

   function get() public view returns (address){
    return msg.sender;
   }
    
}