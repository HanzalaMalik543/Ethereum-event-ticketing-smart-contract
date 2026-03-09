# Ethereum Event Ticketing Smart Contract

This project is a Solidity smart contract that allows users to create events, buy tickets, and transfer tickets on the Ethereum blockchain.

## Features

- Create events with name, date, price, and ticket count
- Buy tickets using Ether
- Transfer tickets to other users
- Track remaining tickets
- Prevent buying tickets after the event date

## Smart Contract Structure

### Event Struct

Each event stores:

- Organizer address
- Event name
- Event date (Unix timestamp)
- Ticket price
- Total tickets
- Remaining tickets

### Mappings

- `mapping(uint => Event)`  
  Stores event details by event ID.

- `mapping(address => mapping(uint => uint))`  
  Tracks how many tickets a user owns for a specific event.

## Functions

### createEvent
Creates a new event.

### buyTicket
Allows users to buy event tickets.

### transferTicket
Allows users to transfer their tickets to another address.

## Technologies Used

- Solidity
- Ethereum Smart Contracts

## Author

Hanzala Malik