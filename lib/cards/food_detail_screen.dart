import 'package:flutter/material.dart';


class FoodData {
  final String foodName;
  final String imagePath;
  final String description;

  FoodData({
    required this.foodName,
    required this.imagePath,
    required this.description,
  });
}


class FoodDetailScreen extends StatelessWidget {
  final String foodName;
  final String imagePath;
  final String description;
  

  const FoodDetailScreen({
    Key? key,
    required this.foodName,
    required this.imagePath,
    required this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodName),
         // Use the selected food name as the title
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Display food image here
            Image.asset(imagePath,
                height: 300, width: double.infinity, fit: BoxFit.contain),

            // Display food description here
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 18),
              ),
            ),

            // Add more details or content as needed
          ],
        ),
      ),
    );
  }
}






