// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract structType {
    struct Person {
        string name;
        string gender;
        uint256 age;
    }

    Person person;

    function initial(
        string calldata _name,
        string calldata _gender,
        uint256 _age
    ) public {
        person.name = _name;
        person.gender = _gender;
        person.age = _age;
    }

    function getPerson() public view returns (Person memory) {
        return person;
    }
}
