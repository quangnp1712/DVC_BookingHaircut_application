import 'dart:async';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // Biến điều khiển độ mờ của form
  double _opacity = 0.0;
  TextEditingController _dateController = TextEditingController();
  String? _selectedGender = 'Nam'; // Mặc định giới tính là Nam

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

          // Nội dung đăng ký
          Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Hiệu ứng fade-in cho form đăng ký
                  AnimatedOpacity(
                    duration: const Duration(seconds: 2),
                    opacity: _opacity,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      margin: const EdgeInsets.symmetric(horizontal: 40),
                      decoration: BoxDecoration(
                        color: Colors.amber.shade100.withOpacity(0.8),
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
                            "ĐĂNG KÝ",
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Tên
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Tên",
                              hintText: "Nhập tên của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Họ
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Họ",
                              hintText: "Nhập họ của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.person),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Số điện thoại
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Số điện thoại",
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
                              labelText: "Mật khẩu",
                              hintText: "Nhập mật khẩu của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.lock),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Nhập ngày sinh
                          TextField(
                            controller: _dateController,
                            decoration: InputDecoration(
                              labelText: "Ngày Sinh (DD/MM/YYYY)",
                              hintText: "Nhập ngày sinh của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.calendar_today),
                            ),
                            onTap: () async {
                              FocusScope.of(context).requestFocus(FocusNode());
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(1900),
                                lastDate: DateTime.now(),
                              );
                              if (pickedDate != null) {
                                setState(() {
                                  _dateController.text =
                                      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                                });
                              }
                            },
                          ),
                          const SizedBox(height: 20),
                          // Nhập địa chỉ
                          TextField(
                            decoration: InputDecoration(
                              labelText: "Địa chỉ",
                              hintText: "Nhập địa chỉ của bạn",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              prefixIcon: const Icon(Icons.location_on),
                            ),
                          ),
                          const SizedBox(height: 20),
                          // Chọn giới tính
                          Row(
                            children: [
                              Expanded(
                                child: ListTile(
                                  title: const Text("Nam"),
                                  leading: Radio<String>(
                                    value: 'Nam',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListTile(
                                  title: const Text("Nữ"),
                                  leading: Radio<String>(
                                    value: 'Nữ',
                                    groupValue: _selectedGender,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 30),
                          // Nút ĐĂNG KÝ
                          ElevatedButton(
                            onPressed: () {
                              // Xử lý sự kiện đăng ký ở đây
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
                              " HOÀN TẤT",
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
