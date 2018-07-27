pragma solidity ^0.4.24;

import "./AvatarContract.sol";

contract HabitContract is AvatarContract {
    
    function addHabit(
        string _name,
        string _description,
        uint _periodicity,
        uint _totalSessions) internal {
            
        avatars[avatar_id_of[msg.sender]].Habits[avatars[avatar_id_of[msg.sender]].number_of_habits] = Habit(_name, _description, _periodicity, _totalSessions, 0);
        avatars[avatar_id_of[msg.sender]].number_of_habits++;
        
    }

    function getHabit( uint habitId) external view returns(string,string,uint,uint,uint) {
        string storage _title = avatars[avatar_id_of[msg.sender]].Habits[habitId].title;
        string storage _description = avatars[avatar_id_of[msg.sender]].Habits[habitId].description;
        uint _periodicity = avatars[avatar_id_of[msg.sender]].Habits[habitId].periodicity;
        uint _totalSessions = avatars[avatar_id_of[msg.sender]].Habits[habitId].totalSessions;
        uint _sessionsCompleted = avatars[avatar_id_of[msg.sender]].Habits[habitId].sessionsCompleted;
        return (_title,_description,_periodicity,_totalSessions,_sessionsCompleted);
    }

    function deleteHabit(uint habitId) external {
        avatars[avatar_id_of[msg.sender]].Habits[habitId] = avatars[avatar_id_of[msg.sender]].Habits[avatars[avatar_id_of[msg.sender]].number_of_habits-1];
        delete avatars[avatar_id_of[msg.sender]].Habits[avatars[avatar_id_of[msg.sender]].number_of_habits-1];
        avatars[avatar_id_of[msg.sender]].number_of_habits--;

    }

    function getNumberOfHabits() external view returns(uint) {
        return avatars[avatar_id_of[msg.sender]].number_of_habits;
    }
}