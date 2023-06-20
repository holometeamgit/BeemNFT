import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { ethers } from "hardhat";
import { BeemNFT } from "../../src/types";
import { TIKEN_SYMBOL, TOKEN_NAME } from "../../scripts/BeemNFTDeploy";

export async function deploymentBeemNFT() {
  let accounts: SignerWithAddress[];
  let BeemNFT: BeemNFT;
  accounts = await ethers.getSigners();

  const factory = await ethers.getContractFactory("BeemNFT");
  BeemNFT = await factory.deploy(TOKEN_NAME, TIKEN_SYMBOL);
  await BeemNFT.deployed();
  return BeemNFT;
}
