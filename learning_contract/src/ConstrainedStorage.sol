// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract ConstrainedStorage {
    uint256 public storedData;
    address public owner;

    constructor(){
        owner=msg.sender;
    }

    function set(uint256 _data)public{
        require(_data<=100,"It's over 100");
        storedData=_data;
    }
    function get()public view returns(uint256){
        return storedData;
    }
    function reset(address)public{
        require(msg.sender==owner,"Only the owner can reset the value");
        storedData=0;

    }
}