var HabitContract = artifacts.require("./HabitContract");

module.exports = function(deployer) {
  deployer.deploy(HabitContract);
};
