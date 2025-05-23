import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:travel_mate/modules/home/screens/popular_item.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class LocationItem {
  final String image;
  final String title;
  final String location;
  final double rating;
  final int reviews;

  const LocationItem({
    required this.image,
    required this.title,
    required this.location,
    required this.rating,
    required this.reviews,
  });
}

// ✨ Class quản lý sự kiện
class Event {
  final String name;
  bool isSubscribed;

  Event({required this.name, this.isSubscribed = false});
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  bool isFavorited = false;
  bool isBookmarked = false;
  final String placeName = "Đà Lạt";
  final String description =
      "Đà Lạt là một thành phố thơ mộng với khí hậu mát mẻ quanh năm, nổi tiếng với các địa điểm du lịch như Hồ Xuân Hương, Thung Lũng Tình Yêu, và nhiều hơn nữa.";

  final List<String> imageUrls = [
    'assets/city1.jpg',
    'assets/city2.jpg',
    'assets/city3.jpg',
  ];

  final List<LocationItem> locationItems = [
    LocationItem(
      image: 'assets/city1.jpg',
      title: 'City 1',
      location: 'Location 1',
      rating: 4.5,
      reviews: 100,
    ),
    LocationItem(
      image: 'assets/city2.jpg',
      title: 'City 2',
      location: 'Location 2',
      rating: 4.0,
      reviews: 80,
    ),
    LocationItem(
      image: 'assets/city3.jpg',
      title: 'City 3',
      location: 'Location 3',
      rating: 4.8,
      reviews: 120,
    ),
    LocationItem(
      image: 'assets/city4.jpg',
      title: 'City 4',
      location: 'Location 4',
      rating: 4.2,
      reviews: 90,
    ),
    LocationItem(
      image: 'assets/city5.jpg',
      title: 'City 5',
      location: 'Location 5',
      rating: 4.7,
      reviews: 110,
    ),
    LocationItem(
      image: 'assets/city6.jpg',
      title: 'City 6',
      location: 'Location 6',
      rating: 4.3,
      reviews: 95,
    ),
  ];

  // ✅ Danh sách sự kiện có thể bật/tắt thông báo riêng
  final List<Event> events = [
    Event(name: "Lễ hội Hoa Đà Lạt - 20/12/2025"),
    Event(name: "Chợ đêm Đà Lạt - Mỗi tối"),
    Event(name: "Tour khám phá Thác Datanla - Hàng ngày"),
  ];

  final List<Map<String, dynamic>> reviews = [
    {"name": "Nguyễn Văn A", "rating": 4.5, "comment": "Rất đẹp và thơ mộng!"},
    {"name": "Trần Thị B", "rating": 5.0, "comment": "Khí hậu tuyệt vời."},
    {
      "name": "Lê Văn C",
      "rating": 4.0,
      "comment": "Địa điểm đáng để ghé thăm.",
    },
  ];

  final TextEditingController reviewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text(placeName),
        backgroundColor: const Color(0xFF9093CD),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20, top: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Carousel
            CarouselSlider(
              options: CarouselOptions(
                height: 230,
                autoPlay: true,
                enlargeCenterPage: true,
              ),
              items:
                  imageUrls.map((url) {
                    return ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        url,
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    );
                  }).toList(),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorited = !isFavorited;
                      });
                    },
                    icon: Icon(
                      isFavorited ? Icons.favorite : Icons.favorite_border,
                      color: Colors.redAccent,
                    ),
                    tooltip: "Yêu thích",
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        isBookmarked = !isBookmarked;
                      });
                    },
                    icon: Icon(
                      isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                      color: Colors.deepPurple,
                    ),
                    tooltip: "Lưu địa điểm",
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.directions_outlined,
                      color: Colors.deepPurpleAccent,
                    ),
                    onPressed: () {},
                    tooltip: "Chỉ đường",
                  ),
                ],
              ),
            ),
            // Title & Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    placeName,
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.black54),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Sự kiện
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Sự kiện",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ...events.asMap().entries.map((entry) {
              Event event = entry.value;
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 5,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: const Icon(Icons.event, color: Colors.blueAccent),
                    title: Text(event.name),
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          event.isSubscribed = !event.isSubscribed;
                        });
                      },
                      icon: Icon(
                        event.isSubscribed
                            ? Icons.notifications_active
                            : Icons.notifications_none_outlined,
                        color: Colors.deepPurple,
                      ),
                    ),
                  ),
                ),
              );
            }),

            const SizedBox(height: 25),
            // Đánh giá
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: const Text(
                "Đánh giá",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 10),
            ...reviews.map((review) {
              return Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.deepPurple.shade100,
                      child: Text(review["name"][0]),
                    ),
                    title: Text(review["name"]),
                    subtitle: Text(review["comment"]),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(5, (index) {
                        return Icon(
                          index < review["rating"]
                              ? Icons.star
                              : Icons.star_border,
                          color: Colors.amber,
                          size: 18,
                        );
                      }),
                    ),
                  ),
                ),
              );
            }),

            // Viết đánh giá
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Viết đánh giá của bạn:",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  TextField(
                    controller: reviewController,
                    maxLines: 3,
                    decoration: InputDecoration(
                      hintText: "Nhập cảm nhận của bạn...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: const Text("Gửi"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(String title) {
    return SizedBox(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: List.generate(6, (index) {
            return PopularItem(
              image: locationItems[index].image,
              title: locationItems[index].title,
              location: locationItems[index].location,
              rating: locationItems[index].rating,
              reviews: locationItems[index].reviews,
            );
          }),
        ),
      ),
    );
  }
}
