import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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

            // TabBar
            Padding(
              padding: const EdgeInsets.all(16),
              child: TabBar(
                tabAlignment: TabAlignment.center,
                controller: _tabController,
                isScrollable: true,
                labelColor: Color.fromARGB(255, 144, 147, 205),
                unselectedLabelColor: const Color.fromARGB(255, 169, 169, 169),
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
                    Tab(child: Text(category[i])),
                ],
              ),
            ),

            // TabBarView
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: GoogleFonts.montserrat(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Xem tất cả',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF176FF2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              'Nội dung cho tab "$title"',
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
