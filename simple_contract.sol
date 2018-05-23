pragma solidity ^0.4.4;


//Defining a interface
interface Regulator {
  //make sure that there is enough value in the case of withdraws
  function checkValue(uint amount) returns (bool);
  function loan() returns (bool);
}


//When you compile a contract the instance of that contract gets stores on
//the enthereum blockchain so unlike other programming languages the instance
//is stored in memory all the values is stored in the blockchain
contract Bank is Regulator {
  uint private value;

  function Bank(uint amount) {
    value = amount;
  }

  function deposit(uint amount){
    value += amount;
  }

  function withdraw(uint amount) {
    value -= amount;
  }

  function balance() returns (uint) {
    return value;
  }
}

contract myFirstContract is Bank(10) {
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

  function checkValue(uint amount) returns (bool) {
    return true;
  }

  function loan() returns (bool) {
    return true;
  }
}
