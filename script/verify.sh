source .env

#chain id's
#gorli: 5
#poylgon: 137
#mumbai: 80001

#$(cast abi-encode "constructor(address)" 0x2B68407d77B044237aE7f99369AA0347Ca44B129)

forge verify-contract --chain-id 80001 \
    --constructor-args 0x0000000000000000000000002b68407d77b044237ae7f99369aa0347ca44b129 \
    --compiler-version v0.8.14+commit.80d49f37 0x0a80Ed498f9977c80E6354723cd92064eb925fA4 src/FactoryERC721SB.sol:FactoryERC721SB $POLYGONSCAN_KEY --legacy
