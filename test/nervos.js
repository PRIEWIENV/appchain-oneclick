const { default: Nervos } = require('@nervos/chain')

const config = {
  chain: 'http://localhost:1337',
  privateKey: '0x5f0258a4778057a8a7d97809bd209055b2fbafa654ce7d31ec7191066b9225e6',
  contractAddress: ''
}

const nervos = Nervos(config.chain) // config.chain indicates that the address of Appchain to interact
const account = nervos.appchain.accounts.privateKeyToAccount(config.privateKey) // create account by private key from config

nervos.appchain.accounts.wallet.add(account) // add account to nervos

module.exports = nervos
