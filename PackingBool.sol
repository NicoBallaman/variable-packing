// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PackingBool {
    
    uint256 _packedBools;

    function getBoolean(uint256 _boolNumber) public view returns (bool) {
        uint256 flag = (_packedBools >> _boolNumber) & uint256(1);
        return (flag == 1 ? true : false);
    }
    
    function setBoolean( uint256 _boolNumber, bool _value) public returns(uint256) {
        if (_value) {
            _packedBools = _packedBools | uint256(1) << _boolNumber;
        }
        else {
            _packedBools = _packedBools & ~(uint256(1) << _boolNumber);
        }
        return _packedBools;
    }

}