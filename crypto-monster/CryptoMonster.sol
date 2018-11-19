pragma solidity ^0.4.24;

import 'openzeppelin-solidity/contracts/token/ERC721/ERC721Full.sol';

contract CryptoMonster is ERC721Full {
  struct Monster {
  	string name;
  	uint level;
  	uint attackPower;
  	uint defensePower;
  }

  Monster[] public monsters;
  address public owner;

  constructor() public {
  	owner = msg.sender;
  }

  function createMonster(string _name, address _to) public {
  	require(owner == msg.sender);
  	uint id = monster.length;
  	monsters.push(Monster(_name, 1, 100, 100));
  	// Forjar un nuevo token
  	_mint(_to, id)
  }

  // Esta función solo la puede ejecutar el dueño del token
  function battle(uint _monsterId, uint _targetId) {
  	Monster storage monster1 = monsters[_monsterId];
  	Monster storage monster2 = monsters[_targetId];

  	// Pelea! pelea! pelea!
  	if (monster1.attackPower >= monster2.defensePower) {
  		monster1.level += 1;
  		monster1.attackPower += 10;
  	} else {
  		monster2.level += 1;
  		monster2.attackPower += 10;
  	}
  }
}