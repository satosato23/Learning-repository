// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract SimpleBank{
  
    struct Userlist{
        string username;
        uint256 userbalance;
    }
    mapping(address=>Userlist)public userlist;
    mapping(string=>bool)public registeredUsernames;

    event UserRegistered(address indexed user,string username);
    event Deposit(address indexed user,uint256 amount);
    event Withdraw(address indexed user,uint256 amount,address to);

    function addUser(string memory _username)public{
        require(bytes(userlist[msg.sender].username).length==0,"User is already registered");
        require(!registeredUsernames[_username], "Username is already taken");
        userlist[msg.sender]=Userlist({
            username:_username,
            userbalance:0
        });
        registeredUsernames[_username] = true;

        emit UserRegistered(msg.sender, _username);
    }

    function deposit()public payable{
        require(bytes(userlist[msg.sender].username).length!=0,"User is not registered");
        userlist[msg.sender].userbalance +=msg.value;

        emit Deposit(msg.sender, msg.value);

    }
    function withdraw(address payable _to,uint256 _amount)public payable{
        require(bytes(userlist[msg.sender].username).length!=0,"User is not registered");
        require(userlist[msg.sender].userbalance>=_amount,"Insufficient balance");
        userlist[msg.sender].userbalance-=_amount;
        _to.transfer(_amount);

        emit Withdraw(msg.sender,_amount,_to);
    }
    function balance()public view returns(uint256){
        require(bytes(userlist[msg.sender].username).length!=0,"User is not registered");
        return userlist[msg.sender].userbalance;
    }
}   