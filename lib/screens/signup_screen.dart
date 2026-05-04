import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            decoration: const BoxDecoration(color: Color(0xFF6229A7)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Text('P', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
                ),
                const SizedBox(height: 10),
                const Text('Register Yourself With\nProZsphere', textAlign: TextAlign.center, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
              ],
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.22, left: 20, right: 20, bottom: 40),
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 20, offset: const Offset(0, 10))],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildLabel('Name'),
                  buildTextField('Enter Name'),
                  const SizedBox(height: 16),
                  buildLabel('Date of Birth'),
                  Row(
                    children: [
                      Expanded(child: buildTextField('Day')),
                      const SizedBox(width: 10),
                      Expanded(child: buildTextField('Month')),
                      const SizedBox(width: 10),
                      Expanded(child: buildTextField('Year')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildLabel('City'),
                  buildTextField('City'),
                  const SizedBox(height: 16),
                  buildLabel('State'),
                  buildTextField('State'),
                  const SizedBox(height: 16),
                  buildLabel('Gender'),
                  buildTextField('Gender'),
                  const SizedBox(height: 16),
                  buildLabel('Mobile Number'),
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                        decoration: BoxDecoration(border: Border.all(color: Colors.grey[300]!), borderRadius: BorderRadius.circular(12)),
                        child: const Row(
                          children: [
                            Text('🇮🇳', style: TextStyle(fontSize: 18)),
                            Icon(Icons.keyboard_arrow_down, size: 16),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: buildTextField('Mobile Number')),
                    ],
                  ),
                  const SizedBox(height: 16),
                  buildLabel('Email'),
                  buildTextField('Email'),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (v) {}, activeColor: const Color(0xFF6229A7)),
                      const Expanded(
                        child: Text.rich(
                          TextSpan(
                            text: 'I Agree To The ',
                            style: TextStyle(fontSize: 12),
                            children: [
                              TextSpan(text: 'Terms & Conditions', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' And '),
                              TextSpan(text: 'Privacy Policy', style: TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pushReplacementNamed(context, '/categories'),
                      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF6229A7), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))),
                      child: const Text('Create My Account', style: TextStyle(color: Colors.white, fontSize: 16)),
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

  Widget buildLabel(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black87)),
    );
  }

  Widget buildTextField(String hint) {
    return TextField(
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(color: Colors.grey[300]!)),
      ),
    );
  }
}
