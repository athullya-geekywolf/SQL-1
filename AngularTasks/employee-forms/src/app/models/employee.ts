export interface Employee{
    firstname:string|null;
    lastname?:string|null;
    email:string|null;
    pNumber:string |null;
    address:{
        address1?:string|null,
        address2?:string|null,
        city?:string|null
    };

}