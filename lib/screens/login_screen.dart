import 'package:flutter/material.dart';
import 'package:twitter_app/screens/next_login_screen.dart';
import 'package:twitter_app/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Top bar with X icon
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.close, size: 28),
                  ), // Back/close button
                  Image.asset('assets/icons/logo.png', scale: 10),
                  const SizedBox(width: 28), // Spacer to balance
                ],
              ),
              const SizedBox(height: 40),

              // Title
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Sign in to Twitter",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 30),

              // Google Sign in Button
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: Image.asset(
                  "assets/icons/IOS_Google_icon.png",
                  height: 24,
                ),
                label: const Text(
                  "Sign in with Google",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 12),

              // Apple Sign in Button
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                icon: const Icon(Icons.apple, size: 24, color: Colors.black),
                label: const Text(
                  "Sign in with Apple",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 20),

              // OR divider
              Row(
                children: const [
                  Expanded(child: Divider()),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("or"),
                  ),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 20),

              // Text field
              TextField(
                decoration: InputDecoration(
                  hintText: "Phone, email, or username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 14,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Next button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NextLoginScreen(),
                    ),
                  );
                },
                child: const Text(
                  "Next",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 12),

              // Forgot password button
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  side: const BorderSide(color: Colors.grey),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Forgot password?",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
              const Spacer(),

              // Bottom text
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account? "),
                  GestureDetector(
                    onTap: () {Navigator.push(context, MaterialPageRoute(builder:  (context) => const SignupScreen()),);},
                    child: const Text(
                      "Sign up",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
