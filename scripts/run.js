const { hexStripZeros } = require("@ethersproject/bytes");

async function main() {
  const waveContractFactory = await hre.ethers.getContractFactory(
    "WavePortal"
  ); // compiles the contract for us; looks in contract portal and looks for WavePortal

  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed(); // waiting for contract to be mined

  console.log("Contract deployed -- ", waveContract.address);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
  });
