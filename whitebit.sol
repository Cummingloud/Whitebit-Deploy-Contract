// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SimpleContract {
    address public owner;
    uint256 public value;
    
    event ValueUpdated(uint256 newValue);
    
    constructor(uint256 _initialValue) {
        owner = msg.sender;
        value = _initialValue;
    }
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the contract owner can call this function.");
        _;
    }
    
    function updateValue(uint256 _newValue) external onlyOwner {
        value = _newValue;
        emit ValueUpdated(_newValue);
    }
    
    function getValue() external view returns (uint256) {
        return value;
    }
}


