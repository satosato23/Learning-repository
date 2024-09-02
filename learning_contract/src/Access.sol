// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract RestrictedStorage{
    uint256 storedData;
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    function set(uint256 _data)public{
        require(msg.sender==owner,"Only the owner can set the value");
        storedData=_data;
    }
    function get()public view returns(uint256){
        return storedData;
    }
}