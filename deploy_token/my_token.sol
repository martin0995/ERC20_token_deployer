//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

// Choose any name you want for TestToken
contract TestToken is ERC20, Ownable {

    // Define token_name and token_symbol
    constructor(address initialOwner) ERC20("token_name", "token_symbol") Ownable(initialOwner) {}

    function mintFifty() public onlyOwner {
        // Mint 50 tokens to the contract owner
        _mint(msg.sender, 50 * 10**18);
    }
}
