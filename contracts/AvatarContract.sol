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
    mapping (address => uint) public avatarIdOf;

    function generateUniqueId(address _address) internal pure returns(uint) {
        return uint(keccak256(abi.encodePacked(_address)))%10**16;
    }

    function createAvatar(string _name) external {
        address caller = msg.sender;
        uint dna = generateUniqueId(caller);
        avatarIdOf[caller] = avatars.length;
        avatars.push(Avatar(_name, 100, dna, 0, 0));
    }

    function getAvatar() external view returns(string) {
        return avatars[avatarIdOf[msg.sender]].name;
    }
    
    
}
