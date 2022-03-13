// SPDX-License-Identifier: MIT
pragma solidity ^0.8.12;

import "./BoxInterface.sol";
import "./ERC165-Query.sol";

contract BoxAdminSimpleERC165Query is ERC165Query {

  function readValue(address box_address) external view returns (uint){

    if(this.doesContractImplementInterface(box_address,0x75b24222) == false){
      revert("Contract Doesn't Support Box Interface");
    }

    // If contract supports BoxInterface
    return BoxInterface(box_address).getValue();
  }

}
