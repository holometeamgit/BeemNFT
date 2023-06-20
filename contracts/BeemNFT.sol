// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/AccessControl.sol";
import "./NFTStorage.sol";
import "./IERC721Mintable.sol";

contract BeemNFT is NFTStorage, AccessControl, IERC721Mintable {

    bytes32 public constant MINTER_ROLE = keccak256("MINTER_ROLE");

    uint256 _nextTokenId;

    constructor(string memory name, string memory symbol) NFTStorage(name, symbol) {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
        _setupRole(MINTER_ROLE, msg.sender);
    }

    function mint(
        address to,
        string memory tokenURI
    ) external virtual override onlyRole(MINTER_ROLE) {
        _safeMint(to, _nextTokenId);
        setTokenURI(_nextTokenId, tokenURI);
        _nextTokenId++;
     }

    function burn(uint256 tokenId) public virtual {
        //solhint-disable-next-line max-line-length
        require(_isApprovedOrOwner(_msgSender(), tokenId), "ERC721Burnable: caller is not owner nor approved");
        _burn(tokenId);
    }

    function supportsInterface(bytes4 interfaceId) public view virtual override (ERC721, AccessControl) returns (bool) {
        return super.supportsInterface(interfaceId);
    }
}