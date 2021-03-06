pragma solidity ^0.4.18;

contract Owned {
  address public owner = msg.sender;

  modifier onlyOwner {
    require (msg.sender == owner);
    _;
  }

  function setOwner(address owner_) 
    public
    onlyOwner 
  {
    require (owner_ != 0x0);
    
    owner = owner_;
  }

  function kill(address forward)
    public
    onlyOwner
  {
    selfdestruct(forward);
  }
}
