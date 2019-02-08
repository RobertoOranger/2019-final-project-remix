pragma solidity ^0.5.0;

//@dev CertificateFactory can create new contract Certificates using Certificate.sol, 
//where there are the state variable definition of Certificate: name, date of Birth,
// type of degree and date of degree. Insert date in this format ddmmyyyy, only numbers.

//@ contract child
contract Certificate {
   //uint32 because it is adequate  to store dateBirth and dateCert (storing is expensive!)    
    
    string name;
    uint32 dateBirth;
    string degree;
    uint32 dateCert; 
    
    
    constructor (string memory name_,  uint32 dateBirth_, string memory degree_, uint32 dateCert_) public {
        name = name_;
        dateBirth = dateBirth_;
        degree = degree_;                                   
        dateCert = dateCert_;                            
                                       
    }
}

contract CertificateFactory {
    
    //@dev  owner of CertificateFactory 
    address public owner = msg.sender;
    

    //@dev we store addresses of new contract children ( Certificate.sol) that CertificateFactory create

    address[] public registeredCert;


    //@dev Only owner can register new contract
    modifier onlyOwner() {
    require(msg.sender == owner,"You do not have permission");
    _;

    }

     //Event of address of new Certificate created
    event LogCertificateCreated (address newCertificate);
    
    function createCert( string memory name, uint32 dateBirth, string memory degree, uint32 dateCert) 

        
         public onlyOwner
         returns(address)   {
         
         
        
        //@dev only owner of FactoryContract can register new "Certificate" contract.
        // We can use modifier or require. Modifier operates after the function.
        //It depends of gas consumtion. in general it's the same.
        //require(msg.sender == owner);
         
        
        // @dev Creation of  new Certificate using Certificate.sol and variable :
        // name, dateBirth, degree, dateCert
        Certificate newCertificate = new Certificate (name, dateBirth, degree, dateCert );
        emit LogCertificateCreated(address (newCertificate));
        registeredCert.push(address(newCertificate));
        return address(newCertificate);


      
    }    
     //@ dev Pay attention of if function return ash of transaction 
     //or the address of new Certificate. But with web3 whe can use ash of transaction
     //to  obtain this information

    //address of  new contract 
    function getDeployedCertificate() public view returns (address[] memory) {
        return registeredCert;

    }
    
  
        
    
}


