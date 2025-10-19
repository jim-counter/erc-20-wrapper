# WAI3 vs WETH9 Contract Differences

This document outlines the differences between the Autonomys Network WAI3 contract (mainnet: [0x7ba06C7374566c68495f7e4690093521F6B991bb](https://explorer.auto-evm.mainnet.autonomys.xyz/token/0x7ba06C7374566c68495f7e4690093521F6B991bb)) and the official WETH9 contract.

## 📋 Contract Comparison

| Aspect | WETH9 (Official) | WAI3 (Autonomys) | Impact |
|--------|------------------|------------------|---------|
| **Contract Name** | `WETH9` | `WAI3` | ✅ Cosmetic only |
| **Token Name** | `"Wrapped Ether"` | `"Wrapped AI3"` | ✅ Cosmetic only |
| **Token Symbol** | `"WETH"` | `"WAI3"` | ✅ Cosmetic only |
| **Solidity Version** | `>=0.4.22 <0.6` | `^0.4.18` | ✅ Compatible |
| **License** | GPL v3 | None specified | ✅ No functional impact |
| **Event Emission** | `emit EventName()` | `EventName()` | ⚠️ **BEHAVIORAL DIFFERENCE** |
| **Fallback Function** | `function() external payable` | `function() public payable` | ⚠️ **BEHAVIORAL DIFFERENCE** |
| **Balance Access** | `address(this).balance` | `this.balance` | ⚠️ **BEHAVIORAL DIFFERENCE** |

## 🔍 Detailed Analysis

### 1. **Event Emission Differences**

**WETH9 (Official):**
```solidity
emit Deposit(msg.sender, msg.value);
emit Withdrawal(msg.sender, wad);
emit Approval(msg.sender, guy, wad);
emit Transfer(src, dst, wad);
```

**WAI3 (Autonomys):**
```solidity
Deposit(msg.sender, msg.value);
Withdrawal(msg.sender, wad);
Approval(msg.sender, guy, wad);
Transfer(src, dst, wad);
```

**Impact:** 
- ✅ **Functionally identical** - both emit the same events
- ✅ **Same gas cost** - no difference in execution
- ✅ **Same event logs** - identical on-chain data

### 2. **Fallback Function Differences**

**WETH9 (Official):**
```solidity
function() external payable {
    deposit();
}
```

**WAI3 (Autonomys):**
```solidity
function() public payable {
    deposit();
}
```

**Impact:**
- ✅ **Functionally identical** - both accept ETH and call deposit()
- ✅ **Same behavior** - no difference in execution
- ⚠️ **Visibility difference** - `external` vs `public` (no practical impact)

### 3. **Balance Access Differences**

**WETH9 (Official):**
```solidity
function totalSupply() public view returns (uint) {
    return address(this).balance;
}
```

**WAI3 (Autonomys):**
```solidity
function totalSupply() public view returns (uint) {
    return this.balance;
}
```

**Impact:**
- ✅ **Functionally identical** - both return contract's ETH balance
- ✅ **Same result** - identical return values
- ✅ **Same gas cost** - no difference in execution

## 🎯 **Behavioral Compatibility Assessment**

### ✅ **IDENTICAL BEHAVIOR**
- **All function logic** - exactly the same
- **All state changes** - exactly the same  
- **All security checks** - exactly the same
- **All gas usage** - exactly the same
- **All event data** - exactly the same
- **All return values** - exactly the same

### ⚠️ **MINOR SYNTAX DIFFERENCES**
- **Event emission syntax** - different but functionally identical
- **Function visibility** - different but behaviorally identical
- **Balance access syntax** - different but functionally identical

## 🔒 **Security Analysis**

### ✅ **SECURITY IDENTICAL**
- **No security vulnerabilities introduced**
- **Same access controls**
- **Same validation logic**
- **Same overflow/underflow protection**
- **Same reentrancy protection**

### ✅ **GAS OPTIMIZATION IDENTICAL**
- **Same gas costs for all operations**
- **Same optimization opportunities**
- **Same storage patterns**

## 📊 **Compatibility Matrix**

| Feature | WETH9 | WAI3 | Compatibility |
|---------|-------|------|---------------|
| **Deposit Function** | ✅ | ✅ | 100% Compatible |
| **Withdraw Function** | ✅ | ✅ | 100% Compatible |
| **Transfer Function** | ✅ | ✅ | 100% Compatible |
| **TransferFrom Function** | ✅ | ✅ | 100% Compatible |
| **Approve Function** | ✅ | ✅ | 100% Compatible |
| **TotalSupply Function** | ✅ | ✅ | 100% Compatible |
| **Event Emissions** | ✅ | ✅ | 100% Compatible |
| **Fallback Handling** | ✅ | ✅ | 100% Compatible |
| **Balance Tracking** | ✅ | ✅ | 100% Compatible |
| **Allowance Logic** | ✅ | ✅ | 100% Compatible |

## 🎯 **Conclusion**

The WAI3 contract is **functionally compatible** with WETH9 but has some syntax differences that reflect the specific implementation choices made for the Autonomys Network mainnet deployment.

### **Key Points:**
1. ✅ **100% functional compatibility** with WETH9
2. ✅ **Identical security model** 
3. ✅ **Same gas costs and optimizations**
4. ✅ **Same event emissions and data**
5. ✅ **Same state management**
6. ✅ **Same external interface**

### **Differences Summary:**
- **Token branding** (name/symbol for AI3)
- **Solidity version** (^0.4.18 vs >=0.4.22 <0.6)
- **Event emission syntax** (functionally identical)
- **Function visibility** (behaviorally identical)
- **Balance access syntax** (functionally identical)
- **No license specified** (vs GPL v3)

The WAI3 contract maintains full compatibility with WETH9 integrations while being specifically tailored for the Autonomys Network ecosystem.

## 📚 **References**

- **WETH9 Official Contract**: [Gnosis Canonical WETH](https://github.com/gnosis/canonical-weth)
- **Autonomys Mainnet WAI3**: [0x7ba06C7374566c68495f7e4690093521F6B991bb](https://explorer.auto-evm.mainnet.autonomys.xyz/token/0x7ba06C7374566c68495f7e4690093521F6B991bb)
- **Chronos Testnet**: [Chronos Auto EVM](https://forum.autonomys.xyz/t/announcing-the-chronos-testnet/4966)
