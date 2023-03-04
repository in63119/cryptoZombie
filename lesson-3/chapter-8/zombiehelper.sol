pragma solidity ^0.4.25;
import "./zombiefeeding.sol";
contract ZombieHelper is ZombieFeeding {

  // 제어자는 인수를 받을 수 있다.
  modifier aboveLevel(uint _level, uint _zombieId) {
    // 현재는 _zombieId의 level이 인자로 들어오는 _level보다 이상인지 확인하고 있다.
    require(zombies[_zombieId].level >= _level);
    _;
  }

}
