import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:travel_mate/popular_item.dart';

class HomeContentScreen extends StatefulWidget {
  const HomeContentScreen({super.key});

  @override
  State<HomeContentScreen> createState() => _HomeContentScreenState();
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
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            // Header cố định
            Container(
              alignment: Alignment.topCenter,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 167, 169, 212),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50),
                ),
              ),
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '☀️Chào buổi Sáng, $userName',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 5),
                          Text(
                            userLocation,
                            style: TextStyle(
                              fontSize: 18,
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
                      border: Border.all(
                        color: const Color.fromARGB(255, 255, 255, 255),
                        width: 1,
                      ),
                    ),
                    child: Icon(
                      Icons.notifications_none_outlined,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 50,
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 249, 252, 255),
                      boxShadow: const [
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
                          color: const Color.fromARGB(255, 0, 0, 0),
                          fontSize: 16,
                        ),
                        prefixIcon: Icon(
                          Icons.search,
                          color: const Color(0xFFF65959),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16), // khoảng cách giữa ô search và tab bar
                  TabBar(
                    tabAlignment: TabAlignment.center,
                    controller: _tabController,
                    isScrollable: true,
                    labelColor: Color.fromARGB(255, 144, 147, 205),
                    unselectedLabelColor: const Color.fromARGB(
                      255,
                      169,
                      169,
                      169,
                    ),
                    indicatorColor: Color.fromARGB(255, 144, 147, 205),
                    indicatorWeight: 3,
                    padding: EdgeInsets.zero,
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
                        Tab(child: Text(category[i])), // Sửa lại I thành i
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20), // TabBarView
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  for (int i = 0; i < category.length; i++)
                    buildTabContent(category[i]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(String title) {
    return Padding (
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //Đổn dữ liệu vào
                ...List.generate(
                  category.length,
                  (i) => PopularItem(
                    imageUrl:
                        'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                    title: 'Hà Giang',
                    rating: 4.5,
                    location: 'Hà Giang, Việt Nam',
                    reviews: 100,
                  ),
                ),
                // PopularItem(
                //   imageUrl:
                //       'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                //   title: 'Đà Lạt',
                //   rating: 4.5,
                //   location: 'Đà Lạt, Việt Nam',
                //   reviews: 120,
                // ),
                // PopularItem(
                //   imageUrl:
                //       'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                //   title: 'Đà Nẵng',
                //   rating: 4.7,
                //   location: 'Đà Nẵng, Việt Nam',
                //   reviews: 150,
                // ),
                // PopularItem(
                //   imageUrl:
                //       'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                //   title: 'Hà Nội',
                //   rating: 4.8,
                //   location: 'Hà Nội, Việt Nam',
                //   reviews: 200,
                // ),
                // PopularItem(
                //   imageUrl:
                //       'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                //   title: 'Nha Trang',
                //   rating: 4.9,
                //   location: 'Nha Trang, Việt Nam',
                //   reviews: 300,
                // ),
                // SizedBox(width: 16),
                // PopularItem(
                //   imageUrl:
                //       'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzNjUyOXwwfDF8c2VhcmNofDF8fHRyaXZpYWxlfGVufDB8fHx8MTY5MjQ1NTY3Ng&ixlib=rb-4.0.3&q=80&w=400',
                //   title: 'Hạ Long',
                //   rating: 4.6,
                //   location: 'Hạ Long, Việt Nam',
                //   reviews: 180,
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
