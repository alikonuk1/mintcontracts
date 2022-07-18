// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "sirius/tokens/ERC721SB.sol";
import "./utils/Strings.sol";

error NonExistentTokenURI();

contract MintERC721SB is ERC721SB {
    
    string public baseURI;
    uint256 public currentTokenId;
    address public owner;
    address public holder;

    using Strings for uint256;
    
    constructor(
        string memory _name,
        string memory _symbol,
        string memory _baseURI,
        address _owner
    ) ERC721SB(_name, _symbol) {
        baseURI = _baseURI;
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint!");
        _;
    }

    modifier onlyHolder() {
        require(msg.sender == holder, "Only recipient can burn!");
        _;
    }

    function mintTo(address recipient) public payable onlyOwner returns (uint256) {
        uint256 newTokenId = ++currentTokenId;
        _safeMint(recipient, newTokenId);
        holder = recipient;
        return newTokenId;
    }

    function burn(uint256 id) public onlyHolder {
        _burn(id);
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