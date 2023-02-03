//SPDX-License-Identifier: MIT

pragma solidity ^0.8.13;

contract Bank {
    mapping(address => uint256) private _balances;

    function deposit(uint money) public payable {
        _balances[msg.sender] += money;
    }

    function balanceOf(address account) public view returns (uint256) {
        return _balances[account];
    }

    function withdraw(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount);
        _balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }
}
