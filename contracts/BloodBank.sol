pragma solidity ^0.5.0;
contract Blood_Bank {
     address public owner; // owner of the 
     
    mapping (string => address[]) blood_donors ; // bloog group => list of persons available for donating
    mapping (string => uint) count;
     uint public fees= 1000; // fixed fees for getting blood doner
       uint total;
       
       
     // the owner will be the person who initiates the contract
     constructor() public {
         owner = msg.sender;
         total=0;
     }
     
     
    function Need(string memory _bloodgroup) public payable returns (address){

   //the requester must pay the fees
       require(msg.sender.balance>fees);
       require(count[_bloodgroup] > 0); // donors must be available
       
       uint i=0; //Define a 
        return blood_donors[_bloodgroup][i];
       
    }

   // registering for blood bank
  function RegisterforDonation(string memory _bloodgroup,address add_donor) public view returns (bool){
      require(msg.sender==add_donor); // a person cannot register someone else
      
  }
  
  
  // This function will add doner
    function AddDoner(string memory _bloodgroup,address add_donor) private AdminOnly returns (bool){
      
       count[_bloodgroup]+=1;
       blood_donors[_bloodgroup].push(add_donor);

    }


    //we want that donner can only happen 
    modifier AdminOnly(){
        require(msg.sender==owner);
        _;
    }
      
}
