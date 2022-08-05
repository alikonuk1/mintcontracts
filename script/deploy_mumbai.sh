source .env

#forge create --rpc-url $GOERLI_RPC_URL \
#    --constructor-args <wallet_address> \
#    --private-key $PRIVATE_KEY src/FactoryERC20SB.sol:FactoryERC20SB \
#    --etherscan-api-key $ETHERSCAN_KEY \
#    --verify

forge create --rpc-url $MUMBAI_RPC_URL \
    --constructor-args 0x2B68407d77B044237aE7f99369AA0347Ca44B129 \
    --private-key $TEST_PRIVATE_KEY src/FactoryERC721SB.sol:FactoryERC721SB \
    --legacy \
    --etherscan-api-key $POLYGONSCAN_KEY \
    --verify