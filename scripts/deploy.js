const { hexStripZeros } = require("@ethersproject/bytes");

async function main() {
  // const [deployer] = await  hre.ethers.getSigners();

  const waveContractFactory = await ethers.getContractFactory("WavePortal"); // compiles the contract for us; looks in contract portal and looks for WavePortal
  const waveContract = await waveContractFactory.deploy({value: ethers.utils.parseEther("0.1")});
  await waveContract.deployed();
  console.log("WavePortal address:", waveContract.address);

  // console.log("Deploying contracts with the account:", deployer.address);
  // console.log("Account balance:", (await deployer.getBalance()).toString());

  // const Token = await  hre.ethers.getContractFactory("WavePortal");
  // const token = await Token.deploy();

  // console.log("WavePortal address:", token.address);
}

main()
  .then(() => {
    process.exit(0);
  })
  .catch((error) => {
    console.log(error);
  });
