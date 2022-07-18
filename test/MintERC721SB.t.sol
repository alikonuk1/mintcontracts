// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "src/MintERC721SB.sol";
import "sirius/tokens/ERC721SB.sol";

contract MintERC721SBTest is Test {
    MintERC721SB public mintERC721SB;

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
        mintERC721SB = new MintERC721SB("TestToken", "TEST", "https://google.com", address(contractOwner));
        vm.stopPrank();
    }

    function test_OwnerMint() public {
        vm.startPrank(contractOwner);
        emit log_string("Recipient balance before mint:");
        emit log_uint(mintERC721SB.balanceOf(address(recipient)));
        
        mintERC721SB.mintTo(address(recipient));
        
        emit log_string("Recipient balance after mint:");
        emit log_uint(mintERC721SB.balanceOf(address(recipient)));
        vm.stopPrank();
        
        assertEq(mintERC721SB.balanceOf(address(recipient)), 1);
    }

    function testFail_NotOwnerMint() public {
        vm.startPrank(factoryOwner);
        mintERC721SB.mintTo(address(recipient));
        vm.stopPrank();
    }

    function test_RecipientCanBurn() public {
        vm.startPrank(contractOwner);  
        mintERC721SB.mintTo(address(recipient));
        vm.stopPrank();

        assertEq(mintERC721SB.balanceOf(address(recipient)), 1);

        vm.startPrank(recipient);
        mintERC721SB.burn(1);
        vm.stopPrank();

        assertEq(mintERC721SB.balanceOf(address(recipient)), 0);
    }

    function testFail_NonRecipientCantBurn() public {
        vm.startPrank(contractOwner);  
        mintERC721SB.mintTo(address(recipient));
        vm.stopPrank();

        assertEq(mintERC721SB.balanceOf(address(recipient)), 1);
        
        vm.startPrank(randomUser);
        mintERC721SB.burn(1);
        vm.stopPrank();
    }
}
