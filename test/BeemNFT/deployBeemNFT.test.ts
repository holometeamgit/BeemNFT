const { expect, assert } = require("chai");
import { ethers } from "hardhat";
import { SignerWithAddress } from "@nomiclabs/hardhat-ethers/signers";
import { BeemNFT } from "../../src/types";
import "./deployBeemNFT";
import { deploymentBeemNFT } from "./deployBeemNFT";
import { TIKEN_SYMBOL, TOKEN_NAME } from "../../scripts/BeemNFTDeploy";

describe("Deployment XXXToken", function () {
  let BeemNFT: BeemNFT;

  beforeEach(async function () {
    BeemNFT = await deploymentBeemNFT();
  });

  it("Should set the right name", async function () {
    expect(await BeemNFT.name()).to.equal(TOKEN_NAME);
  });

  it("Should set the right symbol", async function () {
    expect(await BeemNFT.symbol()).to.equal(TIKEN_SYMBOL);
  });
});
