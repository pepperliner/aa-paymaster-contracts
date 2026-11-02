// SPDX-License-Identifier: MIT
pragma solidity ^0.8.26;

contract GasPaymaster {
    uint256 public sponsoredUserOps;
    mapping(address => uint256) public accountQuotaUsed;

    event UserOpSponsored(address indexed smartAccount, uint256 gasUnits, uint256 totalSponsored);

    function sponsorAccountGas(uint256 _gasUnits) external {
        sponsoredUserOps += 1;
        accountQuotaUsed[msg.sender] += _gasUnits;
        emit UserOpSponsored(msg.sender, _gasUnits, sponsoredUserOps);
    }
}
