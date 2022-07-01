import dotenv from "dotenv";
dotenv.config({ path: __dirname + "/.env" });

import { ethers } from "hardhat";
import { BeemNFT } from "../src/types";

async function main() {
  const factory = await ethers.getContractFactory("BeemNFT");
  console.log("Deploying BeemNFT...");

  const contract: BeemNFT = await factory.deploy("Beem NFT", "BNV");

  await contract.deployed();

  console.log("XXXToken deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
