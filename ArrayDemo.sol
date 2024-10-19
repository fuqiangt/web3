// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract ArrayDemo1 {
    uint256[5] arr = [2, 3, 4, 5];

    function getArr() public view returns (uint256[5] memory) {
        return arr;
    }

    function sumArray() public view returns (uint256) {
        uint256 sum = 0;
        for (uint256 i = 0; i < arr.length; i++) {
            sum += arr[i];
        }

        return sum;
    }

    function changeArray(uint256 _num) public {
        arr[0] = _num;
    }
}

contract ArrayTypeDemo2 {
    uint256[] array = [0];

    function getArr() public view returns (uint256[] memory) {
        return array;
    }

    function length() public view returns (uint256) {
        return array.length;
    }

    function push(uint256 _ele) public {
        array.push(_ele);
    }
}

contract ArrayTypeDemo3 {
    uint256[2][2] public arr = [[1, 2], [4, 5]];

    function setArr(uint256 arr_index,uint256 index, uint256 ele) public {
        arr[arr_index][index] = ele;
    }

    function getArr() public view returns(uint[2][2] memory){
        return arr;
    }
}


contract ArrayTypeDemo4 {
    uint256[][] public arr = [[1, 2], [4, 5]];

    function setArr(uint256 arr_index,uint256 index, uint256 ele) public {
        arr[arr_index][index] = ele;
    }

    function getArr() public view returns(uint[][] memory){
        return arr;
    }

    function push(uint256 arr_index, uint256 ele) public {
        arr[arr_index].push(ele);
    }
}
