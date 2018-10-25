// Allows us to use ES6 in our migrations and tests.
require('babel-register')
var HDWalletProvider = require("truffle-hdwallet-provider");
var mnemonic = 'siete calma manta maleta año sílaba verde luto tubo bebida muela consejo precoz cuchara pájaro';

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1',
      port: 7545,
      network_id: '*' // Match any network id
    },
    rinkeby: {
      provider: function() {
        return new HDWalletProvider(mnemonic, "https://rinkeby.infura.io/v3/a23e0abb6e1947389b2d45137123c52d")
      },
      network_id: 1
    } 
  },
}
