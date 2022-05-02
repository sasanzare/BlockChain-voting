// SPDX-License-Identifier: GPLV3
pragma solidity >=0.4.0 <0.9.0;

contract Voting {

    struct Candidate{
        uint id;
        string name;
        uint128 VoteCount;
    }

    mapping(uint=>Candidate)public Candidates;
    mapping(address=>Candidate)Participants;

    uint128 CondidateCount;
    address owner;
    
    constructor(){
        owner = msg.sender;
    }

    function AddCandidate(string memory name)public returns (string memory) {
        
    }
    function Vote(uint id)public returns (string memory) {
        
    }
    function ShowWinner()view public returns (string memory) {
        
    }
}