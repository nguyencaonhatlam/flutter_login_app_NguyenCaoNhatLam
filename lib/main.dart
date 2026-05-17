import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LoginScreen()
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login(){
    String email = emailController.text;
    String password = passwordController.text;
    if( email == "admin@gmail.com" && password == "123456"){
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Đăng nhập thành công"), backgroundColor: Colors.green,),);
    }else{
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Sai tài khoản hoặc mật khẩu"), backgroundColor: Colors.red,),);
    }
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.lock, size: 100, color: Colors.blue,),
            const SizedBox(height: 30),
            TextField(controller: emailController, decoration: InputDecoration
                (labelText: "Email", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                prefixIcon: const Icon(Icons.email),
              ),
            ),
            const SizedBox(height: 20),
            TextField(controller: passwordController,obscureText: true,decoration: InputDecoration(
                labelText: "Password", border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
                prefixIcon: const Icon(Icons.lock),
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(width: double.infinity,
              height: 50,
              child: ElevatedButton(onPressed: login, child: const Text("Đăng nhập", style: TextStyle(fontSize: 18),)),
            )
          ],
        ),
      ),
    );
  }
}
