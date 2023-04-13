// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;
import {EthereumScript} from 'aave-helpers/../script/Utils.s.sol';
import {GovHelpers} from 'aave-helpers/GovHelpers.sol';
import {ProposalPayload} from 'src/AaveV3ACIProposal_20230411/AaveV3ACIProposal_20230411.sol';

contract DeployMainnetACIPayload is EthereumScript {
  function run() external broadcast {
    new ProposalPayload();
  }
}

contract ACIPayloadProposal is EthereumScript {
  function run() external broadcast {
    GovHelpers.Payload[] memory payloads = new GovHelpers.Payload[](1);
    payloads[0] = GovHelpers.buildMainnet(
      address(0) // deployed cbETH payload
    );
    GovHelpers.createProposal(
      payloads,
      0 // TODO: Replace with actual hash
    );
  }
}
