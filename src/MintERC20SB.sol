// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "sirius/tokens/ERC20SB.sol";

contract MintERC20SB is ERC20SB {
    address public owner;
    address public recipient; 

    constructor(
        string memory _name,
        string memory _symbol,
        uint8 _decimals,
        address _owner
    ) ERC20SB(_name, _symbol, _decimals){
        owner = _owner;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can mint!");
        _;
    }

    modifier onlyRecipient() {
        require(msg.sender == recipient, "Only recipient can burn!");
        _;
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function burn(address from, uint256 amount) public onlyRecipient {
        _burn(from, amount);
    }
}