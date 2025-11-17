// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interfaces/ILendingPool.sol";
import "./interfaces/IERC20.sol";

contract FlashLoanReceiver {
    ILendingPool private lendingPool;

    constructor(address _lendingPool) {
        lendingPool = ILendingPool(_lendingPool);
    }

    function executeOperation(
        address asset,
        uint256 amount,
        uint256 premium,
        address initiator,
        bytes calldata params
    ) external {
        // Implement your logic here (e.g., arbitrage, trading, etc.)

        // Repay the loan
        uint256 totalRepayment = amount + premium;
        IERC20(asset).approve(address(lendingPool), totalRepayment);
        lendingPool.repay(asset, totalRepayment, 0, address(this));
    }
}