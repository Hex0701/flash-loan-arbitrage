// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ILendingPool {
    function deposit(address asset, uint256 amount, uint16 referralCode) external;
    function withdraw(address asset, uint256 amount) external returns (uint256);
    function flashLoan(
        address receiver,
        address asset,
        uint256 amount,
        bytes calldata params
    ) external;
    function repay(address asset, uint256 amount, uint256 rateMode) external returns (uint256);
    function getReserveData(address asset) external view returns (
        uint256 totalLiquidity,
        uint256 availableLiquidity,
        uint256 totalBorrowsStable,
        uint256 totalBorrowsVariable,
        uint256 liquidityRate,
        uint256 variableBorrowRate,
        uint256 stableBorrowRate,
        uint256 lastUpdateTimestamp,
        uint256 id
    );
}