source .env

#forge create --rpc-url $GOERLI_RPC_URL \
#    --constructor-args <wallet_address> \
#    --private-key $PRIVATE_KEY src/FactoryERC20SB.sol:FactoryERC20SB \
#    --etherscan-api-key $ETHERSCAN_KEY \
#    --verify

forge create --rpc-url $ETH_RPC_URL \
    --constructor-args <wallet_address> \
    --private-key $PRIVATE_KEY src/FactoryERC721SB.sol:FactoryERC721SB \
    --etherscan-api-key $ETHERSCAN_KEY \
    --verify
