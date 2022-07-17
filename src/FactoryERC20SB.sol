// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "forge-std/console.sol";

import "./MintERC20SB.sol";

contract FactoryERC20SB {

    event NewERC20SB(string, string, address);

    function buildERC20SB(
        string memory _name, 
        string memory _symbol, 
        uint8 _decimals,
        address _owner
        ) public payable {
        MintERC20SB e2 = new MintERC20SB(_name, _symbol, _decimals, _owner);
        console.log("ERC20SB contract:", address(e2));
        emit NewERC20SB(_name, _symbol, address(e2));
    }
}