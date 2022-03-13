// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./ERC165.sol";
import "./BoxInterface.sol";

contract BoxSimpleERC165Implementation {
  uint internal value;

  function setValue(uint v) external {
    value = v;
  }

  function getValue() external view returns(uint){
    return value;
  }

  function calculateBoxInterface() external pure returns(bytes4){
    BoxInterface i;
    return i.getValue.selector ^ i.setValue.selector; 
  }

  function supportsInterface(bytes4 interfaceID) external pure returns (bool) {
    // return interfaceID == 0x01ffc9a7 || interfaceID == 0x75b24222;
    BoxInterface _box;
    ERC165 _erc165;
    return interfaceID == _erc165.supportsInterface.selector 
      || interfaceID == ( _box.setValue.selector ^ _box.getValue.selector );
  }

}
