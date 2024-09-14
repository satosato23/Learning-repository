#!/bin/bash

# .envファイルを読み込む
source .env

# Foundryスクリプトを実行する
#forge script script/SimpleBank.s.sol:SimpleBankDeploy --private-key $PRIVATE_KEY --rpc-url $SEPOLIA_URL --broadcast
cast send 0xf837f28afc90dd44E09EBDa069bBC21daDEe0c67 "addUser(string)" "Alice" --rpc-url $SEPOLIA_URL --private-key $PRIVATE_KEY 
#cast call 0x2aeE59982ab7CCe96BadaFeb537b91dcA39c4BA8 "getBalance()" --rpc-url $SEPOLIA_URL --private-key $PRIVATE_KEY     