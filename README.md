# Basic Ethereum

This is just playing around ethereum blockchain

## Requirements

- NodeJS version 10+

## Things to learn

- Truffle
- Metamask
- Infura (Like gateway, if use other testnet such as Robsten, Kovan, Rinkeby, ...)
- Web3
- Ganache - Download at [ganache-site](https://www.trufflesuite.com/ganache)

## Solidity concept

Can be learned from [cryptozombies](https://cryptozombies.io/)

## Example with truffle

Other truffle-box can found here [truffle-box](https://github.com/truffle-box)

```bash
mkdir metacoin
cd metacoin
truffle unbox metacoin
```

## Getting start with ganache

```bash
cd scripts
./setup-ganache.sh

cd ..
./bin/ganache
```

Then click `quickstart`. For API need to setting up truffle-metacoin by

```javascript
module.exports = {
  // Uncommenting the defaults below
  // provides for an easier quick-start with Ganache.
  // You can also follow this format for other networks;
  // see <http://truffleframework.com/docs/advanced/configuration>
  // for more details on how to specify configuration options!
  //
  networks: {
    development: {
      host: "127.0.0.1",
      port: 7545, // or change to 8545
      network_id: "*"
    },
    test: {
      host: "127.0.0.1",
      port: 7545, // or change to 8545
      network_id: "*"
    }
  }
  //
};
```

## Forget metamask password

Remove extension and reinstall

## Testing smart contract

Dont forget to setting port by `settings > server > change port number to 8545`

```bash
cd metacoin
truffle test ./test/TestMetaCoin.sol

# to compile try,
truffle compile
```

The log will show as follow

```txt
Compiling your contracts...
===========================
> Compiling ./contracts/ConvertLib.sol
> Compiling ./contracts/MetaCoin.sol
> Compiling ./contracts/Migrations.sol
> Compiling ./test/TestMetaCoin.sol
> Artifacts written to /tmp/test-202028-4944-1otffko.h6f4
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang



  TestMetaCoin
    ✓ testInitialBalanceUsingDeployedContract (111ms)
    ✓ testInitialBalanceWithNewMetaCoin (87ms)


  2 passing (6s)
```

Migrate smart contract to `development` environment (can be changed to others)

```bash
truffle migrate --network development
```

The log will show as follow

```txt
Compiling your contracts...
===========================
> Compiling ./contracts/ConvertLib.sol
> Compiling ./contracts/MetaCoin.sol
> Compiling ./contracts/Migrations.sol
> Artifacts written to /home/kowpun/Desktop/blockchain/basic-eth/metacoin/build/contracts
> Compiled successfully using:
   - solc: 0.5.16+commit.9c3226ce.Emscripten.clang



Starting migrations...
======================
> Network name:    'development'
> Network id:      5777
> Block gas limit: 0x6691b7


1_initial_migration.js
======================

   Deploying 'Migrations'
   ----------------------
   > transaction hash:    0xb4ca2e296045458e92b8b31caf6c67de4e61650dba6a2a83309ef9b7e459f7f3
   > Blocks: 0            Seconds: 0
   > contract address:    0x3114F6f63161164fC0532856B8153eB53f89f71c
   > block number:        23
   > block timestamp:     1583601495
   > account:             0xd7d3f44Ecccf7B162268cdFF60DEf1c08aF3Ca88
   > balance:             99.69024742
   > gas used:            188483
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00376966 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00376966 ETH


2_deploy_contracts.js
=====================

   Deploying 'ConvertLib'
   ----------------------
   > transaction hash:    0xfa5c2992811f7f317e8520f5804b249caea6236ae07f7008393906dbdfa42316
   > Blocks: 0            Seconds: 0
   > contract address:    0x4752115e9993FDde83D177f8bEd836F5e22f2f81
   > block number:        25
   > block timestamp:     1583601495
   > account:             0xd7d3f44Ecccf7B162268cdFF60DEf1c08aF3Ca88
   > balance:             99.68728792
   > gas used:            105974
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00211948 ETH


   Linking
   -------
   * Contract: MetaCoin <--> Library: ConvertLib (at address: 0x4752115e9993FDde83D177f8bEd836F5e22f2f81)

   Deploying 'MetaCoin'
   --------------------
   > transaction hash:    0xc8742a1ef7bc1e55dacd46863d1e38c0f081faca3d540f9a8d109b0633b3d90b
   > Blocks: 0            Seconds: 0
   > contract address:    0x3137639F868A703c826bfF246765c6a9c09b0bf6
   > block number:        26
   > block timestamp:     1583601495
   > account:             0xd7d3f44Ecccf7B162268cdFF60DEf1c08aF3Ca88
   > balance:             99.68047526
   > gas used:            340633
   > gas price:           20 gwei
   > value sent:          0 ETH
   > total cost:          0.00681266 ETH


   > Saving migration to chain.
   > Saving artifacts
   -------------------------------------
   > Total cost:          0.00893214 ETH


Summary
=======
> Total deployments:   3
> Final cost:          0.0127018 ETH
```

## Interact with contract

Try console

```bash
truffle console --network development
```

Copy this to console

```bash
let instance = await MetaCoin.deployed()
let accounts = await web3.eth.getAccounts()
let balance = await instance.getBalance(accounts[0])
balance.toNumber() # return as eth.00 such as 100.00 -> 10000
```

Try other case by follow [getting-started](https://www.trufflesuite.com/docs/truffle/getting-started/interacting-with-your-contracts)
