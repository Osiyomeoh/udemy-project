//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract ExampleMapping2 {
    mapping(address => uint) balanceReceived; 
    function SendMoney() public payable{
        balanceReceived[msg.sender] += msg.value;

    }

    function WithdrawAllMoney(address payable _to) public {
       uint  balanceCheckout = balanceReceived[msg.sender];
       balanceReceived[msg.sender] = 0;
       _to.transfer(balanceCheckout);


    }
}