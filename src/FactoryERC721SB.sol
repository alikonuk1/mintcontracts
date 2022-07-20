// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./MintERC721SB.sol";

error MintPriceNotPaid();

contract FactoryERC721SB {

    event NewERC721SB(string, string, address);

    uint256 public MintPrice;
    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "Only Admin!");
        _;
    }

    constructor(address _admin) {
        admin = _admin;
    }

    function setMintPrice(uint256 mintPrice) external onlyAdmin {
        MintPrice = mintPrice;
    }

    function getMintPrice() public view returns (uint256) {
        return MintPrice;
    }

    function withdrawFunds() external onlyAdmin {
        (bool sent, ) = admin.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether to admin");
    }

    function buildERC721SB(
        string memory _name, 
        string memory _symbol, 
        string memory _baseURI,
        address _owner
        ) public payable {
        if (msg.value != MintPrice) {
            revert MintPriceNotPaid();
        }
        MintERC721SB e7 = new MintERC721SB(_name, _symbol, _baseURI, _owner);
        emit NewERC721SB(_name, _symbol, address(e7));
    }
}