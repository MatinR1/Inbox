// deploy code will go here

const HDWalletProvider = require('truffle-hdwallet-provider');
const Web3 = require('web3');
const { interface, bytecode } = require('./compile');

const provider = new HDWalletProvider(
  'shrimp maple truth ball way forget insect pony close beach catalog payment',
  'https://rinkeby.infura.io/v3/f327b3aa60da4c60b255b5bbc03ff3ed'
);

const web3 = new Web3(provider);

const deploy = async() => {
  const accounts = await web3.eth.getAccounts();

  console.log('Attempting to deploy from account',accounts[0])
  const result = await new web3.eth.Contract(JSON.parse(interface))
    .deploy({data: bytecode, arguments: ['Hi there!']})
    .send({ gas: '1000000', gasPrice: '5000000000', from: accounts[0] });

  console.log('Contract is deployed to:',result.options.address);
};
deploy();
