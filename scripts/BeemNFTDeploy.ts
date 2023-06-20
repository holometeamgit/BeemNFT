import dotenv from "dotenv";
dotenv.config({ path: __dirname + "/.env" });

import { ethers } from "hardhat";
import { BeemNFT } from "../src/types";

export const TOKEN_NAME: string = "Beem NFT";
export const TIKEN_SYMBOL: string = "BNV";

async function main() {
  const factory = await ethers.getContractFactory("BeemNFT");
  console.log("Deploying BeemNFT...");

  const contract: BeemNFT = await factory.deploy(TOKEN_NAME, TIKEN_SYMBOL);

  await contract.deployed();

  console.log("BeemNFT deployed to:", contract.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });
