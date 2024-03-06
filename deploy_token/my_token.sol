//SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

contract HofmannToken is ERC20, Ownable {

    constructor(address initialOwner) ERC20("Hofmann", "BIKE") Ownable(initialOwner) {}

    function mintFifty() public onlyOwner {
        _mint(msg.sender, 50 * 10**18);
    }
}
