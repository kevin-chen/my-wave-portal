// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract WavePortal {
  uint totalWaves;
  uint private seed;
  // mapping(address => uint) public wavings;
  // mapping (uint => address) accountIndex;

  event NewWave(address indexed from, uint timestamp, string message);

  struct Wave {
    address waver;
    string message;
    uint timestamp;
  }

  Wave[] waves;

  mapping(address => uint) public lastWavedAt;

  constructor() payable {
    console.log("Yo yo, I am a contract and I am start :)!");
  }

  function wave(string memory _joke) public {
    require(lastWavedAt[msg.sender] + 30 seconds < block.timestamp, "Must wait 30 seconds before waving again.");

    lastWavedAt[msg.sender] = block.timestamp;


    // wavings[msg.sender] += 1;
    totalWaves += 1;
    console.log("%s has waved and sent the joke %s!", msg.sender, _joke);

    waves.push(Wave(msg.sender, _joke, block.timestamp));

    uint randomNumber = (block.difficulty + block.timestamp + seed) % 100;
    console.log("Random # generated: %s", randomNumber);

    seed = randomNumber;

    if (randomNumber < 50) {
      console.log("%d won!", msg.sender);

      uint prizeAmount = 0.0001 ether;
      require(prizeAmount <= address(this).balance, "Trying to withdraw more money than the contract has.");
      (bool success,) = (msg.sender).call{value: prizeAmount}("");
      require(success, "Failed to withdraw money from contract");
    }

    emit NewWave(msg.sender, block.timestamp, _joke);
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