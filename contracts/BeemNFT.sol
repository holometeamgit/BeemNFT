// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "./NFTStorage.sol";
import "./IERC721Mintable.sol";

contract BeemNFT is ERC721, AccessControl, NFTStorage, IERC721Mintable {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    uint256 _tokenId;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }
    
    function mint(
        address to,
        bytes memory _data
    ) external override onlyRole(MINTER_ROLE) {
        _safeMint(to, _tokenId, _data);
        _tokenId++;
     }

    function supportsInterface(bytes4 interfaceId) public view virtual override (ERC721, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}