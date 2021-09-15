pragma solidity 0.8.4;

contract Lottery {
    uint public manager;
    
        function add() public {
        manager = msg.value;
    }
}
