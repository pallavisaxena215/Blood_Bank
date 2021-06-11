pragma solidity ^0.5.0;
contract Blood_Bank {
     address public owner;
     mapping(address => bool) available; // given donor is available to donate
    mapping (string => available ) blood_doner; // bloog group => list of persons available
     uint public fees= 1000; // fixed fees 
       uint public count=0;
     
     constructor() public {
         owner = msg.sender;
     }
    function Need(string _bloodgroup) public payable returns (uint){

     require(balanceof[msg.sender]> fees);
       require(blood_doner[_bloodgroup].size>0);
       // there should be atleast one doner
          uint i=0;// list of persons currently available
          //need a random algorith to pick
        return blood_doner[_bloodgroup][0];
       
    }

  // This function will add doner
    function AddDoner(string _bloodgroup) AdminOnly return (bool){
      
       available[msg.sender]=true;
       blood_doner[_bloodgroup]=available[msg.sender];
       count = count + 1;
       //increment the total number of donors available 

    }


    //we want that donner can only happen 
    modifier AdminOnly(){
        require(msg.sender==owner);
        _;
    }
      
}