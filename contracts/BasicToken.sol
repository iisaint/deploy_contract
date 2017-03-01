pragma solidity ^0.4.8;

/*
 * Basic token
 * Basic version of StandardToken, with no allowances
 */
contract BasicToken {
  address public owner;
  uint public totalSupply;
  mapping(address => uint) balances;

  event Transfer(address indexed from, address indexed to, uint value);

  function BasicToken() {
    owner = msg.sender;
    balances[owner] = 10000;
  }

  function transfer(address _to, uint _value) {
    balances[msg.sender] = safeSub(balances[msg.sender], _value);
    balances[_to] = safeAdd(balances[_to], _value);
    Transfer(msg.sender, _to, _value);
  }

  function balanceOf(address _owner) constant returns (uint balance) {
    return balances[_owner];
  }
  
  function safeSub(uint a, uint b) internal returns (uint) {
    assert(b <= a);
    return a - b;
  }

  function safeAdd(uint a, uint b) internal returns (uint) {
    uint c = a + b;
    assert(c>=a && c>=b);
    return c;
  }

  function assert(bool assertion) internal {
    if (!assertion) {
      throw;
    }
  }

}
