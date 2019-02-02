Security Tools / Common Attacks


No external contract call is performed other than the owner of CertificateFactory.  the contract thus there is no Reentrancy    vulnerability.

There is no timestamp dependency in the contract. 

There is no handling of Ether thus Force Sending Ether does not cause any problem.

The Factory contract uses Pausable contract of OpenZeppelin, so the owner of contract can stop the esecution if there is any emergency.
