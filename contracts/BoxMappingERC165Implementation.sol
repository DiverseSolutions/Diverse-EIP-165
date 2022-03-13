// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ERC165.sol";
import "./BoxInterface.sol";
import "./ERC165-Mapping-Implementation.sol";

contract BoxMappingERC165Implementation is ERC165MappingImplementation {
  uint internal value;

  constructor() {
    BoxInterface i;
    supportedInterfaces[i.getValue.selector ^ i.setValue.selector] = true;
  }

  function setValue(uint v) external {
    value = v;
  }

  function getValue() external view returns(uint){
    return value;
  }

}
