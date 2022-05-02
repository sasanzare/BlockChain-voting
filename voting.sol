// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;

contract Voting {

    struct Candidate{
        uint id;
        string name;
        uint128 VoteCount;
    }

    mapping(uint=>Candidate)public Candidates;
    mapping(address=>bool)Participants;

    uint128 public CandidateCount;
    address owner;
    
    constructor(){
        owner = msg.sender;
    }

    function AddCandidate(string memory name)public returns (string memory) {
        require(msg.sender==owner,"You can not add a candidate!");
        CandidateCount++;
        Candidates[CandidateCount]=Candidate(CandidateCount,name,0);
        return "Candidate added.";
    }

    function Vote(uint id)public returns (string memory) {
        require(id<=CandidateCount && id>0,"No candidate found!");
        require(Participants[msg.sender]== false,"You have already voted!");
        Candidates[id].VoteCount++;
        Participants[msg.sender]=true;
        return "Thank you for your vote.";
    }

    function ShowWinner()view public returns (string memory) {
        uint winnerId =0;
        uint winnerVote=0;

        for(uint i =1;i<=CandidateCount;i++){
            if (Candidates[i].VoteCount>=winnerVote) {
                winnerId=i;
                winnerVote=Candidates[i].VoteCount;
            }
        }
        return Candidates[winnerId].name;
    }
}