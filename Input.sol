pragma solidity ^0.5.11;

contract Input {
  event Test(address buyer, address seller, address tokenBuy, address tokenSell);

  // "0xB76E5D58A38D8F09B13c4325F6E6048CbA3e636C","0x47E99882e38616255D69B2fE7a6b7F5E30B73527","0xa3e874350a5A0fEC6B25ae2b13049F84905aAe73","0x5861b8446A2F6e19a067874c133f04c578928727"
  function test(address buyer, address seller, address tokenBuy, address tokenSell) external {
    emit Test(buyer, seller, tokenBuy, tokenSell);
  }
}

