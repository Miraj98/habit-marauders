pragma solidity ^0.4.24;

import "./SafeMath.sol";
import "./TokenInterface.sol";

contract TokenContract is TokenInterface {
    using SafeMath for uint256;
    mapping(address => uint256) internal balances;

    uint256 internal totalSupply_ = 0;

    function totalSupply() public view returns (uint256) {
        return totalSupply_;
    }

    function transfer(address _to, uint256 _value) public returns (bool) {
        require(_value <= balances[msg.sender]);
        require(_to != address(0));

        balances[msg.sender] = balances[msg.sender].sub(_value);
        balances[_to] = balances[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function deposit(address _to, uint256 _value) internal {
        require(totalSupply_ >= _value);
        balances[_to] = balances[_to].add(_value);
    }

    function balanceOf(address _owner) public view returns (uint256) {
        return balances[_owner];
    }
    
}