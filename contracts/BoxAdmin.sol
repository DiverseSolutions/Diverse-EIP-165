// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./BoxInterface.sol";

contract BoxAdmin {

  function readValueUsingInterface(address box_address) external view returns (uint){
    return BoxInterface(box_address).getValue();
  }

}
