// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "sirius/tokens/ERC721SB.sol";
import "./utils/Strings.sol";

error NonExistentTokenURI();

contract MintERC721SB is ERC721SB {
    
    string public baseURI;
    uint256 public currentTokenId;
    using Strings for uint256;
    
    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI
    ) ERC721SB(_name, _symbol) {
        baseURI = _baseURI;
    }

    function mintTo(address recipient) public payable returns (uint256) {
        uint256 newTokenId = ++currentTokenId;
        _safeMint(recipient, newTokenId);
        return newTokenId;
    }

    function tokenURI(uint256 tokenId)
        public
        view
        virtual
        override
        returns (string memory)
    {
        if (ownerOf(tokenId) == address(0)) {
            revert NonExistentTokenURI();
        }
        return
            bytes(baseURI).length > 0
                ? string(abi.encodePacked(baseURI, tokenId.toString()))
                : "";
    }
}