// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract StringTypeDemo {
    string str = unicode"你好";

    string public str2 = "123";
    //中文不适用unicode编码报错
    string public str3 = unicode"abc";

    function concat() public view returns (string memory) {
        string memory result = string.concat(str2, str3);
        return result;
    }

    function concat2(string memory _a, string memory _b)
        public
        pure
        returns (bytes memory)
    {
        bytes memory _ba = bytes(_a);
        bytes memory _bb = bytes(_b);
        bytes memory result = bytes.concat(_ba, _bb);
        return result;
    }

    function concat3() public view returns (string memory) {
        bytes memory _ba = bytes(str2);
        bytes memory _bb = bytes(str3);
        string memory result = string(bytes.concat(_ba, _bb));
        return result;
    }

    function testString() public view returns (bool) {
        return keccak256(abi.encodePacked(str2)) == keccak256(abi.encodePacked(str3));
    }

    function concat4() public view  returns (string memory){
        return string(abi.encodePacked(str2,str3));
    }
}
