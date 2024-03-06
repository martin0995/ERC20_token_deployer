# ERC20 Token Deployment Guide

This guide provides step-by-step instructions on how to create and deploy your own ERC20 token using Remix IDE and OpenZeppelin contracts.

## Prerequisites
- Remix IDE (https://remix.ethereum.org/)
- MetaMask extension installed in your browser

## Steps

1. **Create Token Contract**

    - Open Remix IDE (https://remix.ethereum.org/)
    - In the left-hand menu, navigate to Contracts and create a new file named `token.sol`.

2. **Import OpenZeppelin Contracts**
OpenZeppelin gives us free contracts that they developed and audited to make sure they are safe. We can use them for free.

    - We can take a look at their contracts here: [OpenZeppelin Contracts GitHub repository](https://github.com/OpenZeppelin/openzeppelin-contracts).
    - We will need the information from the ERC20 contract: [link](https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol).
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
3. **Function Description**

- The above described function uses different methods defined in the OpenZeppelin contracts.
- `_mint` refers to a function from the smart contract that mints tokens.
- `msg.sender` refers that the one who is calling this function is the one that should get these tokens.
- We are only creating 50 tokens. However, solidity does not have decimals, they use very large numbers. For this reason we must multiply our selected amount by 10^18 (in solidity ^ is **).
- Then we apply `Ownable` to the function so the mint of token is restricted only to the creator. Ownable is also a method from the OpenZeppelin contract.
- `onlyOwner` is called a “modifier”. Only the person who created this contract is allowed to call this mint function. As you can see we are importing onlyModifier in line 5.


4. **Deploy the Token**

    - Go to the Remix IDE deployment tab.
    - Select the desired blockchain network.
    - Deploy the contract.
    - Set the owner's address next to the deploy button.

5. **Test the Token**

    - After deployment, scroll down to view all contract methods.
    - Call the `mintFifty` method to mint tokens.
    - Check the balance to ensure the minting process was successful.

6. **Deploy to Actual Blockchain**

    - In Remix IDE, select `Injected Provider - MetaMask` as the environment.
    - MetaMask will open, select a specific address and accept.
    - Deploy the contract again, MetaMask will open for confirmation.
    - For this last part you will need the native token of the blockchain where you want to deploy on your account. For example, if you are looking to deploy the token in Polygon you will need to have a certain amount of MATIC on your account to pay the gas (fee) that costs the transaction. Remember that depoying your token in a certain blockchain is considered a transaction.
