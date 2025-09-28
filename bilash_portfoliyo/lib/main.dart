import 'package:flutter/material.dart';

void main() {
  runApp(const CarGameApp());
}

class CarGameApp extends StatelessWidget {
  const CarGameApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const CarGamePage(),
    );
  }
}

class CarGamePage extends StatefulWidget {
  const CarGamePage({super.key});

  @override
  State<CarGamePage> createState() => _CarGamePageState();
}

class _CarGamePageState extends State<CarGamePage> with SingleTickerProviderStateMixin {
  double carX = 0; 
  late AnimationController _controller;
  double roadOffset = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 50))
      ..addListener(() {
        setState(() {
          roadOffset += 10;
          if (roadOffset > 40) roadOffset = 0;
        });
      })
      ..repeat();
  }

  void moveLeft() {
    setState(() {
      carX -= 0.1;
      if (carX < -0.8) carX = -0.8;
    });
  }

  void moveRight() {
    setState(() {
      carX += 0.1;
      if (carX > 0.8) carX = 0.8;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget roadLine(double top) {
    return Positioned(
      top: top - roadOffset,
      left: MediaQuery.of(context).size.width / 2 - 5,
      child: Container(
        width: 10,
        height: 40,
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Stack(
        children: [
          Positioned(
            left: 10,
            top: 100,
            child: Container(
              width: 70,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[700],
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Building', style: TextStyle(color: Colors.white))),
            ),
          ),
          Positioned(
            left: 10,
            top: 300,
            child: Container(
              width: 70,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[600],
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Building', style: TextStyle(color: Colors.white))),
            ),
          ),

          // ডান পাশে বিল্ডিং গুলো
          Positioned(
            right: 10,
            top: 150,
            child: Container(
              width: 70,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[700],
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Building', style: TextStyle(color: Colors.white))),
            ),
          ),
          Positioned(
            right: 10,
            top: 350,
            child: Container(
              width: 70,
              height: 150,
              decoration: BoxDecoration(
                color: Colors.brown[600],
                border: Border.all(color: Colors.black, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Center(child: Text('Building', style: TextStyle(color: Colors.white))),
            ),
          ),

          // রাস্তার দুই পাশের সাদা লাইন
          Positioned(
            left: screenWidth / 2 - 100,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              color: Colors.white,
            ),
          ),
          Positioned(
            left: screenWidth / 2 + 90,
            top: 0,
            bottom: 0,
            child: Container(
              width: 10,
              color: Colors.white,
            ),
          ),

          // রাস্তার মাঝখানে ড্যাশড লাইন (move করবে)
          for (double i = 0; i < screenHeight; i += 80)
            roadLine(i),

          // গাড়ি
          Align(
            alignment: Alignment(carX, 0.7),
            child: SizedBox(
              width: 80,
              height: 150,
              child: Image.network(
                'https://cdn-icons-png.flaticon.com/512/743/743922.png',
                fit: BoxFit.contain,
              ),
            ),
          ),

          // নিচে control buttons
          Positioned(
            bottom: 30,
            left: 50,
            child: ElevatedButton(
              onPressed: moveLeft,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.black54,
              ),
              child: const Icon(Icons.arrow_left, size: 40),
            ),
          ),
          Positioned(
            bottom: 30,
            right: 50,
            child: ElevatedButton(
              onPressed: moveRight,
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                padding: const EdgeInsets.all(20),
                backgroundColor: Colors.black54,
              ),
              child: const Icon(Icons.arrow_right, size: 40),
            ),
          ),
        ],
      ),
    );
  }
}
