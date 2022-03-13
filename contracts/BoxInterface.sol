// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

interface BoxInterface {
  function setValue(uint v) external;
  function getValue() external view returns(uint);
}
