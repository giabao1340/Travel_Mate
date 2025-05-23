import 'package:flutter/material.dart';
import 'place_details_screen.dart'; // Import màn hình PlaceDetailsScreen

class PopularItem extends StatelessWidget {
  final String image;
  final String title;
  final String location;
  final double rating;
  final int reviews;

  const PopularItem({
    super.key,
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Điều hướng đến PlaceDetailsScreen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    PlaceDetailsScreen(), // Chuyển đến màn hình chi tiết
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              child: Image(
                image: AssetImage(image),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 150,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(location),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 16),
                      const SizedBox(width: 5),
                      Text('$rating ($reviews reviews)'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
