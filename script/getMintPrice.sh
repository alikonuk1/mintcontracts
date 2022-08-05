source .env

#export FACTORYERC20SB=0xCa7cA7BcC765F77339bE2d648BA53ce9c8a262bD
export FACTORYERC721SB=0x74eBee5c642701c011f8f1fCC336Af6C524e7754

#cast call --private-key=$LOCAL_PRIVATE_KEY $FACTORYERC20SB "getMintPrice()(uint256)" --rpc-url $LOCAL_RPC_URL

cast call --private-key=$PRIVATE_KEY $FACTORYERC721SB "getMintPrice()(uint256)" --rpc-url $POLYGON_RPC_URL 