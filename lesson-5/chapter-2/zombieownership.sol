pragma solidity ^0.4.25;

import "./zombieattack.sol";

// erc721을 상속하는 챕터
// 의문점? erc721.sol을 임포트 헀는데, 상속은 ERC721로 함.
// 이거 괜찮나?
import "./erc721.sol";

contract ZombieOwnership is ZombieAttack, ERC721 {

}
