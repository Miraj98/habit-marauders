


pragma solidity ^0.4.24;

import "./HabitContract.sol";
import "./TokenContract.sol";

contract TrackHabit is TokenContract, HabitContract {

    mapping (address => uint) internal fundsLocked;
    mapping (address => mapping(uint => Habit)) internal habitSessionsCompleted;
    mapping (address => mapping(uint => uint)) internal sessionTimestamps;

    event AllHealthConsumed(address _address);

    function startHabit(
        string _name,
        string _description,
        uint _periodicity,
        uint _totalSessions
    ) external payable {
        require(msg.value >= 0);

        fundsLocked[msg.sender] = msg.value;
        addHabit(_name, _description, _periodicity, _totalSessions);
        sessionTimestamps[msg.sender][avatars[avatar_id_of[msg.sender]].number_of_habits-1] = now;
    }

    function markSessionAsComplete(uint habitId) external {

        uint timeOfLastSession = sessionTimestamps[msg.sender][habitId]*1 seconds;
        uint _periodicity = avatars[avatar_id_of[msg.sender]].Habits[habitId].periodicity;
        int sessionsMissed = int(now - timeOfLastSession/_periodicity);
        Avatar storage avatar = avatars[avatar_id_of[msg.sender]];

        if(sessionsMissed > 0) {
            avatar.health = avatar.health - 10*uint(sessionsMissed);
            if(avatar.health >= 100) {
                emit AllHealthConsumed(msg.sender);
                deleteHabit(habitId);
                avatar.health = 100;
                return;
            }
        }

        avatar.Habits[habitId].sessionsCompleted++;

        if(avatar.Habits[habitId].sessionsCompleted == avatar.Habits[habitId].totalSessions) {
            totalSupply_ = totalSupply_ + fundsLocked[msg.sender];
            deposit(msg.sender, fundsLocked[msg.sender]);
            avatar.health = 100;
            deleteHabit(habitId);
        }
    }

}
