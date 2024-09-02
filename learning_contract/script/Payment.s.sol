// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {PaymentContract} from "../src/PaymentContract.sol";

contract PaymentContractDeployScript is Script {
    
    function run() public {
        vm.startBroadcast();

        PaymentContract paymentContract = new PaymentContract();
        
        vm.stopBroadcast();
    }
}

