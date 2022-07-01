// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract NFTStorage is ERC721 {     
    mapping (uint256 => string) _tokenURIs;

    string baseURI_;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) { }

    function setTokenURI(uint256 tokenId, string memory newURI) public virtual {
        _tokenURIs[tokenId] = newURI;
    }

    function getTokenURI(uint256 tokenId) public virtual view returns (string memory) {
        string memory currentTokenURI = _tokenURIs[tokenId];
        if(bytes(currentTokenURI).length > 0) {
            return currentTokenURI;
        }

        string memory currentBaseURI = _baseURI();
        return bytes(currentBaseURI).length > 0 ? string(abi.encodePacked(currentBaseURI, Strings.toString(tokenId))) : "";
    }

    function setBaseURI(string memory uri) public virtual {
          baseURI_ = uri;
    }

    function _baseURI() internal view virtual override returns (string memory) {
        return baseURI_;
    }
}