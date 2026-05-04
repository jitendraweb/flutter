import 'package:flutter/material.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({super.key});

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  String _selectedTime = '10.00 AM';
  DateTime _selectedDate = DateTime(2023, 6, 30);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: const Color(0xFF6229A7),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Book Appointment', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        // Adding the grid pattern decoration in the background of the appbar
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://www.transparenttextures.com/patterns/cubes.png'),
              opacity: 0.1,
              repeat: ImageRepeat.repeat,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Select Date', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
            const SizedBox(height: 15),
            _buildCalendar(),
            const SizedBox(height: 30),
            const Text('Select Hour', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
            const SizedBox(height: 15),
            _buildTimeGrid(),
            const SizedBox(height: 30),
            const Text('Notes for the professional (optional)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF6229A7))),
            const SizedBox(height: 10),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(
                hintText: 'Gate code, parking, etc.',
                hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey[200]!)),
                enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15), borderSide: BorderSide(color: Colors.grey[200]!)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildCalendar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, 5))],
      ),
      child: Column(
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('June 2023', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Row(
                children: [
                  Icon(Icons.chevron_left, color: Colors.grey),
                  Icon(Icons.chevron_right, color: Color(0xFF6229A7)),
                ],
              ),
            ],
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat']
                .map((d) => SizedBox(width: 35, child: Center(child: Text(d, style: TextStyle(color: Colors.grey, fontSize: 12, fontWeight: FontWeight.bold)))))
                .toList(),
          ),
          const SizedBox(height: 10),
          _buildCalendarGrid(),
        ],
      ),
    );
  }

  Widget _buildCalendarGrid() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 7, mainAxisSpacing: 10, crossAxisSpacing: 5),
      itemCount: 35,
      itemBuilder: (context, index) {
        int day = index - 3; // Offset for June 2023 starting on Thursday
        if (day < 1 || day > 30) return const SizedBox();
        bool isSelected = day == 30;
        return GestureDetector(
          onTap: () {},
          child: Container(
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF6229A7) : Colors.transparent,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Text(
                '$day',
                style: TextStyle(
                  color: isSelected ? Colors.white : (day % 3 == 0 ? Colors.grey[300] : Colors.black87),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeGrid() {
    List<String> times = [
      '09.00 AM', '09.30 AM', '10.00 AM', 
      '10.30 AM', '11.00 AM', '11.30 AM', 
      '3.00 PM', '3.30 PM', '4.00 PM', 
      '4.30 PM', '5.00 PM', '5.30 PM'
    ];
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      children: times.map((time) {
        bool isSelected = _selectedTime == time;
        bool isDisabled = time == '09.30 AM' || time == '10.30 AM' || time == '3.00 PM' || time == '5.00 PM';
        return GestureDetector(
          onTap: isDisabled ? null : () => setState(() => _selectedTime = time),
          child: Container(
            width: (MediaQuery.of(context).size.width - 70) / 3,
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: BoxDecoration(
              color: isSelected ? const Color(0xFF6229A7) : (isDisabled ? Colors.grey[50] : Colors.grey[100]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                time,
                style: TextStyle(
                  color: isSelected ? Colors.white : (isDisabled ? Colors.grey[300] : Colors.black87),
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10, offset: const Offset(0, -5))],
      ),
      child: SafeArea(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Order Total', style: TextStyle(color: Colors.grey, fontSize: 12)),
                Text('₹439', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF6229A7),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text('Book Now', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
      ),
    );
  }
}
