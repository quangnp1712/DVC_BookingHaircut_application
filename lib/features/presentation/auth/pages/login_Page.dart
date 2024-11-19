import 'dart:async';
import 'package:flutter/material.dart';
import 'package:daivietcatbookinghaircut/features/presentation/auth/pages/register_Page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Biến điều khiển độ mờ của form
  double _opacity = 0.0;

  @override
  void initState() {
    super.initState();
    // Đặt độ mờ thành 1.0 sau một khoảng thời gian, tạo hiệu ứng fade-in
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _opacity = 1.0;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Hình nền
          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/bannerDVC.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),

          // Nội dung đăng nhập
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hiệu ứng fade-in cho form đăng nhập
                  AnimatedOpacity(
                    duration:
                        const Duration(seconds: 2), // Thời gian fade-in 2 giây
                    opacity: _opacity, // Điều khiển độ mờ
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100.withOpacity(
                            0.8), // Thêm độ mờ để hình nền vẫn nhìn thấy
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 10,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "ĐĂNG NHẬP",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Số điện thoại
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Nhập số điện thoại",
                              hintText: "Nhập số điện thoại của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.phone),
                            ),
                            keyboardType: TextInputType.phone,
                          ),
                          const SizedBox(height: 20),
                          // Mật khẩu
                          TextField(
                            obscureText: true,
                            decoration: InputDecoration(
                              labelText: "Nhập mật khẩu",
                              hintText: "Nhập mật khẩu của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                          ),
                          const SizedBox(height: 30),
                          // Nút TIẾP TỤC
                          ElevatedButton(
                            onPressed: () {
                              // Xử lý sự kiện đăng nhập ở đây
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(155, 25, 25, 1),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "TIẾP TỤC",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Màu chữ trắng
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Nút ĐĂNG KÝ
                          ElevatedButton(
                            onPressed: () {
                              // Điều hướng đến trang RegisterPage
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const RegisterPage()),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromRGBO(155, 25, 25, 1),
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: const Text(
                              "ĐĂNG KÝ",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white, // Màu chữ trắng
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
