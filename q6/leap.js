const prompt=require("prompt-sync")();
function leapyear(year)
{
    if((year%4==0 && year%100!=0) || (year%400==0))
    {
        return `${year} is leap year`;
    }
    else
    {
        return `${year} is not a leap year`;
    }
}

const year=prompt("enter year: ")
console.log(leapyear(year));