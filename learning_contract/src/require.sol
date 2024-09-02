// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Requirement{
    uint256 public Storage;
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    function set(uint256 _data)public{
        require(owner==msg.sender,"owner is msg.sender");
        Storage=_data;
    }

    function get()public view returns(uint256){
        return Storage;
    }

    function reset(address)public {
        require(msg.sender==owner,"owner only");
        Storage=0;
    }
}