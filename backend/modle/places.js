const mongoose = require('mongoose');

const placeSchema = new mongoose.Schema({
  name: String,
  location: String,
  description: String,
  images: [String]
});

module.exports = mongoose.model('Place', placeSchema);
