import 'package:flutter/material.dart';

class CategorySelectionScreen extends StatelessWidget {
  const CategorySelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: -100,
            left: -50,
            child: Container(
              height: 300,
              width: 500,
              decoration: const BoxDecoration(color: Color(0xFFE1BEE7), shape: BoxShape.circle),
            ),
          ),
          SafeArea(
            child: Column(
              children: [
                const SizedBox(height: 60),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCategoryCard('Healthcare', Icons.medical_services, Colors.red[100]!, Colors.red),
                          buildCategoryCard('Finance', Icons.payments, Colors.green[100]!, Colors.green),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildCategoryCard('Legal', Icons.gavel, Colors.amber[100]!, Colors.amber[800]!),
                          buildCategoryCard('Infrastructure', Icons.business, Colors.blue[100]!, Colors.blue),
                        ],
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: const BoxDecoration(color: Color(0xFF6229A7), shape: BoxShape.circle),
                          child: const Text('P', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)),
                        ),
                        const SizedBox(width: 10),
                        const Text('prozsphere', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const Text('Experts. Booked. Solved.', style: TextStyle(color: Colors.grey, fontSize: 12)),
                    const SizedBox(height: 40),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildCategoryCard(String title, IconData icon, Color bgColor, Color iconColor) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => Navigator.pushReplacementNamed(context, '/home'),
        child: Container(
          width: 135,
          height: 155,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [BoxShadow(color: iconColor.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(color: bgColor, shape: BoxShape.circle),
                child: Icon(icon, size: 40, color: iconColor),
              ),
              const SizedBox(height: 15),
              Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[800], fontSize: 14)),
            ],
          ),
        ),
      );
    });
  }
}
