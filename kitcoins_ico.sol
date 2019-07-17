//Kitcoins ICO
//Version of Compiler

pragma solidity ^0.4.11;
contract_kitcoin_ico{
    //Introducing the maximum number of kitcoins
    uint public max_kitcoins=1000000;
    
    //Introducing USD to kitcoins
    uint public usd_to_kitcoins=1000;
    
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

//Getting the equity in kitcoins of an investor
function equity_in_kitcoins(address investor) external constant returns(uint){
    return equity_kitcoins(investor);
}


//Getting the equity in USD of  an investor
function equity in usd(address investor) external constant returns(uint){
    return equity_usd(investor);
}

//Buying kitcoins
function buy_kitcoins(address investor,uint usd_invested) external
can_buy_kitcoins(usd_invested)
{
    uint kitcoins_bought=usd_invested*usd_to_kitcoins;
    equity_kitcoins[investor]+=kitcoins_bought;
    equity_usd[investor]=equity_kitcoins[investor]/1000;
    total_kitcoins_bought+=kitcoins_bought;
    
}

//Selling kitcoins_bought
function sell_kitcoins(address investor,uint kitcoins_sold) external {
    equity_kitcoins[investor]-=kitcoins_sold
    equity_usd[investor]=equity_kitcoins[investor]/1000;
    total_kitcoins_bought+=kitcoins_sold;
    
}
