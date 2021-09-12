// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
  uint totalWaves;
  // mapping(address => uint) public wavings;
  // mapping (uint => address) accountIndex;

  constructor() {
    console.log("Yo yo, I am a contract and I am start :)!");
  }

  function wave() public {
    // wavings[msg.sender] += 1;
    totalWaves += 1;
    console.log("%s has waved!", msg.sender);
  }

  function getTotalWaves() view public returns (uint) {
    console.log("We have %d total waves", totalWaves);
    // for(uint i=0; i < totalWaves; i++)
    // {
    //   console.log("%d", wavings[]);
    // }
    return totalWaves;
  }


}