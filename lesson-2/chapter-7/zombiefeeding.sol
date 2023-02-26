pragma solidity ^0.4.25;
import "./zombiefactory.sol";
contract ZombieFeeding is ZombieFactory {

  function feedAndMultiply(uint _zombieId, uint _targetDna) public {
    // require로 좀비id만 가지고 있는 오너만 이 함수를 쓸 수 있다.
    require(msg.sender == zombieToOwner[_zombieId]);
    // 기본적으로 함수에 있는 변수는 메모리에 저장 되지만, 이 storage가 붙인 변수는 블록체인에 저장된다.
    Zombie storage myZombie = zombies[_zombieId];
  }

}
