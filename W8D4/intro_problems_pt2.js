function titleize(names, cb) {
  titles = names.map((ele) => {
    return `Mx. ${ele} Jingleheimer Schmidt`;
  })

  return titles.forEach(function(ele) {
    cb(ele);
  })
}

function printCallback(ele) {
  console.log(ele)
}

// const names = ["Mary", "Brian", "Leo"]
// titleize(names, printCallback)

function Elephant(name, height, tricks) {
  this.name = name;
  this.height = height;
  this.tricks = tricks;
}

Elephant.prototype.trumpet = function() {
  console.log(`${this.name} the elephant goes 'phrRRRRRRR!!!'`);
}

Elephant.prototype.grow = function(growth = 12) {
  this.height += growth;
}

Elephant.prototype.addTrick = function(trick) {
  this.tricks.push(trick);
}

Elephant.prototype.play = function() {
  const randomTrick = this.tricks[Math.floor(Math.random() * this.tricks.length)];
  console.log(`${this.name} is ${randomTrick}`);
}

// const ele = new Elephant("Ellie", 20, ["playing", "roaring", "sleeping"]);
// ele.trumpet();
// ele.grow();
// ele.addTrick("crying");
// ele.play();
// console.log(ele.height);

// let ellie = new Elephant("Ellie", 185, ["giving human friends a ride", "playing hide and seek"]);
// let charlie = new Elephant("Charlie", 200, ["painting pictures", "spraying water for a slip and slide"]);
// let kate = new Elephant("Kate", 234, ["writing letters", "stealing peanuts"]);
// let micah = new Elephant("Micah", 143, ["trotting", "playing tic tac toe", "doing elephant ballet"]);

// let herd = [ellie, charlie, kate, micah];