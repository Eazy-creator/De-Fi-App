//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract BuyMeACoffee {
    // Event to emit when a Memo is created
    event NewMemo(
        address indexed from,
        uint256 timestamp,
        string name,
        string message
    );

    //Memo Struct
    struct Memo {
        address from;
        uint256 timestamp;
        string name;
        string message;
    
    }

    // List of all memos received from friends
    Memo[] memos;




    // Address of contract deployer 
    address payable owner;


    // Deploy logic
    constructor() {
        owner = payable(msg.sender);
    }



    function buyCoffee( string memory _name, string memory _message) public payable {
        require(msg.value > 0, "cant buy a coffee with 0 eth");

    memos.push(Memo(
        msg.sender,
        block.timestamp,
        _name,
        _message
    ));

    // Emit a Log event when a new Memo is created! 

    emit NewMemo(
        msg.sender,
        block.timestamp,
        _name,
        _message
    );

    }


    function withdrawTips() public {
        address(this).balance
        require(owner.send(address(this).balance));
        
    }

    function getMemos() public view returns(Memo[] memory) {
        return memos;
    }


    }

}
    