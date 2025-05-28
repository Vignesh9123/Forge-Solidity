// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/VCoin.sol";

contract TestVCoin is Test {
    VCoin public c;



    function setUp() public {
        c = new VCoin();
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

    function testRevertMint() public {
        c.mint(address(this), 100);
        vm.expectRevert();
        c.transfer(0x4C590bCBeB15093f2C5bdB4F460e9F9f90a4046C, 1000);
    }

    

    function testAllowance() public{
        c.mint(address(this), 100);
        assertEq(c.balanceOf(address(this)), 100);

        c.approve( 0x4C590bCBeB15093f2C5bdB4F460e9F9f90a4046C, 100);
        vm.prank(0x4C590bCBeB15093f2C5bdB4F460e9F9f90a4046C);
        c.transferFrom(address(this),0x2966473D85A76A190697B5b9b66b769436EFE8e5, 10 );
        assertEq(c.balanceOf(0x2966473D85A76A190697B5b9b66b769436EFE8e5), 10);
    }

    function testRevertAllowance() public{
        c.mint(address(this), 1000);
        c.approve(0x4C590bCBeB15093f2C5bdB4F460e9F9f90a4046C, 100);
        vm.expectRevert();
        c.transferFrom(address(this), 0x2966473D85A76A190697B5b9b66b769436EFE8e5, 100); // This is called by address(this) itself not by 0x4C590bCBeB15093f2C5bdB4F460e9F9f90a4046C, hence fails and reverts
    }

}
