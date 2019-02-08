Design Pattern Decisions

There are various ways to notarize documents such as degree, certificates of ownership etc. 
I want to experiment and study the factory contracts and applicability by this final project. 
The Factory contract ( CertificateFactory in this project) can create other certificate-contracts with the data of degrees of students : Name, date of birth, type degree and date of degree.  Only the owner of CertificateFactory can create other documents, so certificates of degree are true. In this case only the University or Istitute can create certificates. It's important to use a blockchain in real life.
Nobody can modify or destroy the document of degree. So nobody can modify or destroy the Certificate into the blockchain.

Pay attention: it'is important to receive and storage the correct data  when we create a new Certificate contract: Not the ash of transaction, but the address of contract.
Gas limit block can revert the transaction to create a certificate contract. 

The addresses of Certificate contracts ( "contract child") are stored in an array. But it is expensive. When the number of certificates increases, the better solution is a mapping.

Is it possible to reduce storage (it is expensive!) to reduce uint about date using uint32, not uint (it is 256 bits).


