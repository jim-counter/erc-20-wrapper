# WAI3 - Wrapped AI3 Contract

**Exact copy** of the mainnet WAI3 contract for deployment on Chronos testnet.

## Contract Details

- **Name**: Wrapped AI3
- **Symbol**: WAI3  
- **Decimals**: 18
- **Network**: Chronos Auto EVM (Chain ID: 8700)
- **Framework**: Foundry

## Quick Start

```bash
# Setup
./scripts/setup.sh
# Edit scripts/.env with your private key

# Deploy
./scripts/deploy.sh

# Verify
./scripts/verify.sh <CONTRACT_ADDRESS>
```

## Project Structure

```
├── src/WAI3.sol                 # Exact mainnet contract
├── test/WAI3.t.sol             # Test suite  
├── scripts/
│   ├── setup.sh                # Environment setup
│   ├── deploy.sh               # Automated deployment
│   ├── verify.sh               # Contract verification
│   └── .env.example            # Configuration template
└── foundry.toml               # Foundry config
```

## Development

```bash
# Build
forge build

# Test  
forge test

# Deploy manually
forge create src/WAI3.sol:WAI3 --rpc-url chronos --private-key $PRIVATE_KEY --broadcast
```

## Contract Functions

- `deposit()` - Deposit AI3 → WAI3
- `withdraw(uint256)` - Burn WAI3 → AI3  
- `transfer(address, uint256)` - Transfer WAI3
- `approve(address, uint256)` - Approve spending

## Differences from WETH9

See [WAI3_vs_WETH9_DIFFERENCES.md](WAI3_vs_WETH9_DIFFERENCES.md) for detailed comparison.

## License

MIT