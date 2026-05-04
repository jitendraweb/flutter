import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

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
                'Messages',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.grey[200]!),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: 'Search Services Or Experts',
                    border: InputBorder.none,
                    icon: Icon(Icons.search, color: Colors.grey),
                    suffixIcon: Icon(Icons.tune, color: Colors.black87),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemCount: 4,
                separatorBuilder: (context, index) => Divider(height: 1, color: Colors.grey[100], indent: 80),
                itemBuilder: (context, index) {
                  List<Map<String, String>> chats = [
                    {'name': 'Dr. Anjali Mehra', 'msg': 'Please Continue The Medication For 5 More...', 'time': '8:15 PM'},
                    {'name': 'Adv. Meera Kapoor', 'msg': 'Lorem Ipsum Dolor Sit Amet, Consectetur Ad...', 'time': '8:15 PM'},
                    {'name': 'Albin Thomas', 'msg': 'Donec A Eros Justo. Fusce Egestas Tristique...', 'time': '8:15 PM'},
                    {'name': 'CA Arvind Menon', 'msg': 'Fusce Volutpat Lectus Et Nisl Consectetur Fl...', 'time': '8:15 PM'},
                  ];
                  return ListTile(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    leading: CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey[200],
                      child: const Icon(Icons.person, color: Colors.grey),
                    ),
                    title: Text(chats[index]['name']!, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(chats[index]['msg']!, maxLines: 1, overflow: TextOverflow.ellipsis, style: const TextStyle(color: Colors.grey, fontSize: 13)),
                    trailing: Text(chats[index]['time']!, style: const TextStyle(color: Colors.grey, fontSize: 12)),
                    onTap: () => Navigator.pushNamed(context, '/chat_detail', arguments: chats[index]['name']),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
