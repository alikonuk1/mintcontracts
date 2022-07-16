// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/MintERC20SB.sol";

contract MintERC20SBTest is Test {
    MintERC20SB public mintERC20SB;

    address internal factoryOwner;
    address internal contractOwner;
    address internal recipient;
    
    function setUp() public {
        factoryOwner = address(0x471);
        contractOwner = address(0xA11C3);
        recipient = address(0xB0B);

        vm.startPrank(factoryOwner);
        mintERC20SB = new MintERC20SB("TestToken", "TEST", 18);
        vm.stopPrank();
    }

    function testDeployContract() public {
        assertTrue(true);
    }
}
