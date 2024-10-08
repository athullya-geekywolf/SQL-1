const movies=[
    
  {
    "MovieName": "The Great Adventure",
    "ActorName": "John Smith",
    "ReleaseDate": "2023-01-15"
  },
  {
    "MovieName": "Mystery in the Woods",
    "ActorName": "Emily Johnson",
    "ReleaseDate": "2022-09-28"
  },
  {
    "MovieName": "Love and Destiny",
    "ActorName": "Michael Brown",
    "ReleaseDate": "2023-05-02"
  },
  {
    "MovieName": "City of Shadows",
    "ActorName": "Sophia Williams",
    "ReleaseDate": "2023-03-12"
  },
  {
    "MovieName": "The Last Stand",
    "ActorName": "William Davis",
    "ReleaseDate": "2022-11-07"
  },
  {
    "MovieName": "Echoes of Time",
    "ActorName": "Olivia Wilson",
    "ReleaseDate": "2022-12-19"
  }

];

//1. List the movie name along with the actor name of those movies released in the year 2022
console.log(movies
    .filter(x=> new Date(x.ReleaseDate).getFullYear() === 2022)
    .map(x=>`Movie : ${x.MovieName} , Actor : ${x.ActorName}`));    // return as string

console.log(movies
    .filter(x=> new Date(x.ReleaseDate).getFullYear() === 2022)
    .map(x=>({MovieName:x.MovieName ,ActorName:x.ActorName})));       //return as object


//2. List the movie names released in the year 2023 where the actor is William Davis.
console.log(movies
    .filter(x=> x.ActorName=='William Davis' && new Date(x.ReleaseDate).getFullYear() === 2023)
    .map(x=>`Movie : ${x.MovieName} , Actor : ${x.ActorName}`));

//3. Retrieve the Actor name and release date of the movie “The Last Stand”
console.log(movies
    .filter(x=>x.MovieName== 'The Last Stand')
    .map(x=>`Actor : ${x.ActorName} , Release : ${x.ReleaseDate}`));

//4. Check whether there is any movie in the list with actor name “John Doe”
console.log(movies
    .some(x=>x.ActorName=='John Doe'));

//5. Display the count of movies where the actor name is "Sophia Williams"
console.log(movies
    .filter(x=>x.ActorName=='Sophia Williams').length);

// 6. Insert an element
// {
//     "MovieName": "The Final Stage",
//     "ActorName": "John Doe",
//     "ReleaseDate": "2022-08-11"
// }
// as last element

const entry={

    "MovieName": "The Final Stage",
    "ActorName": "John Doe",
    "ReleaseDate": "2022-08-11"
}

movies.push(entry);
movies.forEach(x => {
    console.log(x)
});

//7. Check whether there exists any duplicate movie names present in the array
const titles=movies.filter(x=>x.MovieName)
const dup=new Set(titles);
console.log(dup.size)
console.log(movies.length)
console.log(dup.size<movies.length?'Has duplicates':"no duplicates")

//8. Create a new array starting from the movie "City of Shadows"

//by keeping all elements same
const rem=movies.filter(x=>x.MovieName != "City of Shadows" );
const citymovie=movies.filter(x=>x.MovieName == "City of Shadows" );
const newarray=[citymovie,...rem]
console.log(newarray);

//by slicing and starting from the given movie
const startIndex = movies.findIndex(movie => movie.MovieName === "City of Shadows");
const newMoviesArray = startIndex != -1 ? movies.slice(startIndex) : [];
console.log(newMoviesArray);

//9. List the distinct actor names in array
console.log(movies.length)
const actorlist=movies.map(x=>x.ActorName);
const distinctactorlist=new Set(actorlist);
distinctactorlist.forEach(x=>console.log(x));

/*
10. Insert an element
		{
   			 "MovieName": "Rich & Poor",
    			"ActorName": "Johnie Walker",
   	 		"ReleaseDate": "2023-08-11"
 		 }
	as next element to movie “Love and Destiny”
*/

const newmovie=		
{
    "MovieName": "Rich & Poor",
    "ActorName": "Johnie Walker",
    "ReleaseDate": "2023-08-11"
};
movies.splice(movies.findIndex(x=>x.MovieName=='Love and Destiny')+1,0,newmovie);
console.log(movies);

//11. Display the count of distinct actor names in array
const actorslist=movies.map(x=>x.ActorName);
const distinctactorslist=new Set(actorslist);
distinctactorlist.forEach(x=>console.log(x));
console.log(distinctactorslist.size);

//12. Remove the movie named  "The Last Stand"
movies.splice(movies.findIndex(x=>x.MovieName=='The Last Stand'),1);
console.log(movies);

//13. Check whether all the movies are released after 2021 Dec 31
console.log(movies.every(x=>x.ReleaseDate > '2021-12-31'));

//14. Update movie named  "City of Shadows" ‘s release date as  "2023-03-13"
for (let i = 0; i < movies.length; i++) {
    if (movies[i].MovieName === "City of Shadows") {
      movies[i].ReleaseDate = "2023-03-13";
      break;
    }
  }
  
  console.log(movies);
  
//15. Create a new array of movie names whose movie name length is greater than 10.
const nmovie=[];
console.log(movies.length)
for (let i = 0; i < movies.length; i++) {
    if (movies[i].MovieName.length >10) {
        nmovie.push(movies[i].MovieName)
    }
  }

console.log(nmovie);
