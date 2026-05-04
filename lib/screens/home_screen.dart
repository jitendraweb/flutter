import 'messages_screen.dart';
import 'experts_screen.dart';
import 'account_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  String _activeCategory = 'Legal';
  String? _selectedSpecialty = 'Business Consultation';

  final List<Map<String, dynamic>> _categories = [
    {'name': 'Healthcare', 'icon': Icons.medical_services_outlined},
    {'name': 'Legal', 'icon': Icons.gavel_outlined},
    {'name': 'Finance', 'icon': Icons.account_balance_wallet_outlined},
    {'name': 'Infrastructure', 'icon': Icons.architecture_outlined},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/booking'),
        backgroundColor: const Color(0xFF6229A7),
        shape: const CircleBorder(),
        child: const Icon(Icons.flash_on, color: Colors.white),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget _buildBody() {
    switch (_selectedIndex) {
      case 0:
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              _buildCategoryList(),
              _buildTripleHeroBanners(),
              _buildConnectedProfessionals(),
              _buildSpecialtySection(),
              _buildPopularServices(),
              const SizedBox(height: 100),
            ],
          ),
        );
      case 1:
        return const ExpertsScreen();
      case 2:
        return const MessagesScreen();
      case 3:
        return const AccountScreen();
      default:
        return const Center(child: Text('Page Not Found'));
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
      decoration: const BoxDecoration(
        color: Color(0xFF6229A7),
        // Adding a subtle grid-like texture
        image: DecorationImage(
          image: NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
          opacity: 0.1,
          repeat: ImageRepeat.repeat,
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.near_me, color: Colors.white, size: 16),
                      SizedBox(width: 8),
                      Text('Bengaluru', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                      Icon(Icons.keyboard_arrow_down, color: Colors.white),
                    ],
                  ),
                  Text('Cubbon Park, Vidhana Soudha', style: TextStyle(color: Colors.white70, fontSize: 12)),
                ],
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(color: Colors.white.withOpacity(0.2), shape: BoxShape.circle),
                child: const Icon(Icons.notifications_none, color: Colors.white),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search Specialty...',
                border: InputBorder.none,
                icon: Icon(Icons.search, color: Colors.grey),
                suffixIcon: Icon(Icons.tune, color: Colors.black87),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCategoryList() {
    return Container(
      height: 80,
      width: double.infinity,
      color: const Color(0xFF6229A7),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15),
        itemCount: _categories.length,
        itemBuilder: (context, index) {
          bool isActive = _activeCategory == _categories[index]['name'];
          return GestureDetector(
            onTap: () => setState(() {
              _activeCategory = _categories[index]['name'];
              _selectedSpecialty = null;
            }),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 12),
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: isActive ? Colors.white : Colors.transparent,
                borderRadius: BorderRadius.circular(15),
                border: !isActive ? Border.all(color: Colors.white.withOpacity(0.3)) : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(_categories[index]['icon'], color: isActive ? const Color(0xFF6229A7) : Colors.white, size: 24),
                  const SizedBox(height: 4),
                  Text(
                    _categories[index]['name'],
                    style: TextStyle(color: isActive ? const Color(0xFF6229A7) : Colors.white, fontWeight: FontWeight.bold, fontSize: 10),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTripleHeroBanners() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: _buildBannerCard('In Firm Consultation', 'https://images.unsplash.com/photo-1556157382-97dee2dcb70c?q=80&w=2070&auto=format&fit=crop')),
              const SizedBox(width: 15),
              Expanded(child: _buildBannerCard('Instant Video Consultation', 'https://images.unsplash.com/photo-1576091160550-2173dba999ef?q=80&w=2070&auto=format&fit=crop')),
            ],
          ),
          const SizedBox(height: 15),
          _buildBannerCard('Deliverables & Consultation', 'https://images.unsplash.com/photo-1589829545856-d10d557cf95f?q=80&w=2070&auto=format&fit=crop', isWide: true),
        ],
      ),
    );
  }

  Widget _buildBannerCard(String title, String imageUrl, {bool isWide = false}) {
    return Container(
      height: isWide ? 140 : 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 10)],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black.withOpacity(0.7), Colors.transparent],
          ),
        ),
        padding: const EdgeInsets.all(15),
        alignment: Alignment.bottomLeft,
        child: Text(
          title, 
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: isWide ? 16 : 13, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildConnectedProfessionals() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text('Professionals You Have Connected', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        SizedBox(
          height: 120,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemCount: 5,
            itemBuilder: (context, index) {
              List<String> avatars = [
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=100',
                'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100',
                'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100',
                'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100',
                'https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=100',
              ];
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(radius: 32, backgroundImage: NetworkImage(avatars[index])),
                        const Positioned(bottom: 0, right: 0, child: Icon(Icons.videocam, color: Color(0xFF6229A7), size: 20)),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text('CA Arvind\nMenon', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSpecialtySection() {
    List<Map<String, dynamic>> specialties = [
      {'name': 'Business Setup Advice', 'icon': Icons.business, 'color': Colors.blue},
      {'name': 'Business Consultation', 'icon': Icons.groups, 'color': Colors.purple},
      {'name': 'CA Certification & Reports', 'icon': Icons.verified, 'color': Colors.indigo},
      {'name': 'Annual Financial Planning', 'icon': Icons.event_note, 'color': Colors.green},
      {'name': 'Preventive Health Check-Up', 'icon': Icons.health_and_safety, 'color': Colors.red},
      {'name': 'Tax Advisory', 'icon': Icons.receipt_long, 'color': Colors.orange},
      {'name': 'Audit (Individual-SME)', 'icon': Icons.assignment, 'color': Colors.teal},
      {'name': 'CA Certification & Reports', 'icon': Icons.verified, 'color': Colors.blueGrey},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(20),
          child: Text('Find An Advisor For Your Financial Problems', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        ),
        _buildSpecialtyRow(specialties.sublist(0, 4)),
        if (_selectedSpecialty != null) _buildSubMenu(),
        const SizedBox(height: 15),
        _buildSpecialtyRow(specialties.sublist(4, 8)),
      ],
    );
  }

  Widget _buildSpecialtyRow(List<Map<String, dynamic>> items) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: items.map((item) {
          bool isSelected = _selectedSpecialty == item['name'];
          return Expanded(
            child: Column(
              children: [
                GestureDetector(
                  onTap: () => setState(() => _selectedSpecialty = isSelected ? null : item['name']),
                  child: Container(
                    height: 85,
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isSelected ? const Color(0xFFE1BEE7) : const Color(0xFFF3E5F5),
                      borderRadius: BorderRadius.circular(15),
                      border: isSelected ? Border.all(color: const Color(0xFF6229A7), width: 2) : null,
                    ),
                    child: Icon(item['icon'], color: const Color(0xFF6229A7), size: 35),
                  ),
                ),
                const SizedBox(height: 8),
                Text(item['name'], textAlign: TextAlign.center, style: const TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildSubMenu() {
    List<Map<String, dynamic>> subItems = [
      {'name': 'Financial Planning', 'icon': Icons.insights},
      {'name': 'Business Closure', 'icon': Icons.business_center},
      {'name': 'Market Analysis', 'icon': Icons.analytics},
      {'name': 'Consultation', 'icon': Icons.support_agent},
      {'name': 'Registration', 'icon': Icons.app_registration},
    ];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFE1BEE7).withOpacity(0.5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: subItems.map((sub) => Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Icon(sub['icon'], color: const Color(0xFF6229A7), size: 22),
            ),
            const SizedBox(height: 6),
            Text(sub['name'], style: const TextStyle(fontSize: 7, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
          ],
        )).toList(),
      ),
    );
  }

  Widget _buildPopularServices() {
    return Container(
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        gradient: const LinearGradient(colors: [Color(0xFF1E88E5), Color(0xFF1565C0)]),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [BoxShadow(color: Colors.blue.withOpacity(0.3), blurRadius: 15, offset: const Offset(0, 8))],
      ),
      child: Row(
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Free Follow-Up', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                Text('For 3 Days With Every Consultation', style: TextStyle(color: Colors.white70, fontSize: 12)),
                SizedBox(height: 12),
                Text('Know More', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, decoration: TextDecoration.underline)),
              ],
            ),
          ),
          Icon(Icons.chat_bubble_outline, color: Colors.white.withOpacity(0.5), size: 60),
        ],
      ),
    );
  }

  Widget _buildBottomNav() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.home, 'Home', 0),
          _buildNavItem(Icons.people_outline, 'Experts', 1),
          const SizedBox(width: 40),
          _buildNavItem(Icons.message_outlined, 'Messages', 2),
          _buildNavItem(Icons.person_outline, 'Account', 3),
        ],
      ),
    );
  }

  Widget _buildNavItem(IconData icon, String label, int index) {
    return GestureDetector(
      onTap: () => setState(() => _selectedIndex = index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: _selectedIndex == index ? const Color(0xFF6229A7) : Colors.grey),
          Text(label, style: TextStyle(color: _selectedIndex == index ? const Color(0xFF6229A7) : Colors.grey, fontSize: 10)),
        ],
      ),
    );
  }
}
