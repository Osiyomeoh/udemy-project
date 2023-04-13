//SPDX-License-Identifier: MIT

pragma solidity 0.8.15;

contract Examplemapping {
    mapping (uint => bool) public Mymapping;
    mapping(address => bool) public MymappedAddress;
    mapping(uint => mapping(uint => bool)) public uintmaptomapping;
    function setmyVar(uint _index) public{
               Mymapping[_index] = true;
    }

    function setmyAddress() public{
        MymappedAddress[msg.sender] = true;
    }

    function setUintUintBoolMapping (uint _key1, uint _key2, uint _value) public {
        uintmaptomapping[_key1][_key2] = true;
    }

}