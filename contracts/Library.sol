// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

contract Library {
    struct Book {
        uint id;
        string title;
        string author;
        bool isAvailable;
    }

    mapping(uint => Book) books;

    function addBook(
        uint _id,
        string memory _title,
        string memory _author,
        bool _isAvailable
    ) public {
        books[_id] = Book(_id , _title, _author, _isAvailable);
    }

    function getBooks(uint _id) public view returns (Book memory){
        return books[_id];
    }


}
