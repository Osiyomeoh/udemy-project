(async() => {
    const address = "0xd9145CCE52D386f254917e481eB44e9943F39138";
    const abiArray = [
	{
		"inputs": [],
		"name": "myUint",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "newUint",
				"type": "uint256"
			}
		],
		"name": "setMyuint",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	}
];

    const contractInstance = new web3.eth.Contract(abiArray, address);

    console.log(await contractInstance.methods.myUint().call());

	let accounts = await web3.eth.getAccounts();
	let txResult = await contractInstance.methods.setMyuint(789).send({from: accounts[0]});

	console.log(await contractInstance.methods.myUint().call());
	console.log(txResult);

})()