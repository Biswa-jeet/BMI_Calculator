import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final String foodName;
  final String imagePath;
  final String description;

  const FoodCard({
    Key? key,
    required this.foodName,
    required this.imagePath,
    this.description = '', // Remove 'required' keyword and provide a default value
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: Card(
          elevation: 3,
          child: Column(
            children: [
              Image.asset(imagePath, height: 200, width: double.infinity, fit: BoxFit.cover),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      foodName,
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
