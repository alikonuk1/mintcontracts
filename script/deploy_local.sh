source .env

forge create --rpc-url $LOCAL_RPC_URL \
    --constructor-args 0xa0ee7a142d267c1f36714e4a8f75612f20a79720 \
    --private-key $LOCAL_PRIVATE_KEY src/FactoryERC20SB.sol:FactoryERC20SB

forge create --rpc-url $LOCAL_RPC_URL \
    --constructor-args 0xa0ee7a142d267c1f36714e4a8f75612f20a79720 \
    --private-key $LOCAL_PRIVATE_KEY src/FactoryERC721SB.sol:FactoryERC721SB