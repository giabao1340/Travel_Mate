import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static var category = [
    'Phổ biến nhất',
    'Địa điểm gần bạn',
    'Địa điểm mới',
    'Địa điểm nổi bật',
    'Địa điểm yêu thích',
  ];

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    // Kiểm tra danh sách category trước khi khởi tạo TabController
    if (HomeScreen.category.isNotEmpty) {
      _tabController = TabController(
        length: HomeScreen.category.length,
        vsync: this, // Sử dụng `this` làm vsync
      );
    }
  }

  @override
  void dispose() {
    _tabController.dispose(); // Hủy TabController khi widget bị unmounted
    super.dispose();
  }

  String get title => 'Home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Header cố định
          Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 167, 169, 212),
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(50)),
            ),
            padding: EdgeInsets.all(30),
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '☀️Chào buổi Sáng, Bảo',
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
                          "Quận 10, TP.HCM",
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
                      color: const Color.fromARGB(255, 190, 190, 190),
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

          // Nội dung cuộn
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(
                    alignment: Alignment.topLeft, // Căn TabBar sát lề trái
                    child: TabBar(
                      controller: _tabController,
                      isScrollable: true, // Cho phép TabBar cuộn
                      labelColor: Color.fromARGB(255, 144, 147, 205),
                      unselectedLabelColor: Color(0xFFB8B8B8),
                      labelStyle: GoogleFonts.robotoCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      unselectedLabelStyle: GoogleFonts.robotoCondensed(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                      indicatorColor: Color.fromARGB(255, 167, 169, 212),
                      tabs: [
                        Tab(
                          text: 'Địa điểm gần bạn',
                        ),
                        Tab(
                          text: 'Địa điểm mới',
                        ),
                        Tab(
                          text: 'Địa điểm nổi bật',
                        ),
                        // for (int i = 1; i < HomeScreen.category.length; i++)
                        //   Tab(text: HomeScreen.category[i]),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                      // horizontal: 20,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2F2F2),
                        border: Border.all(
                          color: const Color(0xFFF2F2F2),
                          width: 1,
                        ),
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
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation Bar cố định
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Color.fromARGB(255, 167, 169, 212),
        index: 2,
        items: [
          Icon(Icons.search, size: 30, color: Colors.white),
          Icon(Icons.favorite, size: 30, color: Colors.white),
          Icon(Icons.home, size: 30, color: Colors.white),
          Icon(Icons.list, size: 30, color: Colors.white),
          Icon(Icons.person, size: 30, color: Colors.white),
        ],
      ),
    );
  }
}


// SizedBox(
//                     height: 200,
//                     child: ListView.builder(
//                       itemCount: 6,
//                       scrollDirection: Axis.horizontal,
//                       itemBuilder: (BuildContext context, int index) {
//                         return InkWell(
//                           onTap: () {
//                             Navigator.pushNamed(context, '/details');
//                           },
//                           child: Container(
//                             width: 160,
//                             padding: EdgeInsets.all(20),
//                             margin: EdgeInsets.only(right: 15),
//                             decoration: BoxDecoration(
//                               color: const Color.fromARGB(255, 0, 0, 0),
//                               borderRadius: BorderRadius.circular(15),
//                               image: DecorationImage(
//                                 image: AssetImage(
//                                   'assets/city${index + 1}.jpg',
//                                 ),
//                                 fit: BoxFit.cover,
//                                 opacity: 0.7,
//                               ),
//                             ),
//                             child: Column(
//                               children: [
//                                 Container(
//                                   alignment: Alignment.topRight,
//                                   child: Icon(
//                                     Icons.bookmark_border_outlined,
//                                     color: const Color.fromARGB(
//                                       255,
//                                       255,
//                                       255,
//                                       255,
//                                     ),
//                                     size: 30,
//                                   ),
//                                 ),
//                                 Spacer(),
//                                 Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: Text(
//                                     'City ${index + 1}',
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontSize: 18,
//                                       fontWeight: FontWeight.w600,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   ),