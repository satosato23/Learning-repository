// SPDX-License-Identifier: MIT
pragma solidity^0.8.0;

contract VotingContract{
    address public owner;
    
    struct Candidate{
        string name;
        uint256 voteCount;
    }
    mapping(address=>bool)public Votedata;
    mapping(uint256=>Candidate)public candidates;
    uint256 public candidatesCount=0;

    constructor(){
        owner=msg.sender;
    }

    function addCandidates(string memory _name)public {
        require(msg.sender==owner,"Only the owner can add candidates");
        candidatesCount++;
        candidates[candidatesCount]=Candidate(_name,0);
    }

    function vote(uint256 _candidateId)public{
        require(!Votedata[msg.sender],"You have already voted");
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
        
        Votedata[msg.sender]=true;
        candidates[_candidateId].voteCount++;
    }
    function getCandidateVoteCount(uint256 _candidateId) public view returns (uint256) {
        require(_candidateId > 0 && _candidateId <= candidatesCount, "Invalid candidate ID");
        return candidates[_candidateId].voteCount;
    }
   
}