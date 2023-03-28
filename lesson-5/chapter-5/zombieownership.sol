pragma solidity ^0.4.25;

import "./zombieattack.sol";
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

  function balanceOf(address _owner) external view returns (uint256) {
    return ownerZombieCount[_owner];
  }

  function ownerOf(uint256 _tokenId) external view returns (address) {
    return zombieToOwner[_tokenId];
  }

  // ERC 721의 transfer 함수를 만든다.
  // _to의 좀비 수는 증가, _from의 좀비 수는 감소
  // 해당 토큰의 오너를 _to로 변경
  // Transfer 이벤트  emit
  function _transfer(address _from, address _to, uint256 _tokenId) private {
    ownerZombieCount[_to]++;
    ownerZombieCount[_from]--;
    zombieToOwner[_tokenId] = _to;
    emit Transfer(_from, _to, _tokenId);
  }

  function transferFrom(address _from, address _to, uint256 _tokenId) external payable {

  }

   function approve(address _approved, uint256 _tokenId) external payable {

   }

}
