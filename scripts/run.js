const { hexStripZeros } = require("@ethersproject/bytes");

async function main() {
  const [owner, randoPerson] = await hre.ethers.getSigners();

  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal"); // compiles the contract for us; looks in contract portal and looks for WavePortal

  const waveContract = await waveContractFactory.deploy();
  await waveContract.deployed(); // waiting for contract to be mined

  console.log("Contract deployed by:", owner.address);
  console.log("Contract deployed to:", waveContract.address);

  let waveCount;
  waveCount = await waveContract.getTotalWaves();

  let waveTxn = await waveContract.wave();
  await waveTxn.wait();

  waveCount = await waveContract.getTotalWaves();

  waveTxn = await waveContract.connect(randoPerson).wave();
  await waveTxn.wait();

  waveCount = await waveContract.getTotalWaves();
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
  });
