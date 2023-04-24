const fs = require("fs");
const path = require("path");

const FilePath = path.join(__dirname, "..", "data", "restaurants.json");

function getStoredRestaurants() {
  const fileData = fs.readFileSync(FilePath);
  const storedRestaurants = JSON.parse(fileData);

  return storedRestaurants;
}

function storeRestaurants(storableRestaurants) {
  fs.writeFileSync(FilePath, JSON.stringify(storableRestaurants));
}

module.exports = {
  getStoredRestaurants: getStoredRestaurants,
  storeRestaurants: storeRestaurants,
};
