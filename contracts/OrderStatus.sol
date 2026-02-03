// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract OrderStatus {
    enum Status {
        Pending,
        Shipped,
        Delivered,
        Cancelled
    }

    mapping(uint => Status) public orders;
    uint public orderCount;

    // Create a new order (starts as Pending)
    function createOrder(uint _orderId) public {
        require(orders[_orderId] == Status.Pending && _orderId != 0 || orders[_orderId] == Status(0) && _orderId > orderCount, "Order already exists");
        orders[_orderId] = Status.Pending;
        if (_orderId > orderCount) {
            orderCount = _orderId;
        }
    }

    // Update status of a specific order
    function updateStatus(uint _orderId, Status _newStatus) public {
        orders[_orderId] = _newStatus;
    }

    // Get current status of a specific order
    function getCurrentStatus(uint _orderId) public view returns(Status) {
        return orders[_orderId];
    }
}