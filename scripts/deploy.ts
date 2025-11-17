import { ethers } from "hardhat";

async function main() {
    const FlashLoan = await ethers.getContractFactory("FlashLoan");
    const flashLoan = await FlashLoan.deploy();

    await flashLoan.deployed();

    console.log("FlashLoan contract deployed to:", flashLoan.address);
}

main()
    .then(() => process.exit(0))
    .catch((error) => {
        console.error(error);
        process.exit(1);
    });