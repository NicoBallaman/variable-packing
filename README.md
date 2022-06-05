# variable-packing

## Packing Structs

**Problem:** In Ethereum, the minimum unit of memory is a slot of 256 bits. You pay for an integer number of slots even if they are not full.

**Solution:** Pack the variables. When declaring storage variables, the packable ones, with the same data type, should be declared consecutively. In this way, the packing is done automatically by the Solidity compiler. (Note that this pattern does not work for Memory and Calldata memories, whose variables cannot be packed.).

**Example code:** [PackingStructs.sol](https://github.com/NicoBallaman/variable-packing/blob/main/PackingStructs.sol)

## Packing Booleans

**Problem:** In Solidity, Boolean variables are stored as uint8 (unsigned integer of 8 bits). However, only 1 bit would be enough to store them. If you need up to 32 Booleans together, you can just follow the Packing Variables pattern. If you need more, you will use more slots than actually needed.

**Solution:** Pack Booleans in a single uint256 variable. To this purpose, create functions that pack and unpack the Booleans into and from a single variable. The cost of running these functions is cheaper than the cost of extra Storage.

With this technique, you can store 256 booleans in one storage slot. If you try to pack bool normally (like in a struct) then you will only be able to fit 32 bools in one slot. Use this only when you want to store more than 32 booleans.

**Example code:** [PackingBool.sol](https://github.com/NicoBallaman/variable-packing/blob/main/PackingBool.sol)

<br>
<hr>
<br>

### source:
- [Layout of State Variables in Storage](https://docs.soliditylang.org/en/v0.8.13/internals/layout_in_storage.html)
- [solidity patterns: tight variable packing](https://fravoll.github.io/solidity-patterns/tight_variable_packing.html)
