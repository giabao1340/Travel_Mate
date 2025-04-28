import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_mate/popular_item.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
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

class _HomeContentScreenState extends State<HomeContentScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  static var category = [
    'Phổ biến nhất',
    'Địa điểm gần bạn',
    'Địa điểm mới',
    'Địa điểm nổi bật',
    'Địa điểm yêu thích',
  ];
  var locationItems = [
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
  var userName = 'Gia Bảo';
  var userLocation = 'Quận 10, TP.HCM';
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: category.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Search box
                    Container(
                      width: double.infinity,
                      height: 50,
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 25,
                      ),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 249, 252, 255),
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(255, 234, 234, 234),
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Search',
                          hintStyle: TextStyle(
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontSize: 16,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            color: Color(0xFFF65959),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16),

                    // TabBar
                    TabBar(
                      tabAlignment: TabAlignment.center,
                      controller: _tabController,
                      isScrollable: true,
                      labelColor: Color.fromARGB(255, 144, 147, 205),
                      unselectedLabelColor: Color.fromARGB(255, 169, 169, 169),
                      indicatorColor: Color.fromARGB(255, 144, 147, 205),
                      indicatorWeight: 3,
                      labelPadding: EdgeInsets.only(left: 0, right: 40),
                      labelStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelStyle: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                      tabs: [
                        for (int i = 0; i < category.length; i++)
                          Tab(child: Text(category[i])),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Địa điểm phổ biến nhất',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 144, 147, 205),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => {},
                          child: Text(
                            'Xem thêm',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 144, 147, 205),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // TabBarView
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        physics: BouncingScrollPhysics(),
                        children: [
                          for (int i = 0; i < category.length; i++)
                            buildTabContent(category[i]),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Text(
                          'Địa điểm phổ biến nhất',
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color.fromARGB(255, 144, 147, 205),
                          ),
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () => {},
                          child: Text(
                            'Xem thêm',
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Color.fromARGB(255, 144, 147, 205),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
