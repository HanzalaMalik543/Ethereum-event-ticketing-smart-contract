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
        Event storage _event = events[id];
        require(msg.value == (_event.price*quantity),"Not enough Ether");
        require(_event.ticketRemain>=quantity,"Not enough tickets!");
        _event.ticketRemain -= quantity;
        tickets[msg.sender][id]+=quantity;
    }

    function transferTicket(uint id,uint quantity,address to)external{
        require(events[id].date!=0,"Error! Event does not exist.");
        require(block.timestamp<events[id].date,"Event has already ended.");
        require(tickets[msg.sender][id]>=quantity,"Not enough tickets.");
        tickets[msg.sender][id]-=quantity;
        tickets[to][id]+=quantity;
    }
}