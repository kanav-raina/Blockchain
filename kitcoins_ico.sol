//Kitcoins ICO
//Version of Compiler

pragma solidity ^0.4.11;
contract_kitcoin_ico{
    //Introducing the maximum number of kitcoins
    uint public max_kitcoins=1000000;
    
    //Introducing USD to kitcoins
    uint public usd_to_kitcoin=1000;
    
    //Introducing the total number of Kitcoins bought by investor
    uint public total_kitcoin_bought=0;
    
    //Mapping from investor address to its equity in Kitcoin and USD
    mapping(address=>uint)equity_kitcoins;
    mapping(address=>uint)equity_usd;
    
    }
    
//Checking if an investor can buy kitcoins
modifier can_buy_kitcoins(uint usd_invested){
 require(usd_invested*usd_to_kitcoins+total_kitcoins_bought<=max_kitcoins);
 _;
 
}
