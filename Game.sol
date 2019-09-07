pragma solidity ^0.5.11;

library Helper {
  function random(uint256 max) public view returns (uint256) {
    return uint256(sha256(abi.encodePacked(blockhash(block.number)))) % max;
  }
}

contract Game {
  struct Player {
    uint256 level;
    uint256 hp;
    uint256 maxHp;
    uint256 mp;
    uint256 maxMp;
    uint256 exp;
    uint256 atk;
    uint256 def;
  }

  mapping(address => Player) public players;

  function init() external {
    players[msg.sender] = Player(1, 100, 100, 10, 10, 250, 5, 5);
  }

  function buyExp() external payable {
    players[msg.sender].exp = players[msg.sender].exp + msg.value / 0.01 ether;
  }

  function levelUp() external {
    require(players[msg.sender].exp >= 100);
    while (players[msg.sender].exp >= 100) {
      players[msg.sender].level += 1;
      players[msg.sender].exp -= 100;
      players[msg.sender].maxHp += Helper.random(5);
      players[msg.sender].maxMp += Helper.random(5);
      players[msg.sender].atk += Helper.random(5);
      players[msg.sender].def += Helper.random(5);
    }
  }
}
