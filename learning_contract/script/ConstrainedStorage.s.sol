// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Script } from "forge-std/Script.sol";
import { ConstrainedStorage } from "../src/ConstrainedStorage.sol";

contract ConstrainedStorageDeployScript is Script {
    function run() external {
        // デプロイを開始する
        vm.startBroadcast();

        // コントラクトのデプロイ
        ConstrainedStorage constrainedStorage = new ConstrainedStorage();

        // 必要な操作
        constrainedStorage.set(200);

        // ブロードキャストを終了する
        vm.stopBroadcast();
    }
}
