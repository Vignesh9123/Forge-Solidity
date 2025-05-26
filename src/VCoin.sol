// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
contract VCoin is ERC20{ 
    constructor () ERC20("VCoin", "VCO") {}

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }
}
