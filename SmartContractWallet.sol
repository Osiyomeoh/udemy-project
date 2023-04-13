//SPDX-License-Identifier: MIT 

pragma solidity 0.8.16;

contract Consumer{
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function deposit() public payable {}
}
contract SmartContractWallet {

    address payable owner;
    mapping(address => uint) public allowance;
    mapping(address => bool) public isAllowedToSend;
    mapping(address => bool) public guardians; 
    mapping( address => mapping(address => bool)) nextOwnerGuardiansVotedBool;

    address payable nextOwner;
    uint guardiansResetCount;
    uint public constant confirmationsFromGuardianForReset = 3;


    constructor(){
      owner = payable(msg.sender);
    }

    function setGuardian( address _guardian, bool _isGuardian) public {
        require(msg.sender == owner, "you are not owner, aborting");
        guardians[_guardian] = _isGuardian ;
    }

    function proposeNewOwner(address payable _newOwner) public {
        require(guardians[msg.sender], "you are not guardian of this wallet, aborting");
        require(nextOwnerGuardiansVotedBool[_newOwner][msg.sender] == false, "you already voted, aborting");
        if (_newOwner != nextOwner){
            nextOwner = _newOwner;
            guardiansResetCount = 0;
        }

        guardiansResetCount++;

        if(guardiansResetCount >= confirmationsFromGuardianForReset){
            owner = nextOwner;
            nextOwner = payable(address(0));
        }
    }

    function setAllowance(address _for, uint _amount) public {
        require(msg.sender == owner, "you are not the owner, aborting");
        allowance[msg.sender] = _amount;

        if (_amount > 0){
            isAllowedToSend[_for] = true;
        } else {
            isAllowedToSend[_for] = false;
        }
    }

    function transfer (address payable _to, uint _amount, bytes memory _payload) public returns(bytes memory){
        //require (msg.sender == owner, "you are not the owner");
        if(msg.sender != owner){
            require(isAllowedToSend[msg.sender], "you are not allowed to send anythinng from this smart contract aborting");
            require(allowance[msg.sender] >= _amount, "you are trying to send more than you are allowed to, aborting ");

            allowance[msg.sender] += _amount;

        }
        (bool success, bytes memory returnData) = _to.call{value: _amount}(_payload);
        require(success, "Aborting call was not certified");
        return returnData;
    }

    receive() external payable {}
    }
   
