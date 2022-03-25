// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

/* In this contract, an ERC20 fungible Token with the name of
"MatinToken" is written which has the mint and burn functions*/ 

/* The number of decimals is 18 (default of ETH)
And the premint amount is considered to be 10000*/

contract MatinToken is ERC20, ERC20Burnable, Ownable {
    constructor() ERC20("MatinToken", "MTK") {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }
}