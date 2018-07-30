// TODO: Get console to read abi and contract address
$(document).ready(function() {
    if (typeof web3 !== 'undefined') {
        window.web3 = new Web3(web3.currentProvider);
    } else {
        // set the provider you want from Web3.providers
        window.web3 = new Web3(new Web3.providers.HttpProvider("http://localhost:9545"));
    }
});

let fs = require("fs");
let Web3 = require("web3");
let web3 = new Web3();
web3.setProvider(new web3.providers.HttpProvider('http://localhost:8545'));

let source = fs.readFileSync("HabitContract.json");
let contracts = JSON.parse(source)["HabitContract"];

let abi = JSON.parse(contracts.HabitContract.abi);
let code = contracts.HabitContract.bin;
let HabitContract = web3.eth.contract(abi);

let contract = HabitContract.new({from: web3.eth.accounts, gas: 4700000});

// var habitContractAddress;// = require('./contracts/HabitContract.sol');

// web3.eth.defaultAccount = web3.eth.accounts[0];

// var fs = require('fs');
// var avatarContractAbi = JSON.parse(fs.readFileSync('./HabitContract.json', 'utf8'));
// console.log(avatarContractAbi);
// module.exports = async function(deployer) {
//     deployer.deploy(habitContractAddress)
//     .then(() => habitContractAddress.deployed())
//     .then(_instance => console.log(_instance.address));
//     var avatarContract = await new web3.eth.Contract(avatarContractAbi.abi,_instance);
// };

function createAvatar(name) {
    HabitContract.deployed().then(function(instance){
        instance.createAvatar("");
    })
}

$(function() {
    console.log("ready");
});