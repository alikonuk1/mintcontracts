// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "sirius/tokens/ERC20SB.sol";

contract MintERC20SB is ERC20SB {
    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals
    ) ERC20SB(_name, _symbol, _decimals){}
}