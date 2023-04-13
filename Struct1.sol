//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract wallet {
    paymentRecieved public payment;

    function PayContract() public payable {
        payment = new paymentRecieved(msg.sender, msg.value);
    }


}
contract paymentRecieved{
    address public from;
    uint public amount;

    constructor(address _from, uint _amount){
        from = _from;
        amount = _amount;
    }
} 
contract wallet2 {
    struct paymentRecievedStruct {
        address from;
        uint amount;
    }

    paymentRecievedStruct public payment;

    function payContract() public payable {
        //payment = paymentRecievedStruct(msg.sender, msg.value);
        payment.from = msg.sender;
        payment.amount = msg.value;
    }
}