import 'package:flutter/material.dart';

import 'package:userinput/models/category.dart';

const categories = {
  Categories.vegetables: Category('Vegetables', Color.fromARGB(217, 111, 239, 175),),
  Categories.fruit: Category('Fruit', Color.fromARGB(255, 193, 236, 138)),
  Categories.meat: Category('Meat', Color.fromARGB(255, 230, 170, 130)),
  Categories.dairy: Category('Dairy', Color.fromARGB(255, 114, 212, 234)),
  Categories.carbs: Category('Carbs', Color.fromARGB(255, 133, 157, 237)),
  Categories.sweets: Category('Sweets', Color.fromARGB(255, 225, 181, 119)),
  Categories.spices: Category('Spices', Color.fromARGB(255, 211, 187, 121)),
  Categories.convenience: Category('Convenience', Color.fromARGB(255, 205, 128, 231),),
  Categories.hygiene: Category('Hygiene', Color.fromARGB(255, 171, 116, 210)),
  Categories.other: Category('Other', Color.fromARGB(255, 0, 225, 255)),
};
