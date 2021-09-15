pragma solidity >=0.4.22 <0.9.0;

contract Inbox {
    string public message;
    
function Inbox(intialMessage) public {
    message = intialMessage;
}

function setMessage(insertedMessage) public{
    message = insertedMessage;
}
    
}