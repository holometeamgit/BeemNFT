import dotenv from "dotenv";
dotenv.config({ path: __dirname + "/.env" });

import "@typechain/hardhat";
import "@nomiclabs/hardhat-ethers";
import "@nomiclabs/hardhat-waffle";
import "solidity-coverage";
import "@nomiclabs/hardhat-ganache";
import "tsconfig-paths/register";
import "@nomiclabs/hardhat-etherscan";

import "./tasks/index";

const {
  API_URL_RINKEBY,
  API_URL_GOERLI,
  PRIVATE_KEY,
  PRIVATE_KEY2,
  PRIVATE_KEY3,
  API_KEY_ETHERSCAN,
} = process.env;

module.exports = {
  solidity: "0.8.1",
  networks: {
    ganache: {
      url: "http://127.0.0.1:7545",
      //chainId: 1287, // 0x507 in hex,
      accounts: [PRIVATE_KEY, PRIVATE_KEY2, PRIVATE_KEY3],
    },
    rinkeby: {
      url: API_URL_RINKEBY,
      accounts: [PRIVATE_KEY, PRIVATE_KEY2, PRIVATE_KEY3],
    },
    goerli: {
      url: API_URL_GOERLI,
      accounts: [PRIVATE_KEY, PRIVATE_KEY2, PRIVATE_KEY3],
    },
  },
  typechain: {
    outDir: "src/types",
    target: "ethers-v5",
    alwaysGenerateOverloads: false,
    externalArtifacts: ["externalArtifacts/*.json"],
  },
  etherscan: {
    apiKey: API_KEY_ETHERSCAN,
  },
};
