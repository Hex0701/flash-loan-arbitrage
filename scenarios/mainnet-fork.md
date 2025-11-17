# Mainnet Fork Scenarios for Flash Loan Contract

This document outlines the scenarios for testing the Flash Loan contract on a mainnet fork. The goal is to simulate real-world conditions to ensure the contract behaves as expected.

## Prerequisites

1. **Hardhat Setup**: Ensure that you have Hardhat installed and configured for mainnet forking.
2. **Environment Variables**: Set up your `.env` file with the necessary variables, including your wallet private key and the RPC URL for the Ethereum mainnet.

## Scenarios

### Scenario 1: Successful Flash Loan Execution

1. **Deploy the FlashLoan Contract**:
   - Use the `scripts/deploy.ts` to deploy the FlashLoan contract to the forked network.

2. **Initiate a Flash Loan**:
   - Call the `startFlashLoan` function from the `FlashLoan` contract with a specified amount and token.

3. **Execute Operation**:
   - In the `FlashLoanReceiver` contract, implement the `executeOperation` function to perform a profitable trade or arbitrage.

4. **Repay the Loan**:
   - Ensure that the loan is repaid within the same transaction.

5. **Verify State Changes**:
   - Check the balances of the involved tokens to confirm that the loan was executed and repaid correctly.

### Scenario 2: Flash Loan Failure Due to Insufficient Funds

1. **Deploy the FlashLoan Contract**:
   - Deploy the contract as in Scenario 1.

2. **Initiate a Flash Loan**:
   - Attempt to call `startFlashLoan` with an amount greater than the available liquidity in the lending pool.

3. **Expect Reversion**:
   - The transaction should revert, and the error message should indicate insufficient funds.

### Scenario 3: Flash Loan with Price Manipulation

1. **Deploy the FlashLoan Contract**:
   - Deploy the contract as in Scenario 1.

2. **Manipulate Prices**:
   - Use a mock price oracle to simulate a price change that would affect the profitability of the trade.

3. **Initiate a Flash Loan**:
   - Call `startFlashLoan` and execute a trade based on the manipulated price.

4. **Verify Outcome**:
   - Ensure that the trade does not result in a profit and that the loan is still repaid.

### Conclusion

These scenarios provide a framework for testing the Flash Loan contract under various conditions on a mainnet fork. Adjust the parameters and logic as necessary to cover additional edge cases and ensure robust testing.