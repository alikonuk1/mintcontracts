// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/FactoryERC721SB.sol";

contract FactoryERC721SBTest is Test {
    FactoryERC721SB public factoryERC721SB;

    address internal factoryOwner;
    address internal contractOwner;
    address internal recipient;
    
    function setUp() public {
        factoryOwner = address(0x471);
        contractOwner = address(0xA11C3);
        recipient = address(0xB0B);

        vm.startPrank(factoryOwner);
        factoryERC721SB = new FactoryERC721SB();
        vm.stopPrank();

        //top up the contractOwner adress
        contractOwner.call{value: 90 ether}("");
    }

    function test_DeployMintERC721SBContract() public {
        vm.startPrank(contractOwner);
        factoryERC721SB.buildERC721SB{value: 10 ether}(
            "testToken", 
            "TEST", 
            "https://google.com", 
            address(contractOwner)
            );
        vm.stopPrank();
        assertTrue(true);
    }
}
