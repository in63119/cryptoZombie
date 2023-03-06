pragma solidity ^0.4.25;
import "./zombiefeeding.sol";
contract ZombieHelper is ZombieFeeding {

  modifier aboveLevel(uint _level, uint _zombieId) {
    require(zombies[_zombieId].level >= _level);
    _;
  }

  function changeName(uint _zombieId, string _newName) external aboveLevel(2, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].name = _newName;
  }

  function changeDna(uint _zombieId, uint _newDna) external aboveLevel(20, _zombieId) {
    require(msg.sender == zombieToOwner[_zombieId]);
    zombies[_zombieId].dna = _newDna;
  }

  // view 함수를 이용해 가스 절약하기
  // view 함수는 외부에서 호출되었을 때 가스를 전혀 소모하지 않는다.
  // 트랜잭션을 만들지 않기 때문이다.
  // 외부에서 써야 하기 때문에 external과 view를 같이 써준다.
  function getZombiesByOwner(address _owner) external view returns(uint[]) {

  }

}
