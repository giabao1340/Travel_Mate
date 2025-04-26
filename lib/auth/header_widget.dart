import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  final String userName;
  final String userLocation;

  const HeaderWidget({
    super.key,
    required this.userName,
    required this.userLocation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 167, 169, 212),
        borderRadius: BorderRadius.only(bottomRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      height: 125,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 40),
              Text(
                '☀️ Chào buổi sáng, $userName',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    size: 20,
                    color: Colors.white,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    userLocation,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              border: Border.all(color: Colors.white, width: 1),
            ),
            child: const Icon(
              Icons.notifications_none_outlined,
              size: 28,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
