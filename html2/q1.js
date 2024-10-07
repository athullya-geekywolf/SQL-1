const students=[
    
  {
    "FirstName": "John",
    "LastName": "Doe",
    "Age": 20,
    "Department": "Computer Science"
  },
  {
    "FirstName": "Jane",
    "LastName": "Smith",
    "Age": 22,
    "Department": "Physics"
  },
  {
    "FirstName": "Michael",
    "LastName": "Johnson",
    "Age": 21, 
    "Department": "Mathematics"
  },
  {
    "FirstName": "Sarah",
    "LastName": "Williams",
    "Age": 19,
    "Department": "Computer Science"
  },
  {
    "FirstName": "Robert",
    "LastName": "Brown",
    "Age": 23,
    "Department": "Mathematics"
  },
  {
    "FirstName": "Emily",
    "LastName": "Davis",
    "Age": 20,
    "Department": "Computer Science"
  }

];

//1. List the students whose department is computer science.
const y=students.filter(y =>y.Department=='Computer Science').map(x=>x.FirstName+' '+x.LastName);
console.log(y);

//2. List the first name of students whose age is greater than  21
const names=students.filter(y=>y.Age >21).map(x=>x.FirstName);
console.log(names);

//3. Check whether a student having a first name as Robert is present in the Computer Science Department. The result should be in boolean type
console.log(students.some(x=>x.FirstName=='Robert' && x.Department=='Computer Science'));

// 4. Check whether there is any student whose age is greater than 23 is studying in the Maths department.The result should be in boolean type
console.log(students.some(x=>x.Age>23 && x.Department=='Mathematics'));

// 5. Check whether all the students are above an age group of 18.The result should be in boolean type.
console.log(students.every(x=>x.Age>18));

//6. Assuming that there is only one student having a first name as John, Print his department name.
const Dept=(students.find(x=>x.FirstName=='John'));
console.log(Dept.Department);
//or
console.log(students.find(x=>x.FirstName=='John'));


