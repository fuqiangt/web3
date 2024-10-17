// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract StroageDemo {
    string name;
}

contract Person {
    struct State {
        string name;
        string gender;
    }

    State public state;

    function setState(string calldata _name, string calldata _gender) external {
        state.name = _name;
        state.gender = _gender;
    }

    function getName() external view returns (string memory) {
        return state.name;
    }

    function changeGender(uint256 value) external {
        require((value == 0 || value == 1), "Person: input value error.");
        string memory newGender;
        newGender = value == 0 ? "female" : "male";
        state.gender = newGender;
    }
}

contract Counter {
    function start() external pure returns (uint sum) {
        uint256 a1 = 1;
        uint256 a2 = 1;
        uint256 a3 = 1;
        uint256 a4 = 1;
        uint256 a5 = 1;
        sum = a1 + a2 + a3 + a4 + a5;

        return sum;
    }
}
