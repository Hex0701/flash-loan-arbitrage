// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./interfaces/ILendingPool.sol";
import "./interfaces/IERC20.sol";

contract FlashLoan {
    ILendingPool public lendingPool;

    constructor(address _lendingPool) {
        lendingPool = ILendingPool(_lendingPool);
    }

    function startFlashLoan(address token, uint256 amount) external {
        bytes memory data = abi.encode(msg.sender, amount);
        lendingPool.flashLoan(address(this), token, amount, data);
    }

    function executeOperation(
        address sender,
        uint256 amount,
        uint256 fee,
        bytes calldata params
    ) external {
        (address initiator, uint256 loanAmount) = abi.decode(params, (address, uint256));

        // Implement your logic here (e.g., arbitrage, trading)

        // Repay the loan
        uint256 totalRepayment = amount + fee;
        IERC20(token).transfer(address(lendingPool), totalRepayment);
    }
}