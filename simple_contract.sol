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
  // address is a reference to the enthereum address
  address private owner;
  //Creating a modifier so only the owner can access the bank
  modifier ownerFunc {
    require(owner == msg.sender);
    _;
  }

  function Bank(uint amount) {
    value = amount;
    owner = msg.sender;
  }

  // Calling the ownerFunc to state nobody but the owner of the original
  // contract can modify anything.
  function deposit(uint amount) internal ownerFunc {
    value += amount;
  }

  function withdraw(uint amount) private ownerFunc {
    if (checkValue(amount)) {
      value -= amount;
    }
  }

  function balance() returns (uint) {
    return value;
  }

  function checkValue(uint amount) returns (bool) {
    return amount >= value;
  }

  function loan() returns (bool) {
    return value > 0;
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

}

//Error handling
contract testThrows {
  function testAsser() {
    //Data vadilidation on runtime, the assert method consume gas as well while
    //sending the message
    assert(1 == 2) //which will be false
  }

  function testRequire() {
    // paramenter requirement
    require(2 == 1);
  }

  function testRevert() {
    //revert should revert the gas cost of the message sent
    revert()
  }

  function testThrow() {
    throw;
  }
}
