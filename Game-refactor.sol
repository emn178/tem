pragma solidity ^0.5.11;

library Helper {
  function random(uint256 max) internal view returns (uint32) {
    return uint32(uint256(keccak256(abi.encodePacked(blockhash(block.number)))) % max);
  }
}

contract Game {
  struct Player {
    uint32 level;
    uint32 hp;
    uint32 maxHp;
    uint32 mp;
    uint32 maxMp;
    uint32 exp;
    uint32 atk;
    uint32 def;
  }

  mapping(address => Player) public players;

  function init() external {
    players[msg.sender] = Player(1, 100, 100, 10, 10, 250, 5, 5);
  }

  function buyExp() external payable {
    players[msg.sender].exp = uint32(players[msg.sender].exp + msg.value / 0.01 ether);
  }

  function levelUp_UgD() external {
    Player memory player = players[msg.sender];
    require(player.exp >= 100);
    while (player.exp >= 100) {
      player.level += 1;
      player.exp -= 100;
      player.maxHp += Helper.random(5);
      player.maxMp += Helper.random(5);
      player.atk += Helper.random(5);
      player.def += Helper.random(5);
    }
    players[msg.sender] = player;
  }
}
