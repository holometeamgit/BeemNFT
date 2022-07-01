// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract NFTStorage {
    string public baseUri = "";
     
    mapping (uint256 => string) _tokenURIs;

    function setTokenURI(uint256 tokenId, string memory newURI) public virtual {
        _tokenURIs[tokenId] = newURI;
    }

    function getTokenURI(uint256 tokenId) public virtual view returns (string memory) {
        string memory currentTokenURI = _tokenURIs[tokenId];
        if(bytes(currentTokenURI).length > 0) {
            return string(abi.encodePacked(currentTokenURI, Strings.toString(tokenId)));
        }

        string memory currentBaseURI = baseUri;
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, Strings.toString(tokenId))) : "";
    }

    function setBaseURI(string memory newURI) public virtual {
          baseUri = newURI;
    }
}