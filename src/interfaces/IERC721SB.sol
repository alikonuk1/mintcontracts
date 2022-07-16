// SPDX-License-Identifier: AGPL-3.0-only
pragma solidity >=0.8.0;

error SoulBoundRestriction();

interface ERC721SB {

    event Transfer(address indexed from, address indexed to, uint256 indexed id);

    event Approval(address indexed owner, address indexed spender, uint256 indexed id);

    event ApprovalForAll(address indexed owner, address indexed operator, bool approved);

    function tokenURI(uint256 id) external returns (string memory);

    function ownerOf(uint256 id) external returns (address owner);

    function balanceOf(address owner) external returns (uint256);

    function approve() external;

    function setApprovalForAll() external;

    function transferFrom() external;

    function safeTransferFrom() external;

    function supportsInterface(bytes4 interfaceId) external returns (bool);

    function _mint(address to, uint256 id) external;

    function _burn(uint256 id) external;

    function _safeMint(address to, uint256 id) external;

    function _safeMint(
        address to,
        uint256 id,
        bytes memory data
    ) external;
}

interface ERC721TokenReceiver {
    function onERC721Received(
        address,
        address,
        uint256,
        bytes calldata
    ) external returns (bytes4);
}