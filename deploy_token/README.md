# ERC20 Token Deployment Guide

This guide provides step-by-step instructions on how to create and deploy your own ERC20 token using Remix IDE and OpenZeppelin contracts.

## Prerequisites
- Access to a web browser
- Remix IDE (https://remix.ethereum.org/)
- MetaMask extension installed in your browser

## Steps

1. **Create Token Contract**

    - Open Remix IDE (https://remix.ethereum.org/)
    - In the left-hand menu, navigate to Contracts and create a new file named `token.sol`.

2. **Import OpenZeppelin Contracts**

    - Go to [OpenZeppelin Contracts GitHub repository](https://github.com/OpenZeppelin/openzeppelin-contracts).
    - Copy the code of the ERC20 contract from this [link](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol).
    - Paste the code into your `token.sol` file.
    - Import the ERC20 and Ownable contracts in your `token.sol` file:
        ```solidity
        pragma solidity 0.8.20;

        import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
        import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";

        contract HofmannToken is ERC20, Ownable {
            constructor(address initialOwner) ERC20("Hofmann", "BIKE") Ownable(initialOwner) {}

            function mintFifty() public onlyOwner {
                _mint(msg.sender, 50 * 10**18);
            }
        }
        ```

3. **Deploy the Token**

    - Go to the Remix IDE deployment tab.
    - Select the desired blockchain network.
    - Deploy the contract.
    - Set the owner's address next to the deploy button.

4. **Test the Token**

    - After deployment, scroll down to view all contract methods.
    - Call the `mintFifty` method to mint tokens.
    - Check the balance to ensure the minting process was successful.

5. **Deploy to Actual Blockchain**

    - In Remix IDE, select `Injected Provider - MetaMask` as the environment.
    - MetaMask will open, select a specific address and accept.
    - Deploy the contract again, MetaMask will open for confirmation.

## Notes
- The `mintFifty` function mints 50 tokens to the owner's address.
- The `onlyOwner` modifier ensures only the contract owner can mint tokens.
- Solidity uses large numbers for decimals, hence `10**18` is used for precision.
- MetaMask integration allows deployment on an actual blockchain network.
