pragma solidity ^0.4.4;

//When you compile a contract the instance of that contract gets stores on
//the enthereum blockchain so unlike other programming languages the instance
//is stored in memory all the values is stored in the blockchain

contract myFirstContract {
  string private name;
  uint private age;

  function setName(string newName) {
    name = newName;
  }

  function getName() return (string) {
    return name;
  }

  function setAge(unit newAge) {
    age = newAge
  }
  function getAge() returns (uint) {
    return age;
  }
}
