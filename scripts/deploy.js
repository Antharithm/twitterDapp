const hre = require("hardhat");

async function main() {
    const TwitterDapp = await hre.ethers.getContractFactory("TwitterDapp");
    const twitterDapp = await TwitterDapp.deploy();
    await twitterDapp.deployed();

    console.log("TwitterDapp contract was deployed to: ", twitterDapp.address);
}

main().catch((error)=>{
    console.log(error);
    process.exitCode = 1;
})