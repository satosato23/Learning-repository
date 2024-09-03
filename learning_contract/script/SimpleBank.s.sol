// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Script } from "forge-std/Script.sol";
import { SimpleBank } from "../src/SimpleBank.sol";

contract SimpleBankDeploy is Script {
    function run() external {
        // デプロイを開始する
        vm.startBroadcast();

        // コントラクトのデプロイ
        SimpleBank simpleBank = new SimpleBank();

        // 必要な操作
        

        // ブロードキャストを終了する
        vm.stopBroadcast();
    }
}