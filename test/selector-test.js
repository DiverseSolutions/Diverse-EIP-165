const { expect } = require("chai")

describe("Selector", function () {

  it("Testing erc165Selector()", async function () {
    const Selector = await ethers.getContractFactory("Selector")
    const contract = await Selector.deploy()
    await contract.deployed()
    
    expect(await contract.erc165Selector()).to.equal("0x01ffc9a7")
  })

  
  it("Testing erc165SelectorCorrect()", async function () {
    const Selector = await ethers.getContractFactory("Selector")
    const contract = await Selector.deploy()
    await contract.deployed()

    expect(await contract.erc165SelectorCorrect()).to.equal(true)
  })
  

})
