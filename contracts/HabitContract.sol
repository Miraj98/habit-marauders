pragma solidity ^0.4.24;

import "./AvatarContract.sol";

contract HabitContract is AvatarContract {
    
    function addHabit(
        string _name,
        string _description,
        uint _periodicity,
        uint _totalSessions) internal {
        Avatar storage avatar = avatars[avatarIdOf[msg.sender]];   
        avatar.Habits[avatar.numberOfHabits] = Habit(_name, _description, _periodicity, _totalSessions, 0);
        avatar.number_of_habits++;
        
    }

    function getHabit( uint habitId) external view returns(string, string, uint, uint, uint) {
        Avatar storage avatar = avatars[avatarIdOf[msg.sender]];
        string storage _title = avatar.Habits[habitId].title;
        string storage _description = avatar.Habits[habitId].description;
        uint _periodicity = avatar.Habits[habitId].periodicity;
        uint _totalSessions = avatar.Habits[habitId].totalSessions;
        uint _sessionsCompleted = avatar.Habits[habitId].sessionsCompleted;
        return (_title, _description, _periodicity, _totalSessions, _sessionsCompleted);
    }

    function deleteHabit(uint habitId) public {
        Avatar storage avatar = avatars[avatarIdOf[msg.sender]];
        avatar.Habits[habitId] = avatar.Habits[avatar.number_of_habits-1];
        delete avatar.Habits[avatar.number_of_habits-1];
        avatar.number_of_habits--;

    }

    function getNumberOfHabits() external view returns(uint) {
        return avatars[avatarIdOf[msg.sender]].numberOfHabits;
    }
}
