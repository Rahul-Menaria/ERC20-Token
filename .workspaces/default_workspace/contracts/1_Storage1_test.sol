
pragma solidity ^0.8.7;

contract Lottery{
    address public manager;
    address[] public players;
    
    function enter() public payable{
        require(msg.value > 0.1 ether);
        
        players.push(msg.sender);
    }
    
    constructor(){
        manager = msg.sender;
    }
    
    function random() private view returns (uint){
        return uint(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
    }
    
    function pickWinner() public managerCanOnlyCall{
        
        uint Index = random() % players.length;
        payable(address(uint160(players[Index]))).transfer(address(this).balance);
        players = new address [](0);

    }
    
    function playerList() public view returns (address[] memory){
        return players;
    }
    modifier managerCanOnlyCall () {
        require(msg.sender==manager);
        _;
    }
    
}