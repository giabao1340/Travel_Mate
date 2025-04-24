import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dynamic_tabbar/dynamic_tabbar.dart';

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
  List<TabData> tabs = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: category.length, vsync: this);
    for (int i = 0; i < category.length; i++) {
      tabs.add(
        TabData(
          index: i,
          title: Tab(child: Text(category[i])),
          content: Center(child: Text('Content for ${category[i]}')),
        ),
      );
    }
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
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 15.0,
                horizontal: 20,
              ),
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 25),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 249, 252, 255),
                  // border: Border.all(
                  //   color: const Color.fromARGB(255, 209, 209, 209),
                  //   width: 1,
                  // ),
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
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                controller: _tabController,
                isScrollable: true,
                labelColor: const Color.fromARGB(255, 141, 137, 245),
                unselectedLabelColor: Colors.black,
                indicatorColor: const Color.fromARGB(255, 146, 128, 244),
                indicatorWeight: 3,
                padding: EdgeInsets.zero, // Không thêm padding ngoài
                labelPadding: EdgeInsets.only(left: 0, right: 40),
                // indicatorPadding: EdgeInsets.only(left: 0, right: 40),
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
          ],
        ),
        // bottomNavigationBar: CurvedNavigationBar(
        //   backgroundColor: Colors.white,
        //   color: Color.fromARGB(255, 167, 169, 212),
        //   index: 2,
        //   items: [
        //     Icon(Icons.search, size: 30, color: Colors.white),
        //     Icon(Icons.favorite, size: 30, color: Colors.white),
        //     Icon(Icons.home, size: 30, color: Colors.white),
        //     Icon(Icons.list, size: 30, color: Colors.white),
        //     Icon(Icons.person, size: 30, color: Colors.white),
        //   ],

        //   onTap: (index) {
        //     // Handle navigation based on the index
        //     if (index == 1) {
        //       Navigator.pushNamed(context, '/favoritescreen');
        //     }
        //     // else if (index == 1) {
        //     //   Navigator.pushNamed(context, '/home');
        //     // } else if (index == 2) {
        //     //   Navigator.pushNamed(context, '/introscreen');
        //     // } else if (index == 3) {
        //     //   Navigator.pushNamed(context, '/register');
        //     // } else if (index == 4) {
        //     //   Navigator.pushNamed(context, '/login');
        //     // }
        //   },
        // ),
      ),
    );
  }
}
