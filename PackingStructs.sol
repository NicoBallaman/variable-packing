// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract PackingStructs {

    
    //firstStruct: Evm does is try to fit everything into storage slots sequentially, but since
    //variable b takes up an entire slot, it cannot fit in in the first one and needs
    //to allocate a total of 3 32byte slots
    struct firstStruct {
        uint128 a;
        uint256 b;
        uint128 c;
    }

    //If you instead order them so that the two smaller slots are next to each other,
    //secondStruct: you can save one such storage operation. That would allow for the EVM to only
    //need to allocate two storage slots and 'pack' your variables. Total of 2 32
    //bytes slots
    struct secondStruct {
        uint128 a;
        uint128 c;
        uint256 b;
    }

    //thirdStruct: It will be cheaper to make both variables uint256. The reason for this is that
    //the EVM reads 32 bytes at a time and will have to do some operations to make the
    //data it is reading go down to 8 bits (1 byte) which is counter productive.
    struct thirdStruct {
        uint8 a;
        uint256 b;
    }

}
