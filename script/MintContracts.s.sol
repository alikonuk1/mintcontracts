// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Script.sol";
import "src/FactoryERC20SB.sol";
import {FactoryERC721SB} from "src/FactoryERC721SB.sol";

contract Deploy is Script {

    address public factoryOwner = msg.sender;

    function run() external {
        vm.startBroadcast();

        FactoryERC721SB factoryERC721SB = new FactoryERC721SB(factoryOwner);
        FactoryERC20SB factoryERC20SB = new FactoryERC20SB(factoryOwner);

        vm.stopBroadcast();
    }
}