import 'package:flutter/material.dart';

class OtpVerificationScreen extends StatelessWidget {
  const OtpVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(title: const Text('Xác thực OTP')),
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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Nhập mã OTP đã gửi đến email của bạn',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 128, 120, 218),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(4, (index) {
                return SizedBox(
                  width: 50,
                  child: TextField(
                    textAlign: TextAlign.center,
                    maxLength: 1,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      counterText: '', // Hide the character counter
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      // Automatically move to the next field when a digit is entered
                      if (value.isNotEmpty && index < 3) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                  ),
                );
              }),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:
                    const Color.fromARGB(255, 128, 120, 218), // Change button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              onPressed: () {
                // Handle OTP verification logic here
                Navigator.pushNamed(
                  context,
                  '/resetpassword',
                ); // Navigate to home screen after verification
              },
              child: const Text('Xác thực',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  )),
            ),
            const SizedBox(height: 20),
            const Text(
              'Chưa nhận được mã?',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 128, 120, 218),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {
                // Handle resend OTP logic here
              },
              child: const Text(
                'Gửi lại mã OTP',
                style: TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 128, 120, 218),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}