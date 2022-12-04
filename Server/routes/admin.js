const express = require("express");
const adminRoute = express.Router();
const admin = require("../middlewares/admin");
const Product = require("../models/product");

adminRoute.post("/admin/add-product", admin, async (req, res) => {
  try {
    const { name, description, price, quantity, category, images } = req.body;
    console.log('1st',req.body);
    let product = new Product({
      name,
      description,
      price,
      quantity,
      category,
      images,
    });
    console.log("2nd",product);
    product = await product.save();
    console.log("3rd");
    res.json(product);
    console.log("4th");
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = adminRoute;
