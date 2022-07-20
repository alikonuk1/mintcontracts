// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./MintERC20SB.sol";

error MintPriceNotPaid();

contract FactoryERC20SB {

    event NewERC20SB(string, string, address);

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

    function getMintPrice() public view returns(uint256) {
        return MintPrice;
    }

    function withdrawFunds() external onlyAdmin {
        (bool sent, ) = admin.call{value: address(this).balance}("");
        require(sent, "Failed to send Ether to admin");
    }

    function buildERC20SB(
        string memory _name, 
        string memory _symbol, 
        uint8 _decimals,
        address _owner
        ) public payable {
        if (msg.value != MintPrice) {
            revert MintPriceNotPaid();
        }
        MintERC20SB e2 = new MintERC20SB(_name, _symbol, _decimals, _owner);
        emit NewERC20SB(_name, _symbol, address(e2));
    }
}