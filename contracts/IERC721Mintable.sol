// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

interface IERC721Mintable {
    function mint(address to, string memory tokenURI) external;
}