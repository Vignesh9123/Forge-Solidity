// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VCoin.sol";

contract TestVCoin is Test {
    VCoin public c;



    function setUp() public {
        c = new VCoin();
    }

    function testDummy() public {
        assertEq(uint(1), uint(1));
    }

    function testMint() public {
        c.mint(msg.sender, 100);
        assertEq(c.balanceOf(msg.sender), 100);
    }

    function testTransfer() public {
        c.mint(address(this), 100);
        c.transfer(msg.sender, 50);
        assertEq(c.balanceOf(msg.sender), 50);
        assertEq(c.balanceOf(address(this)), 50);

    }

}
