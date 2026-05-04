import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            const SizedBox(height: 20),
            _buildMenuSection(context),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(20, 60, 20, 30),
      decoration: const BoxDecoration(
        color: Color(0xFF6229A7),
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
      ),
      child: Column(
        children: [
          Stack(
            children: [
              const CircleAvatar(
                radius: 50,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?w=200'),
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  child: const Icon(Icons.edit, color: Color(0xFF6229A7), size: 18),
                ),
              ),
            ],
          ),
          const SizedBox(height: 15),
          const Text('Jitendra Panda', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
          const Text('jitendra.panda@example.com', style: TextStyle(color: Colors.white70, fontSize: 14)),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          _buildMenuItem(Icons.calendar_today_outlined, 'My Bookings'),
          _buildMenuItem(Icons.account_balance_wallet_outlined, 'Wallet / Payments'),
          _buildMenuItem(Icons.favorite_outline, 'Favorites'),
          _buildMenuItem(Icons.help_outline, 'Help & Support'),
          _buildMenuItem(Icons.description_outlined, 'Terms & Conditions'),
          _buildMenuItem(Icons.privacy_tip_outlined, 'Privacy Policy'),
          const Divider(height: 30),
          _buildMenuItem(Icons.logout, 'Logout', color: Colors.red, isLast: true, onTap: () {
            Navigator.pushReplacementNamed(context, '/login');
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title, {Color? color, bool isLast = false, VoidCallback? onTap}) {
    return ListTile(
      onTap: onTap ?? () {},
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(color: (color ?? const Color(0xFF6229A7)).withOpacity(0.1), borderRadius: BorderRadius.circular(12)),
        child: Icon(icon, color: color ?? const Color(0xFF6229A7)),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold, color: color ?? Colors.black87)),
      trailing: isLast ? null : const Icon(Icons.chevron_right, color: Colors.grey),
    );
  }
}
