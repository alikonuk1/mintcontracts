// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/FactoryERC20SB.sol";

contract FactoryERC20SBTest is Test {
    FactoryERC20SB public factoryERC20SB;

    address internal factoryOwner;
    address internal contractOwner;
    address internal recipient;
    
    function setUp() public {
        factoryOwner = address(0x471);
        contractOwner = address(0xA11C3);
        recipient = address(0xB0B);

        vm.startPrank(factoryOwner);
        factoryERC20SB = new FactoryERC20SB();
        vm.stopPrank();
    }

    function test_DeployMintERC20SBContract() public {
        vm.startPrank(contractOwner);
        factoryERC20SB.buildERC20SB("testToken", "TEST", 18, address(contractOwner));
        vm.stopPrank();
        assertTrue(true);
    }
}
