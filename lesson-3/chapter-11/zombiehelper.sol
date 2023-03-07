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

  // storage에 데이터를 쓰면 비싸기 때문에
  // 만약, 배열을 사용한다면 함수 안에서 배열을 memory에 쓰는 방법을 쓴다.
  // external view함수를 쓰면 사용자들이 가스를 쓰지않고, 데이터를 받아볼 수 있다.
  function getZombiesByOwner(address _owner) external view returns(uint[]) {
    uint[] memory result = new uint[](ownerZombieCount[_owner]);

    return result;
  }

}
