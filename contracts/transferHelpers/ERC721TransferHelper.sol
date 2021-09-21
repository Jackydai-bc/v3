// SPDX-License-Identifier: GPL-3.0

pragma solidity 0.8.5;

import {IERC721} from "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import {ZoraProposalManager} from "../ZoraProposalManager.sol";
import {BaseTransferHelper} from "./BaseTransferHelper.sol";

contract ERC721TransferHelper is BaseTransferHelper {
    constructor(address _approvalsManager) BaseTransferHelper(_approvalsManager) {}

    function safeTransferFrom(
        address _token,
        address _from,
        address _to,
        uint256 _tokenID
    ) public onlyApprovedModule(_from) {
        IERC721(_token).safeTransferFrom(_from, _to, _tokenID);
    }

    function transferFrom(
        address _token,
        address _from,
        address _to,
        uint256 _tokenID
    ) public onlyApprovedModule(_from) {
        IERC721(_token).transferFrom(_from, _to, _tokenID);
    }
}