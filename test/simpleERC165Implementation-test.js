const { expect } = require("chai")

describe("BoxSimpleERC165Implementation", function () {
  
  it("Testing simpleERC165Implementation()", async function () {
    const BoxSimpleERC165Implementation = await ethers.getContractFactory("BoxSimpleERC165Implementation")
    const contract = await BoxSimpleERC165Implementation.deploy()
    await contract.deployed()

    // ERC165 - InterfaceID - 0x01ffc9a7
    // BoxInterface - InterfaceID - 0x75b24222

    // See if contract supports - ERC165
    expect(await contract.supportsInterface("0x01ffc9a7")).to.equal(true)

    // See if contract supports - Box Contracts Interface
    expect(await contract.supportsInterface("0x75b24222")).to.equal(true)
  })
  
})

describe("BoxAdminSimpleERC165Implementation", function () {
  
  it("Testing readValue()", async function () {
    const BoxSimpleERC165Implementation = await ethers.getContractFactory("BoxSimpleERC165Implementation")
    const BoxAdminSimpleERC165Implementation = await ethers.getContractFactory("BoxAdminSimpleERC165Implementation")
    const Box = await ethers.getContractFactory("Box")
    const BoxWithERC165 = await ethers.getContractFactory("BoxWithERC165")

    const boxContract = await BoxSimpleERC165Implementation.deploy()
    const boxAdminContract = await BoxAdminSimpleERC165Implementation.deploy()
    const box = await Box.deploy()
    const boxWithERC165 = await BoxWithERC165.deploy()

    await boxContract.deployed()
    await boxAdminContract.deployed()
    await box.deployed()

    await (await boxContract.setValue(10)).wait()
    expect(await boxContract.getValue()).to.equal("10")

    expect(await boxAdminContract.readValue(boxContract.address)).to.equal("10")
    await expect(boxAdminContract.readValue(box.address)).to.be.reverted
    await expect(boxAdminContract.readValue(boxWithERC165.address)).to.be.revertedWith("Contract Doesn't Support Box Interface")
    
  })
  
})
