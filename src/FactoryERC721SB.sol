// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./MintERC721SB.sol";

error MintPriceNotPaid();

contract FactoryERC721SB {

    event NewERC721SB(string, string, address);

    uint256 public constant MINT_PRICE = 10 ether;

    function buildERC721SB(
        string memory _name, 
        string memory _symbol, 
        string memory _baseURI,
        address _owner
        ) public payable {
        if (msg.value != MINT_PRICE) {
            revert MintPriceNotPaid();
        }
        MintERC721SB e7 = new MintERC721SB(_name, _symbol, _baseURI, _owner);
        emit NewERC721SB(_name, _symbol, address(e7));
    }
}