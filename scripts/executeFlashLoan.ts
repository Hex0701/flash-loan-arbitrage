import { ethers } from "hardhat";

async function main() {
    const flashLoanContractAddress = "YOUR_FLASH_LOAN_CONTRACT_ADDRESS"; // Replace with your deployed contract address
    const amount = ethers.utils.parseUnits("1.0", 18); // Amount to borrow (1 token with 18 decimals)
    const tokenAddress = "YOUR_TOKEN_ADDRESS"; // Replace with the address of the token you want to borrow

    const flashLoanContract = await ethers.getContractAt("FlashLoan", flashLoanContractAddress);

    const tx = await flashLoanContract.startFlashLoan(tokenAddress, amount);
    await tx.wait();

    console.log(`Flash loan executed: ${amount.toString()} tokens borrowed from ${tokenAddress}`);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });