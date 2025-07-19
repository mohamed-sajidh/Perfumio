import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => HomePage()));
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: _animation,
            child: Image.asset(
              "assets/logo.png",
              height: 150,
            ),
          ),
          const SizedBox(height: 30),
          const CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
            strokeWidth: 2,
          ),
          const SizedBox(height: 20),
          const Text(
            "Welcome to Perfumio",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
