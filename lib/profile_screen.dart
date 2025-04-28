import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            // Header với ảnh đại diện và thông tin người dùng
            Stack(
              children: [
                Container(
                  height: 180,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 167, 169, 212),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                Positioned(
                  top: 50,
                  left: 20,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                          'assets/avata.png',
                        ), // Thay bằng đường dẫn ảnh của bạn
                      ),
                      const SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Gia Bảo',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Quận 10, TP.HCM',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Các tùy chọn cài đặt
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const Text(
                    'Tài khoản',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProfileOption(
                    icon: Icons.person_outline,
                    title: 'Thông tin cá nhân',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
                  ),
                  ProfileOption(
                    icon: Icons.lock_outline,
                    title: 'Đổi mật khẩu',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
                  ),
                  ProfileOption(
                    icon: Icons.notifications_outlined,
                    title: 'Thông báo',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Cài đặt',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ProfileOption(
                    icon: Icons.settings_outlined,
                    title: 'Cài đặt ứng dụng',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
                  ),
                  ProfileOption(
                    icon: Icons.help_outline,
                    title: 'Trợ giúp',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
                  ),
                  ProfileOption(
                    icon: Icons.logout,
                    title: 'Đăng xuất',
                    onTap: () {
                      // Thêm logic khi nhấn vào
                    },
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

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        elevation: 2,
        shadowColor: Colors.grey.withOpacity(0.3),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(15),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
          highlightColor: Colors.grey.withOpacity(0.1),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Row(
              children: [
                Icon(icon, size: 24, color: Colors.black87),
                const SizedBox(width: 15),
                Text(
                  title,
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const Spacer(),
                const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
