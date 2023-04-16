//SPDX-License-Identifier: MIT
pragma solidity 0.8.16;

contract EventExample {

    mapping(address => uint) public tokenBalance;

    constructor() {
        tokenBalance[msg.sender] = 100;
    }

    function sendToken(address _to, uint _amount) public returns(bool) {
        require(tokenBalance[msg.sender] >= _amount, "Not enough tokens");
        tokenBalance[msg.sender] -= _amount;
        tokenBalance[_to] += _amount;
        return true;
    }
}
