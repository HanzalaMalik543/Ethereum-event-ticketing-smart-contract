// SPDX-License-Identifier: MIT
pragma solidity ^0.8.14;

contract EventContract{
    struct Event{
        address organiser;
        string name;
        uint date;
        uint price;
        uint ticketCount;
        uint ticketRemain;
    }

    mapping (uint => Event) public events;
    mapping (address=>mapping(uint=>uint)) public tickets;
    uint public nextId;

    function createEvent(string memory name, uint date, uint price, uint ticketCount) external {
        require(date>block.timestamp,"You can only organise event for future dates!");
        require(ticketCount>0,"You can only organise event if you create more than 0 tickets.");

        events[nextId] = Event(msg.sender, name, date, price, ticketCount, ticketCount);
        nextId++;
    }

    function buyTicket(uint id,uint quantity) external payable{
        require(events[id].date!=0,"Error! Event does not exist.");
        require(block.timestamp<events[id].date,"Event has already ended.");
    }


}