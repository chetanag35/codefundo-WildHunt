pragma solidity ^0.4.25;
//import "https://github.com/pipermerriam/ethereum-datetime/blob/master/contracts/DateTime.sol";
contract EvoterCard {
    struct voterDetails{
        string name;
        int adhno;
        string father_name;
        string Address;
        bool isAlive;
        string gender;
        uint256 birth_year;   
        uint256 voterId;
        uint256 age;
    }
    enum StateType {Initiate,Generate, Addvoter, Updatevoterstatus}
    StateType public State;
    //address public Voter;
    string public Name;
    int public aadharNo;
    string public FatherName;
    string public CurrentAddress;
    string public VoterGender;
    uint256 public BirthYear;
    uint256 public Age;
    voterDetails[] public voters;
    uint256 public no_of_voters;
    uint256 public voterId;
    uint256 public const=1000*60*60*24*365;
    string public str;
    uint256 public i;
    address public ElectionCommission;
    address public Voter;
    constructor() public{
        no_of_voters=0;
        voterId=0;
        State=StateType.Initiate;
    }
    function generate (int voterid) public{
        for(i=0;i<no_of_voters;i++){
            if(voters[i].adhno==voterid){
            if(voters[i].isAlive&&voters[i].age>=18)
            {
                str="valid voter";
                Name = voters[i].name;
                aadharNo = voters[i].adhno;
                FatherName= voters[i].father_name;
                CurrentAddress = voters[i].Address;
                VoterGender = voters[i].gender;
                BirthYear=voters[i].birth_year;
                Age = voters[i].age;  
            }
            else if(voters[i].isAlive&&voters[i].age<18)
            {
                str="Underage Voter";
            }
            else if(!voters[i].isAlive){
                str="Expired Voter";
            }
            }
        }
        State=StateType.Generate;
    }
    function addVoter (string memory name, int adhno, string memory father_name, string memory Address, string memory Gender, uint256 birth_year) public {
        no_of_voters++;
        voterId++;
        voterDetails memory newVoter;
        newVoter.name=name;
        
        newVoter.adhno=adhno;
        
        newVoter.father_name=father_name;
        
        newVoter.Address=Address;
        newVoter.isAlive=true;
        newVoter.gender=Gender;
        
        newVoter.birth_year=birth_year;
        
        newVoter.voterId=voterId;
        newVoter.age= 2019-birth_year;                             //code for age calculation
        voters.push(newVoter);
        State=StateType.Addvoter;
    }
    function remVoter (int voterid) public{
        for(i=0;i<no_of_voters;i++){
            if(voters[i].adhno==voterid){
                voters[i].isAlive=false;
                str="Expired Voter";
                Name = "";
                aadharNo = 0;
                FatherName= "";
                CurrentAddress = "";
                VoterGender = "";
                BirthYear=0;
                Age = 0;  
                break;
            }
        }
        State=StateType.Updatevoterstatus;
    }
}