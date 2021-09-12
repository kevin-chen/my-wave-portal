// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
  uint totalWaves;
  // mapping(address => uint) public wavings;
  // mapping (uint => address) accountIndex;

  event NewWave(address indexed from, uint timestamp, string message);

  struct Wave {
    address waver;
    string message;
    uint timestamp;
  }

  Wave[] waves;

  constructor() payable {
    console.log("Yo yo, I am a contract and I am start :)!");
  }

  function wave(string memory _joke) public {
    // wavings[msg.sender] += 1;
    totalWaves += 1;
    console.log("%s has waved and sent the joke %s!", msg.sender, _joke);

    waves.push(Wave(msg.sender, _joke, block.timestamp));

    emit NewWave(msg.sender, block.timestamp, _joke);

    uint prizeAmount = 0.0001 ether;
    require(prizeAmount <= address(this).balance, "Trying to withdraw more money than the contract has.");
    (bool success,) = (msg.sender).call{value: prizeAmount}("");
    require(success, "Failed to withdraw money from contract");
  }

  function getAllWaves() view public returns (Wave[] memory) {
    return waves;
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