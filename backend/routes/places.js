const express = require('express');
const router = express.Router();
const Place = require('../models/place');

// GET all places
router.get('/', async (req, res) => {
    const places = await Place.find();
    res.json(places);
});

// POST new place
router.post('/', async (req, res) => {
    const newPlace = new Place(req.body);
    await newPlace.save();
    res.json(newPlace);
});

module.exports = router;
