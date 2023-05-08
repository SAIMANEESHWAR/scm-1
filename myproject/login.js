const ABI2=[
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_divid",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_divpass",
				"type": "string"
			}
		],
		"name": "adddiv",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_divid",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "_ids",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "_pass",
				"type": "string"
			}
		],
		"name": "addunits",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "adddivreturns",
		"outputs": [
			{
				"internalType": "uint256[]",
				"name": "",
				"type": "uint256[]"
			},
			{
				"internalType": "string[]",
				"name": "",
				"type": "string[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "_divid",
				"type": "uint256"
			}
		],
		"name": "giveunits",
		"outputs": [
			{
				"internalType": "uint256[]",
				"name": "",
				"type": "uint256[]"
			},
			{
				"internalType": "string[]",
				"name": "",
				"type": "string[]"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
];
const address2 ="0x6e52Bec6Ad72A3eAD8F8cF3B5529217EE631F07b";