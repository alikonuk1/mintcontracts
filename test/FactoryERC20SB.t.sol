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
        factoryERC20SB = new FactoryERC20SB(address(factoryOwner));
        vm.stopPrank();

        //top up the contractOwner adress
        contractOwner.call{value: 90 ether}("");
    }

    function test_AdminSetMintPrice() public {
        vm.startPrank(factoryOwner);
        factoryERC20SB.setMintPrice(10000000000000000);
        vm.stopPrank();

        emit log_uint(factoryERC20SB.getMintPrice());

        require(factoryERC20SB.getMintPrice() == 0.01 ether);
    }

    function testFail_NonAdminCantSetMintPrice() public {
        vm.startPrank(recipient);
        factoryERC20SB.setMintPrice(10000000000000000);
        vm.stopPrank();

        emit log_string("Mint price:");
        emit log_uint(factoryERC20SB.getMintPrice());
    }

    function test_DeployMintERC20SBContract() public {
        vm.startPrank(factoryOwner);
        factoryERC20SB.setMintPrice(10000000000000000);
        vm.stopPrank();

        vm.startPrank(contractOwner);
        factoryERC20SB.buildERC20SB{value: 0.01 ether}(
            "testToken",
            "TEST", 
            18, 
            address(contractOwner)
        );
        vm.stopPrank();
        assertTrue(true);
    }

    function test_AdminWithdrawFunds() public {
        vm.startPrank(factoryOwner);
        factoryERC20SB.setMintPrice(60000000000000000);
        vm.stopPrank();

        require(factoryERC20SB.getMintPrice() == 0.06 ether);

        emit log_string("Mint price:");
        emit log_uint(factoryERC20SB.getMintPrice());

        vm.startPrank(contractOwner);
        factoryERC20SB.buildERC20SB{value: 0.06 ether}(
            "testToken",
            "TEST", 
            18, 
            address(contractOwner)
        );
        vm.stopPrank();

        require(address(factoryERC20SB).balance == 0.06 ether);

        emit log_string("Factory contract balance:");
        emit log_uint(address(factoryERC20SB).balance);

        vm.startPrank(factoryOwner);
        factoryERC20SB.withdrawFunds();
        vm.stopPrank();

        require(address(factoryERC20SB).balance == 0);
        require(address(factoryOwner).balance == 0.06 ether);

        emit log_string("Factory contract balance:");
        emit log_uint(address(factoryERC20SB).balance);

        emit log_string("Factory Owner balance:");
        emit log_uint(address(factoryOwner).balance);

        // change mint price and try again
        vm.startPrank(factoryOwner);
        factoryERC20SB.setMintPrice(30000000000000000);
        vm.stopPrank();

        require(factoryERC20SB.getMintPrice() == 0.03 ether);

        emit log_string("Mint price:");
        emit log_uint(factoryERC20SB.getMintPrice());

        vm.startPrank(contractOwner);
        factoryERC20SB.buildERC20SB{value: 0.03 ether}(
            "testToken",
            "TEST", 
            18, 
            address(contractOwner)
        );
        vm.stopPrank();

        require(address(factoryERC20SB).balance == 0.03 ether);

        emit log_string("Factory contract balance:");
        emit log_uint(address(factoryERC20SB).balance);

        vm.startPrank(factoryOwner);
        factoryERC20SB.withdrawFunds();
        vm.stopPrank();

        require(address(factoryERC20SB).balance == 0);
        require(address(factoryOwner).balance == 0.09 ether);

        emit log_string("Factory contract balance:");
        emit log_uint(address(factoryERC20SB).balance);

        emit log_string("Factory Owner balance:");
        emit log_uint(address(factoryOwner).balance);
    }
}
