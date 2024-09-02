// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract PaymentContract{
    mapping(address =>uint256) public balances; 
    address owner;

    constructor(){
        owner=msg.sender;
    }

    function deposit()public payable{
        balances[msg.sender]+=msg.value;
    }

    function getBalance()public view returns(uint256){
        return address(this).balance;
    }
    function withdraw(address payable _to,uint256 _amount)public {
        require(msg.sender==owner,"Only the owner can withdraw funds");
        require(address(this).balance >= _amount,"Insufficient contract balance");
        _to.transfer(_amount);
    }
}