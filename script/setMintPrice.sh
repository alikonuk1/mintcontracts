source .env

export FACTORYERC20SB=0xCa7cA7BcC765F77339bE2d648BA53ce9c8a262bD
export FACTORYERC721SB=0xA15BB66138824a1c7167f5E85b957d04Dd34E468
export MINT_PRICE=1000000000000000000

cast send --private-key=$LOCAL_PRIVATE_KEY $FACTORYERC20SB "setMintPrice(uint256)" $MINT_PRICE --rpc-url $LOCAL_RPC_URL

cast send --private-key=$LOCAL_PRIVATE_KEY $FACTORYERC721SB "setMintPrice(uint256)" $MINT_PRICE --rpc-url $LOCAL_RPC_URL