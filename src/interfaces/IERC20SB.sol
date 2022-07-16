// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

error SoulBoundRestriction();

interface ERC20SB {

    event Transfer(address indexed from, address indexed to, uint256 amount);

    function approve() external returns (bool);

    function transfer() external returns (bool);

    function transferFrom() external returns (bool);

    function _mint(address to, uint256 amount) external;

    function _burn(address from, uint256 amount) external;
}