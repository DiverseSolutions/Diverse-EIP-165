// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./BoxInterface.sol";
import "./ERC165.sol";

contract BoxAdminSimpleERC165 {

  function readValue(address box_address) external view returns (uint){

    if(ERC165(box_address).supportsInterface(0x75b24222) == false){
      revert("Contract Doesn't Support Box Interface");
    }

    // If contract supports BoxInterface
    return BoxInterface(box_address).getValue();
  }

}
