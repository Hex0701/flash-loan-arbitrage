# Flash Loan Hardhat Project

This project implements a flash loan smart contract using Solidity and Hardhat. It allows users to borrow assets without collateral, provided that the loan is repaid within the same transaction.

## Project Structure

```
flash-loan-hardhat
├── contracts
│   ├── FlashLoan.sol
│   ├── FlashLoanReceiver.sol
│   └── interfaces
│       ├── ILendingPool.sol
│       └── IERC20.sol
├── scripts
│   ├── deploy.ts
│   └── executeFlashLoan.ts
├── test
│   ├── flashLoan.test.ts
│   └── helpers
│       └── fixtures.ts
├── scenarios
│   └── mainnet-fork.md
├── hardhat.config.ts
├── package.json
├── tsconfig.json
├── .env
└── README.md
```

## Installation

1. Clone the repository:
   ```
   git clone <repository-url>
   cd flash-loan-hardhat
   ```

2. Install dependencies:
   ```
   npm install
   ```

3. Set up your environment variables in the `.env` file. You will need your wallet private key and an RPC provider URL.

## Usage

### Deploying the Contract

To deploy the `FlashLoan` contract, run the following script:
```
npx hardhat run scripts/deploy.ts --network <network-name>
```

### Executing a Flash Loan

To execute a flash loan, use the following command:
```
npx hardhat run scripts/executeFlashLoan.ts --network <network-name>
```

## Testing

To run the tests for the `FlashLoan` contract, execute:
```
npx hardhat test
```

## Scenarios

Refer to `scenarios/mainnet-fork.md` for detailed scenarios on how to test the flash loan functionality on a mainnet fork.

## Overview

The project consists of the following key components:

- **FlashLoan.sol**: The main contract for executing flash loans.
- **FlashLoanReceiver.sol**: The contract that receives the flash loan and implements the logic for trades or arbitrage.
- **ILendingPool.sol**: Interface for interacting with the Aave lending pool.
- **IERC20.sol**: Standard interface for ERC20 tokens.

This project serves as a foundational implementation of flash loans, showcasing the potential for leveraging borrowed assets in decentralized finance (DeFi).