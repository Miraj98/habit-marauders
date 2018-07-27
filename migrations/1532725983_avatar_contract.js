var AvatarContract = artifacts.require("./AvatarContract.sol");

module.exports = function(deployer) {
  deployer.deploy(AvatarContract);
};
