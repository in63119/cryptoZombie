pragma solidity ^0.4.25;
import "./zombiehelper.sol";
contract ZombieAttack is ZombieHelper {
  // 의사 난수를 생성하는 방법
  // 여기서는 keccak을 사용하여 의사 난수를 생성하였다. 
  uint randNonce = 0;

  function randMod(uint _modulus) internal returns(uint) {
    randNonce++;
    return uint(keccak256(abi.encodePacked(now, msg.sender, randNonce))) % _modulus;
  }
}
