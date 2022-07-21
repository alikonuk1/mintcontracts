# include .env file and export its env vars
# (-include to ignore error if it does not exist)
-include .env

# deps
install:; forge install
update:; forge update

# Build & test
build  :; forge build
test   :; forge test
trace  :; forge test -vvv
clean  :; forge clean
snapshot :; forge snapshot
gas-report :; forge test --gas-report

# deploy scripts
deploy-local :; . script/deploy_local.sh
deploy-goerli :; . script/deploy_goerli.sh

# calls
getmintprice :; . script/getMintPrice.sh
setmintprice :; . script/setMintPrice.sh