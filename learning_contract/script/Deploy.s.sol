// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import { Script } from "forge-std/Script.sol";
import { RestrictedStorage } from "../src/Access.sol";

contract RestrictedStorageDeployScript is Script {
    function run() external {
        // デプロイを開始する
        vm.startBroadcast();

        // コントラクトのデプロイ
        RestrictedStorage restrictedStorage = new RestrictedStorage();

        // 必要な操作
        restrictedStorage.set(56);

        // ブロードキャストを終了する
        vm.stopBroadcast();
    }
}


