// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/console.sol";

import "./MintERC721SB.sol";

contract FactoryERC721SB {

    event NewERC721SB(string, string, address);

    function buildERC721SB(
        string memory _name, 
        string memory _symbol, 
        string memory _baseURI,
        address _owner
        ) public payable {
        MintERC721SB e7 = new MintERC721SB(_name, _symbol, _baseURI, _owner);
        console.log("ERC721SB contract:", address(e7));
        emit NewERC721SB(_name, _symbol, address(e7));
    }
}