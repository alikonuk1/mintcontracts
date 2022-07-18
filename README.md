# MintContracts

### Local development

1. Install [Foundry](https://github.com/foundry-rs/foundry)
1. `npm install`
1. `git submodule init && git submodule update`
1. `forge test`
1. `forge build`
1. Run anvil on a seperate terminal `anvil`
1. `forge script script/MintContracts.s.sol:Deploy --fork-url http://localhost:8545 \  --private-key 0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80 --broadcast -vvvv`