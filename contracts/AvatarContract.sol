pragma solidity ^0.4.24;


contract AvatarContract {

    struct Habit {
        string title;
        string description;
        uint periodicity;
        uint totalSessions;
        uint sessionsCompleted;
    }

    struct Avatar {
        string name;
        uint health;
        uint avatar_dna;
        uint number_of_habits;
        uint amount_locked;
        mapping (uint => Habit) Habits;
    }

    Avatar[] public avatars;
    mapping (address => uint) public avatar_id_of;

    function generateUniqueId(address _address) internal pure returns(uint) {
        return uint(keccak256(abi.encodePacked(_address)))%10**16;
    }

    function createAvatar(string _name) external {
        address caller = msg.sender;
        uint dna = generateUniqueId(caller);
        avatar_id_of[caller] = avatars.length;
        avatars.push(Avatar(_name, 100, dna, 0, 0));
    }

    function getAvatar() external view returns(string) {
        return avatars[avatar_id_of[msg.sender]].name;
    }
    
    
}