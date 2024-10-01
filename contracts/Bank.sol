// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Bank {
    event UserCreated(string indexed _name, uint256 indexed id);
    event Deposited(uint256 indexed _amount, address indexed _accountAddress);

    address admin;

    struct Account {
        uint256 id;
        string name;
        uint256 balance;
        address accountAddress;
    }

    Account[] public allAccounts;
    mapping(address => uint256) public userBalance;

    function createUser(string memory _name) public {
        for (uint256 i = 0; i < allAccounts.length; i++) {
            require(msg.sender != allAccounts[i].accountAddress, "Account already exists");
        }

        uint256 id = allAccounts.length + 1;
        Account memory myAccount = Account(id, _name, 0, msg.sender);
        allAccounts.push(myAccount);
        userBalance[msg.sender] = 0;

        emit UserCreated(_name, id);
    }

    function depositAccount(uint256 _amount) public {
        require(_amount > 0, "Amount must be more than zero");

        userBalance[msg.sender] += _amount;
        for (uint256 i = 0; i < allAccounts.length; i++) {
            if (msg.sender == allAccounts[i].accountAddress) {
                allAccounts[i].balance += _amount;
                break;
            }
        }

        emit Deposited(_amount, msg.sender);
    }

    function transfer(address to, uint256 _amount) public {
        require(_amount > 0, "Amount must be more than zero");
        require(userBalance[msg.sender] >= _amount, "Insufficient balance");

        userBalance[msg.sender] -= _amount;
        userBalance[to] += _amount;
        for (uint256 i = 0; i < allAccounts.length; i++) {
            if (msg.sender == allAccounts[i].accountAddress) {
                allAccounts[i].balance -= _amount;
            }
            if (to == allAccounts[i].accountAddress) {
                allAccounts[i].balance += _amount;
            }
        }
    }

    function checkBalance() public view returns (uint256) {
        return userBalance[msg.sender];
    }

    function checkUserBalance(address _userAddress) public view returns (uint256) {
        return userBalance[_userAddress];
    }

    receive() external payable{

    }

    fallback() external payable { }

    function getBalance() public view returns(uint256) {
        return address(this).balance;
    }
}
