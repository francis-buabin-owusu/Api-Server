const express = require("express");
const app = express();

const port = process.env.PORT || 3000;
app.get("/", (req, res) => {
  // res.json({ message: "API is Online!" });
  res.send("API is Online!");
});

countries = [
  {
    id: 1,
    name: "Ghana",
  },
  {
    id: 2,
    name: "France",
  },
  {
    id: 3,
    name: "Scotland",
  },
];

names = [
  {
    name: "Harry Potter",
    city: "London",
  },
  {
    name: "Don Quixote",
    city: "Madrid",
  },
  {
    name: "Joan of Arc",
    city: "Paris",
  },
  {
    name: "Rosa Park",
    city: "Alabama",
  },
];

todos = [
  {
    title: "Clean the kitchen",
    description:
      "Mop the floor, wipe the countertop and don't forget to take out the trash!",
  },
  {
    title: "Call Mom",
    description: "It's her birthday!",
  },
  {
    title: "Water flowers",
    description: "They need water, or they will die.",
  },
];

app.get("/countries", (req, res) => {
  res.json({ data: countries });
});

app.get("/names", (req, res) => {
  res.json({ data: names });
});

app.get("/todos", (req, res) => {
  res.json({ data: todos });
});


app.get;
app.listen(port);
console.log("Listening on port " + port);
module.exports = app;
