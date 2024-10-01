# Bank Smart Contract

## Overview
The `Bank` smart contract allows users to create accounts, deposit funds, and transfer balances between accounts. It also includes a basic balance-checking functionality for users. The contract is designed with security in mind, ensuring that no duplicate accounts can be created for a single address and that all transfers are properly validated.

## Functions

### `createUser(string _name)`
- **Description**: Allows users to create a new account with a unique address and name.
- **Events**: Emits `UserCreated` event upon successful account creation.

### `depositAccount(uint256 _amount)`
- **Description**: Allows users to deposit funds into their account.
- **Events**: Emits `Deposited` event upon a successful deposit.

### `transfer(address to, uint256 _amount)`
- **Description**: Transfers funds from the caller’s account to another user's account.
- **Validation**: Ensures sufficient balance for the transfer and checks if the transfer amount is valid.

### `checkBalance()`
- **Description**: Allows users to check the balance of their own account.

### `checkUserBalance(address _userAddress)`
- **Description**: Allows users to check the balance of another account by providing the user’s address.

### `getBalance()`
- **Description**: Returns the total balance held by the contract.

### `receive()` and `fallback()`
- **Description**: Fallback and receive functions to handle incoming Ether transactions.

## Deployed Addresses
- **Contract Address**: `0x5Cd6CF63144670808B0D0b3Fa784741a2546098B`

## Verified Address
The contract was deployed and verified on Sepolia testnet at the following link:
- [Lisk Sepolia](https://sepolia-blockscout.lisk.com/address/0x5Cd6CF63144670808B0D0b3Fa784741a2546098B)

## License
This project is licensed under the MIT License.
