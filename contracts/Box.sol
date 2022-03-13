// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

contract Box {
  uint internal value;

  function setValue(uint v) external {
    value = v;
  }

  function getValue() external view returns(uint){
    return value;
  }
}
