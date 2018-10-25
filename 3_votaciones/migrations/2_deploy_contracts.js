var VotingLib = artifacts.require('./Voting.sol');

module.exports = function (deployer) {
	deployer.deploy(VotingLib, 5000, web3.toWei('0.1','ether'), ['Anaya','Lopez','Meade']);
}