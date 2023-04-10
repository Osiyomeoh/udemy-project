//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Examplemapping {
    mapping (uint => bool) public Mymapping;
    mapping(address => bool) public MymappedAddress;

    function setmyVar(uint _index) public{
               Mymapping[_index] = true;
    }

    function setmyAddress() public{
        MymappedAddress[msg.sender] = true;
    }

}