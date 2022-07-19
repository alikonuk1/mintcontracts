// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./MintERC20SB.sol";

error MintPriceNotPaid();

contract FactoryERC20SB {

    event NewERC20SB(string, string, address);

    uint256 public constant MINT_PRICE = 10 ether;

    function buildERC20SB(
        string memory _name, 
        string memory _symbol, 
        uint8 _decimals,
        address _owner
        ) public payable {
        if (msg.value != MINT_PRICE) {
            revert MintPriceNotPaid();
        }
        MintERC20SB e2 = new MintERC20SB(_name, _symbol, _decimals, _owner);
        emit NewERC20SB(_name, _symbol, address(e2));
    }
}