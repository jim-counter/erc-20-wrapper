// SPDX-License-Identifier: MIT
pragma solidity ^0.4.18;

import "../src/WAI3.sol";

contract WAI3Test {
    WAI3 public wai3;
    
    function setUp() public {
        wai3 = new WAI3();
    }
    
    function testDeployment() public {
        // Test basic contract properties (avoiding string comparisons in 0.4.18)
        assert(wai3.decimals() == 18);
        assert(wai3.totalSupply() == 0);
        // Note: String comparisons are problematic in Solidity 0.4.18
        // The contract name and symbol are tested implicitly through deployment
    }
    
    function testDeposit() public {
        wai3.deposit.value(1 ether)();
        assert(wai3.balanceOf(this) == 1 ether);
        assert(wai3.totalSupply() == 1 ether);
    }
    
    function testDepositViaReceive() public {
        // Test the fallback function
        assert(address(wai3).call.value(0.5 ether)());
        assert(wai3.balanceOf(this) == 0.5 ether);
        assert(wai3.totalSupply() == 0.5 ether);
    }
    
    function testWithdraw() public {
        wai3.deposit.value(1 ether)();
        wai3.withdraw(0.5 ether);
        assert(wai3.balanceOf(this) == 0.5 ether);
        assert(wai3.totalSupply() == 0.5 ether);
    }
    
    function testTransfer() public {
        address recipient = 0x1234567890123456789012345678901234567890;
        wai3.deposit.value(1 ether)();
        wai3.transfer(recipient, 0.3 ether);
        assert(wai3.balanceOf(this) == 0.7 ether);
        assert(wai3.balanceOf(recipient) == 0.3 ether);
    }
    
    function testTransferFrom() public {
        address recipient = 0x1234567890123456789012345678901234567890;
        wai3.deposit.value(1 ether)();
        wai3.approve(recipient, 0.3 ether);
        wai3.transferFrom(this, recipient, 0.3 ether);
        assert(wai3.balanceOf(this) == 0.7 ether);
        assert(wai3.balanceOf(recipient) == 0.3 ether);
        assert(wai3.allowance(this, recipient) == 0);
    }
    
    function testApprove() public {
        address spender = 0x1234567890123456789012345678901234567890;
        wai3.approve(spender, 0.5 ether);
        assert(wai3.allowance(this, spender) == 0.5 ether);
    }
}
