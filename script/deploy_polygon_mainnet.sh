source .env

#forge create --rpc-url $GOERLI_RPC_URL \
#    --constructor-args <wallet_address> \
#    --private-key $PRIVATE_KEY src/FactoryERC20SB.sol:FactoryERC20SB \
#    --legacy \
#    --etherscan-api-key $ETHERSCAN_KEY \
#    --verify

forge create --rpc-url $POLYGON_RPC_URL \
    --constructor-args 0xd6634f05BC79c19cD7027636F3c7c29E853EB844 \
    --private-key $PRIVATE_KEY src/FactoryERC721SB.sol:FactoryERC721SB \
    --legacy \
    --etherscan-api-key $POLYGONSCAN_KEY \
    --verify