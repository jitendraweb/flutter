import 'package:flutter/material.dart';

class ExpertsScreen extends StatelessWidget {
  const ExpertsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
              child: Text(
                'Top Experts',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            _buildFilterChips(),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                itemCount: 5,
                itemBuilder: (context, index) => _buildExpertCard(index),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChips() {
    List<String> filters = ['All', 'Healthcare', 'Legal', 'Finance', 'Infrastructure'];
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: filters.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 8),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: index == 0 ? const Color(0xFF6229A7) : Colors.grey[100],
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              filters[index],
              style: TextStyle(
                color: index == 0 ? Colors.white : Colors.black87,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildExpertCard(int index) {
    List<Map<String, String>> experts = [
      {'name': 'Dr. Sarah Johnson', 'title': 'Senior Cardiologist', 'image': 'https://images.unsplash.com/photo-1559839734-2b71ea197ec2?w=150', 'rating': '4.9', 'exp': '12 Years', 'fee': '\$50'},
      {'name': 'Adv. Vikram Singh', 'title': 'Corporate Lawyer', 'image': 'https://images.unsplash.com/photo-1560250097-0b93528c311a?w=150', 'rating': '4.8', 'exp': '8 Years', 'fee': '\$75'},
      {'name': 'CA Megha Gupta', 'title': 'Tax Consultant', 'image': 'https://images.unsplash.com/photo-1573496359142-b8d87734a5a2?w=150', 'rating': '4.7', 'exp': '10 Years', 'fee': '\$40'},
      {'name': 'Dr. Robert Chen', 'title': 'Dermatologist', 'image': 'https://images.unsplash.com/photo-1612349317150-e413f6a5b16d?w=150', 'rating': '4.9', 'exp': '15 Years', 'fee': '\$60'},
      {'name': 'Ar. Kevin Peterson', 'title': 'Structural Engineer', 'image': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=150', 'rating': '4.6', 'exp': '7 Years', 'fee': '\$90'},
    ];
    var expert = experts[index];

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
        border: Border.all(color: Colors.grey[100]!),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(expert['image']!, width: 90, height: 90, fit: BoxFit.cover),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(expert['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text(expert['title']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                const SizedBox(height: 8),
                Row(
                  children: [
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    const SizedBox(width: 4),
                    Text(expert['rating']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                    const SizedBox(width: 15),
                    const Icon(Icons.work_outline, color: Colors.grey, size: 16),
                    const SizedBox(width: 4),
                    Text(expert['exp']!, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('${expert['fee']}/hr', style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6229A7), fontSize: 16)),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF6229A7),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      ),
                      child: const Text('Book Now', style: TextStyle(fontSize: 12)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
