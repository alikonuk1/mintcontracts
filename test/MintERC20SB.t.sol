// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/MintERC20SB.sol";
import "sirius/tokens/ERC20SB.sol";

contract MintERC20SBTest is Test {
    MintERC20SB public mintERC20SB;

    address internal factoryOwner;
    address internal contractOwner;
    address internal recipient;
    address internal randomUser;
    
    function setUp() public {
        factoryOwner = address(0x471);
        contractOwner = address(0xA11C3);
        recipient = address(0xB0B);
        randomUser = address(0xA353);

        vm.startPrank(factoryOwner);
        mintERC20SB = new MintERC20SB("TestToken", "TEST", 18, address(contractOwner));
        vm.stopPrank();
    }

    function test_OwnerMint() public {
        vm.startPrank(contractOwner);
        emit log_string("Recipient balance before mint:");
        emit log_uint(mintERC20SB.balanceOf(address(recipient)));
        
        mintERC20SB.mint(address(recipient), 100e18);
        
        emit log_string("Recipient balance after mint:");
        emit log_uint(mintERC20SB.balanceOf(address(recipient)));
        vm.stopPrank();
        
        assertEq(mintERC20SB.balanceOf(address(recipient)), 100e18);
    }

    function testFail_NotOwnerCantMint() public {
        vm.startPrank(factoryOwner);
        mintERC20SB.mint(address(recipient), 100e18);
        vm.stopPrank();
    }

    function test_RecipientCanBurn() public {
        vm.startPrank(contractOwner);  
        mintERC20SB.mint(address(recipient), 100e18);
        vm.stopPrank();

        assertEq(mintERC20SB.balanceOf(address(recipient)), 100e18);

        vm.startPrank(recipient);
        mintERC20SB.burn(address(recipient), 100e18);
        vm.stopPrank();

        assertEq(mintERC20SB.balanceOf(address(recipient)), 0);
    }

    function testFail_NonRecipientCantBurn() public {
        vm.startPrank(contractOwner);  
        mintERC20SB.mint(address(recipient), 100e18);
        vm.stopPrank();

        assertEq(mintERC20SB.balanceOf(address(recipient)), 100e18);
        
        vm.startPrank(randomUser);
        mintERC20SB.burn(address(recipient), 100e18);
        vm.stopPrank();
    }

    function testFail_CantTransfer() public {
        vm.startPrank(contractOwner);  
        mintERC20SB.mint(address(recipient), 100e18);
        vm.stopPrank();

        assertEq(mintERC20SB.balanceOf(address(recipient)), 100e18);

        vm.startPrank(recipient);
        mintERC20SB.transfer();
        vm.stopPrank();
    }
}
