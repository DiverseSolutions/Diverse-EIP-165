// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ERC165.sol";

contract Selector {
  ERC165 instance;

  function erc165Selector() external view returns (bytes4){
    return instance.supportsInterface.selector;
  }

  function erc165SelectorCorrect() external view returns (bool){
    return instance.supportsInterface.selector == 0x01ffc9a7;
  }
}
