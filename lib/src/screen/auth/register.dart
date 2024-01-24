import 'package:carrot_flutter/src/controller/user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../home.dart';

class Register extends StatefulWidget {
  const Register({Key? key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final RegExp emailRegex =
      RegExp(r'^[a-zA-z0-9+-\_.]+@[a-zA-z0-9-]+\.[a-zA-z0-9-.]+$');
  final userController = Get.put(UserController());

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final String email = _emailController.text;
      final String password = _passwordController.text;
      final String name = _nameController.text;
      
      //bool result = await userController.register(email, name, password);
      //if (result) {
      Get.offAll(() => const Home());
      //}
      // 회원가입 로직 추가
      // 회원가입 성공 시, 다음 화면으로 이동 혹은 처리
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('SingUp')),
      body: Center(
        child: Container(
          width: 300, // 칸들의 폭을 조절할 수 있습니다.
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '가입하실 정보를 입력해주세요.',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, fontFamily: 'YourFontFamily'),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: '이메일',
                    border: OutlineInputBorder(),
                  ),
                  /* validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이메일을 입력하세요.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return '이메일 형식에 맞지 않습니다.';
                    }

                    return null;
                  },*/
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: '비밀번호',
                    border: OutlineInputBorder(),
                  ),
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '비밀번호를 입력하세요.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return '비밀번호 형식에 맞지 않습니다.';
                    }

                    return null;
                  },*/
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: '이름',
                    border: OutlineInputBorder(),
                  ),
                  /*validator: (value) {
                    if (value == null || value.isEmpty) {
                      return '이름을 입력하세요.';
                    }
                    if (!emailRegex.hasMatch(value)) {
                      return '이름 형식에 맞지 않습니다.';
                    }

                    return null;
                  },*/
                ),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 161, 104, 210),
                  ),
                  child: const Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'YourFontFamily',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
    );
  }
}