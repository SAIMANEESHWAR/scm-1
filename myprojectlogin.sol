// SPDX-License-Identifier: MIT
// Version of Solidity compiler this program was written for
pragma solidity ^0.8.0;
 contract data{
/*manifacturer*/
string[] mani;
uint[] manidiv;
uint[] maniunit;
uint[] maniord;
/**/
     


    /*ASC*/
    
    uint[] whichdiv;
    uint[] whichunit;
    uint[] whichord;/**/

    uint[] ascaccepted;
    /**/
    uint[] ascforwarddiv;
    uint[] ascforwardunit;
    uint[] ascforwardord;
    uint[] ascalreadyforw;
    string[] anodivtounitconfirm;
    uint[] anodivtounitconfirmid;
    uint[] anodivtounitconfirmuintid;
    /**/
    /**/
    struct Range{
        uint rangebar;
    }

     struct venders{
         string[][] pname;
        uint[][] quantity;
        string[] ldate;
        mapping(uint=> Range) range;
        uint orderno;
        /**/
        string[] status;
        uint[] statusacceptedby;
        uint [] statusno;
        /**/
        uint[] accid;
        uint[] accord;
    }

    struct div{
        string[][] pnamed;
        uint[][] quantityd;
        string[] ldated;
        
        uint[] ven;
        uint[] ordernod;
        uint[] conformacc;
        /**/
        uint[] divaccid;
        uint[] divaccord;
        /**/
        uint[] anodiv;
        uint[] anoven;
        uint[] anoord;
        uint[] ifsenttoasc;
        uint[] anodivtounitsacc;
        

        mapping(uint=> venders) allvenders;

    }
    mapping(uint=>div) mydiv;



    // struct manifacturer{
    //     string[] maniproducts;
    //     uint[]   maniquantity;
    // }

    
  /*1*/
    function unit(uint  _id,uint _venid,string[] memory _p,uint[] memory _q,string memory _l) public {
        mydiv[_id].allvenders[_venid].pname.push(_p);
        mydiv[_id].allvenders[_venid].quantity.push(_q);
        mydiv[_id].allvenders[_venid].ldate.push(_l);
        mydiv[_id].allvenders[_venid].range[mydiv[_id].allvenders[_venid].orderno].rangebar=1;
        mydiv[_id].allvenders[_venid].orderno++;
        

    }
    /*giving uints products*/  /*2*/
    function showproducts(uint  _id,uint _venid) public view returns(string[][] memory,uint[][] memory,string[] memory) {
        return (
        mydiv[_id].allvenders[_venid].pname,
        mydiv[_id].allvenders[_venid].quantity,
        mydiv[_id].allvenders[_venid].ldate
        );
    }

     /*publishing*/  /*3 by division*/
    function publish(uint  _id,uint _venid,uint _ordno,string[] memory _p,uint[] memory _q,string memory _l) public{
        mydiv[_id].pnamed.push(_p);
        mydiv[_id].quantityd.push(_q);
        mydiv[_id].ldated.push(_l);
        mydiv[_id].ven.push(_venid);
        mydiv[_id].ordernod.push(_ordno);
        mydiv[_id].allvenders[_venid].range[_ordno].rangebar++;

    }
    
    /*conforming for units*/  /*5*/
    function conforming(uint _id,uint _myvenid,string memory _status,uint _venid,uint _ord,uint _i) public{
        mydiv[_id].allvenders[_venid].status.push(_status);
        mydiv[_id].allvenders[_venid].statusno.push(_ord);
        mydiv[_id].allvenders[_venid].statusacceptedby.push(_myvenid);
        mydiv[_id].conformacc.push(_i);
        /**/
        mydiv[_id].allvenders[_myvenid].accid.push(_venid);
        mydiv[_id].allvenders[_myvenid].accord.push(_ord);
        
    }


    /*return to units published*/   /*4*/
    function published(uint  _id,uint _venid) public view returns(uint[] memory,uint[] memory,uint){
       return ( mydiv[_id].ven,mydiv[_id].ordernod,_venid);

    }
    /*4*/
    function returnpql(uint  _id  /*,uint _venid*/  ) public view returns(string[][] memory,uint[][] memory,string[] memory){
       return ( mydiv[_id].pnamed,
        mydiv[_id].quantityd,
        mydiv[_id].ldated);

    }
    
    /**/ /*6*/
    function published2(uint  _id,uint _venid)public view returns(string[] memory,uint[] memory,uint[] memory,uint[] memory){
       return (
                    mydiv[_id].allvenders[_venid].status,
                    mydiv[_id].allvenders[_venid].statusno,
                    mydiv[_id].allvenders[_venid].statusacceptedby,
                    mydiv[_id].conformacc
              ); 
    }
    /*4->next to asc*/
    function asc(uint _id,uint _venid,uint _ord,uint _i) public{
        whichdiv.push(_id);
        whichunit.push(_venid);
        whichord.push(_ord);
        mydiv[_id].ifsenttoasc.push(_i);
         mydiv[_id].allvenders[_venid].range[_ord].rangebar++;

    }
    function returnasc() public view returns(uint[] memory ,uint[] memory,uint[] memory){
        return(whichdiv,whichunit,whichord);
    }
    /*if div sennt to asc*/
    function ifdivsenttoasc(uint _id) public view returns(uint[] memory){
        return mydiv[_id].ifsenttoasc;
    }
    function ascstatus(uint _id,uint myasc,uint _venid,string memory _status,uint _ord,uint _i) public{
        mydiv[_id].allvenders[_venid].status.push(_status);
        mydiv[_id].allvenders[_venid].statusno.push(_ord);
        mydiv[_id].allvenders[_venid].statusacceptedby.push(myasc);
        ascaccepted.push(_i);

        

    }
    /*another div to unit status*/
   function anodivtounitconfirmfunction(uint _id,uint _myvenid,uint _myid,uint _venid,string memory _status,uint _ord,string memory inunitidordno)public {
       mydiv[_id].allvenders[_venid].status.push(_status);
        mydiv[_id].allvenders[_venid].statusno.push(_ord);
        mydiv[_id].allvenders[_venid].statusacceptedby.push(_myvenid);


        anodivtounitconfirm.push(inunitidordno);
        anodivtounitconfirmid.push(_myid);
        anodivtounitconfirmuintid.push(_myvenid);


        
       

         mydiv[_myid].allvenders[_myvenid].accid.push(_venid);
        mydiv[_myid].allvenders[_myvenid].accord.push(_ord);
        
   }
   function anodivtounitconfirmreturn() public view returns(string[] memory,uint[] memory,uint[] memory){
       return(anodivtounitconfirm,
                anodivtounitconfirmid,
                anodivtounitconfirmuintid);
   }


    /*asc forward*/
    function ascforward(uint _id,uint _venid,uint _ord,uint _i) public{
        ascforwarddiv.push(_id);
        ascforwardunit.push(_venid);
        ascforwardord.push(_ord);
        ascalreadyforw.push(_i);
         mydiv[_id].allvenders[_venid].range[_ord].rangebar++;
    }
    /*asc to all div*/
    function ascforwardreturn() public view returns(uint[] memory,uint[] memory,uint[] memory){
     return(ascforwarddiv,
        ascforwardunit,
        ascforwardord);   
    }
    function ascalreadyforwreturn() public view returns(uint[] memory){
        return(ascalreadyforw);
    }
    /*another div to there units*/
    function anodivtounits(uint _id,uint _myid,uint _venid,uint _ord,uint _i) public {
        mydiv[_myid].anodiv.push(_id);
        mydiv[_myid].anoven.push(_venid);
        mydiv[_myid].anoord.push(_ord);
        mydiv[_myid].anodivtounitsacc.push(_i);
         mydiv[_id].allvenders[_venid].range[_ord].rangebar++;
    }
    function returnanodivtounits(uint _id) public view returns(uint[] memory,uint[] memory,uint[] memory){
        return(mydiv[_id].anodiv,mydiv[_id].anoven,mydiv[_id].anoord);
    } 
    function anodivtounitsreturn(uint _id)public view returns(uint[] memory){
        return (mydiv[_id].anodivtounitsacc);
    }



/*units accepted orders*/
   function myaccepted(uint  _id,uint _venid)public view returns(uint[] memory,uint[] memory){
       return (mydiv[_id].allvenders[_venid].accid,mydiv[_id].allvenders[_venid].accord);
   }
 
    /*giving unit orderno*/
    function unitorderno(uint _id,uint _venid) public view returns(uint){
        return mydiv[_id].allvenders[_venid].orderno;
    }

    /*only asc accepted*/
    function ascaccreturn()public view returns(uint[] memory){
        return ascaccepted;
    } 

    /*return range bar*/
    function returnrangebar(uint _id,uint _venid,uint _ordno)public view returns(uint){
        return  mydiv[_id].allvenders[_venid].range[_ordno].rangebar;
    }

    /*for manifacturer*/
    function manifacturer(string memory _maniiddivord,uint _id,uint _venid,uint _ordno) public {
        mani.push(_maniiddivord);
        manidiv.push(_id);
        maniunit.push(_venid);
        maniord.push(_ordno);
        mydiv[_id].allvenders[_venid].range[_ordno].rangebar++;
    }
    function returnmanifacturer()public view returns(string[] memory ,uint[] memory ,uint[] memory ,uint[] memory ){
        return(mani,manidiv,
            maniunit,
            maniord);
    }




}