function madLib(verb, adj, noun) {
  console.log(`We shall ${verb.toUpperCase()} the ${adj.toUpperCase()} ${noun.toUpperCase()}`);
}

function isSubstring(searchString, subString) {
  if (searchString.includes(subString)) {
    return true
  } else {
    return false
  }
}

function fizzBuzz(arr) {
  let newarr = []

  arr.forEach(ele => {
    if (ele % 3 == 0 || ele % 5 == 0) {
      newarr.push(ele)
    }
  });

  return newarr
}


function isPrime(num) {
  for (let i = 2; i < num; i++) {
    if (num % i == 0) {
      return false
      break
    }
  }
  return true
}


// function sumOfNPrimes(n) {
//   let sum = 0
//   let add_count = 0
//   while (add_count < n) {
//     var prime = 2
//     if (isPrime(prime)) {
//       sum += prime
//       add_count++
//     }
//     prime++
//   }

//   return sum
// }

function sumOfNPrimes(n) {
  let sum = 0;
  let count = 0;
  for (let i = 2; count < n; i++) {
    if (isPrime(i)) {
      sum += i;
      count++;
    }
  }
}

// function sumOfNPrimes(n) {

// }


// madLib('make', 'best', 'guac');
// isSubstring("time to program", "time");
// isSubstring("Jump for joy", "joys");
