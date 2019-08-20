pragma solidity ^0.4.24;
//import "https://github.com/pipermerriam/ethereum-datetime/blob/master/contracts/DateTime.sol";
contract voter {
    struct voterDetails{
        string name;
        uint64 adhno;
        string father_name;
        string Address;
        bool isAlive;
        string gender;
        string DoB;
        int voterId;
        int age;
    }
    enum currentState {Initiate, Generate, Display, Addvoter, Updatevoterstatus}
    address public Voter;
    voterDetails[] public voters;
    uint256 no_of_voters;
    uint256 voterId;
    string str;
    constructor() public{
        no_of_voters=0;
        voterId=0;
    }
    function generate (int voterId) public{
        for(int i=0;i<no_of_voters;i++){
            if(voters[i].voterId==voterId){
            if(voters[i].isAlive&&voters[i].age>=18)
            {
                //display voter card details
            }
            else if(voters[i].isAlive&&voters[i].age<18)
            {
                str="Underage Voter";
            }
            else if(!voter[i].isAlive){
                str="Expired Voter";
            }
            }
        }
    }
    function addVoter (string name, uint64 adhno, string father_name, string Address, bool isAlive, string Gender, string DoB){
        no_of_voters++;
        voterId++;
        voterDetails memory newVoter;
        newVoter.name=name;
        newVoter.adhno=adhno;
        newVoter.father_name=father_name;
        newVoter.Address=Address;
        newVoter.isAlive=true;
        newVoter.Gender=Gender;
        newVoter.DoB=DoB;
        newVoter.voterId=voterId;
        //newVoter.age=//code for age calculation
        voters.push(newVoter);

    }
    function remVoter (uint256 voterId) public{
        for(int i=0;i<no_of_voters;i++){
            if(voters[i].voterId==voterId){
                voters[i].isAlive=false;
                break;
            }
        }
    }
}