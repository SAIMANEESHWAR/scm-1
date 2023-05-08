 // SPDX-License-Identifier: MIT
// Version of Solidity compiler this program was written for
pragma solidity ^0.8.0;
 contract data{
 
 struct alldiv{
        uint[] units;
        string[] pass;
        string  conform;
    }

    mapping(uint=>alldiv) ulist; 
    

    uint[] alldivisionsid;
    string[] alldivisionspass;
    function adddiv(uint _divid,string memory _divpass) public{
        alldivisionsid.push(_divid);
        alldivisionspass.push(_divpass);
    }
    function adddivreturns() public view returns(uint[] memory,string[] memory){
        return(alldivisionsid,alldivisionspass);
    }
  

 
    function addunits(uint _divid,uint _ids,string memory _pass) public{
        ulist[_divid].units.push(_ids);
        ulist[_divid].pass.push(_pass);
    }
    function giveunits(uint _divid)public view returns(uint[] memory,string[] memory){
        return (ulist[_divid].units,ulist[_divid].pass);
    }

    


 }