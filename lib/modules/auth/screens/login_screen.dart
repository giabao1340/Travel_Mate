import 'package:flutter/material.dart';
import 'package:travel_mate/modules/auth/controller/auth_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AuthController _authController = AuthController();

  void _handleGoogleSignIn() async {
    final user = await _authController.signInWithGoogle();
    if (!mounted) return; // 👈 kiểm tra widget còn tồn tại

    if (user != null) {
      Navigator.pushReplacementNamed(context, '/home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đăng nhập Google thất bại')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Đăng Nhập')),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login_background.jpg'),
            fit: BoxFit.fitWidth,
            alignment: Alignment.bottomCenter,
          ),
          color: Colors.white,
        ),
        padding: const EdgeInsets.all(15.0),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 50),
            const Text(
              'Chào mừng bạn đến với Travel Mate!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 128, 120, 218),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Mật khẩu',
                border: OutlineInputBorder(),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  side: const BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/home',
                ); // Điều hướng đến trang chủ
              },
              child: const Text(
                'Đăng Nhập',
                style: TextStyle(
                  color: Colors.black, // Màu chữ
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Đăng Nhập Bằng',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              onPressed: _handleGoogleSignIn,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/google.png', // Đường dẫn đến icon Google
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10), // Khoảng cách giữa icon và text
                  const Text(
                    'Continue with Google',
                    style: TextStyle(
                      color: Colors.black, // Màu chữ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 20,
                ),
              ),
              onPressed: () {
                // Thêm logic đăng nhập ở đây
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/facebook.png', // Đường dẫn đến icon Google
                    height: 24,
                    width: 24,
                  ),
                  const SizedBox(width: 10), // Khoảng cách giữa icon và text
                  const Text(
                    'Continue with Facebook',
                    style: TextStyle(
                      color: Colors.black, // Màu chữ
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                // Thêm logic quên mật khẩu ở đây
                Navigator.pushNamed(
                  context,
                  '/forgotpassword',
                ); // Điều hướng đến trang quên mật khẩu
              },
              child: Text('Quên mật khẩu'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text('Bạn chưa có tài khoản?'),
                TextButton(
                  onPressed: () {
                    // Điều hướng đến trang đăng ký
                    Navigator.pushNamed(
                      context,
                      '/register',
                    ); // Điều hướng đến trang đăng ký
                  },
                  child: const Text('Đăng ký'),
                ),
              ],
            ),
            // const SizedBox(height: 25.6),
          ],
        ),
      ),
    );
  }
}
