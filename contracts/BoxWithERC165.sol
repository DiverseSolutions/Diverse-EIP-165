// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ERC165.sol";

contract BoxWithERC165 is ERC165 {
  uint internal value;

  function setValue(uint v) external {
    value = v;
  }

  function getValue() external view returns(uint){
    return value;
  }

  function supportsInterface(bytes4 interfaceID) external view returns (bool) {
    return interfaceID == 0x01ffc9a7;
  }
}
