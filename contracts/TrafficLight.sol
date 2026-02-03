// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract TrafficLight {
    enum Light {
        Red,
        Green,
        Yellow
    }

    Light public currentLight = Light.Red;

    function changeToNext() public {
        currentLight = Light((uint(currentLight) + 1) % 3);
    }

    function getCurrentStatus() public view returns (Light) {
        return  currentLight;
    }
}
