import { ethers } from "hardhat";
import { FlashLoan } from "../../typechain/FlashLoan";
import { FlashLoanReceiver } from "../../typechain/FlashLoanReceiver";

export const deployFlashLoanFixture = async () => {
    const [deployer] = await ethers.getSigners();

    const FlashLoanFactory = await ethers.getContractFactory("FlashLoan");
    const flashLoanContract: FlashLoan = await FlashLoanFactory.deploy();
    await flashLoanContract.deployed();

    const FlashLoanReceiverFactory = await ethers.getContractFactory("FlashLoanReceiver");
    const flashLoanReceiverContract: FlashLoanReceiver = await FlashLoanReceiverFactory.deploy();
    await flashLoanReceiverContract.deployed();

    return { flashLoanContract, flashLoanReceiverContract, deployer };
};