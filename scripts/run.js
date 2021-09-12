const { hexStripZeros } = require("@ethersproject/bytes");

async function main() {

  // const [owner, randoPerson] = await hre.ethers.getSigners();

  const waveContractFactory = await hre.ethers.getContractFactory("WavePortal"); // compiles the contract for us; looks in contract portal and looks for WavePortal

  const waveContract = await waveContractFactory.deploy({value: hre.ethers.utils.parseEther("0.1")});
  await waveContract.deployed(); // waiting for contract to be mined
  console.log("Contract added: ", waveContract.address)

  let contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
  console.log("Contract balance: ", hre.ethers.utils.formatEther(contractBalance));

  // console.log("Contract deployed by:", owner.address);
  // console.log("Contract deployed to:", waveContract.address);

  // let waveCount;
  // waveCount = await waveContract.getTotalWaves();

  let waveTxn = await waveContract.wave("Deez nuts 1");
  await waveTxn.wait();

  waveTxn = await waveContract.wave("Deez nuts 2");
  await waveTxn.wait();

  contractBalance = await hre.ethers.provider.getBalance(waveContract.address);
  console.log("Contract balance: ", hre.ethers.utils.formatEther(contractBalance));

  // waveCount = await waveContract.getTotalWaves();

  // waveTxn = await waveContract.connect(randoPerson).wave("Deez nuts 2");
  // await waveTxn.wait();

  let allWaves = await waveContract.getAllWaves();
  console.log(allWaves);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
  });
