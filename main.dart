import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

// Root widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'S.Rocks Music',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(useMaterial3: true),
      home: MusicHomeScreen(),
    );
  }
}

// Data Model
class MusicService {
  final String title;
  final String description;
  final IconData icon;

  MusicService({
    required this.title,
    required this.description,
    required this.icon,
  });
}

// Main Screen
class MusicHomeScreen extends StatefulWidget {
  @override
  State<MusicHomeScreen> createState() => _MusicHomeScreenState();
}

class _MusicHomeScreenState extends State<MusicHomeScreen> {
  int selectedIndex = 0;

  final List<MusicService> serviceList = [
    MusicService(
      title: "Music Production",
      description: "Custom instrumentals & film scoring",
      icon: Icons.music_note,
    ),
    MusicService(
      title: "Mixing & Mastering",
      description: "Make your tracks Radio-ready",
      icon: Icons.headphones,
    ),
    MusicService(
      title: "Lyrics Writing",
      description: "Turn feelings into lyrics",
      icon: Icons.edit,
    ),
    MusicService(
      title: "Vocals",
      description: "Vocals that bring your lyrics to life",
      icon: Icons.mic,
    ),
  ];

  void showServiceDialog(String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("You tapped on"),
        content: Text(title),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  Widget buildServiceCard(MusicService service) {
    return GestureDetector(
      onTap: () => showServiceDialog(service.title),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        decoration: BoxDecoration(
          color: Colors.grey[900],
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(service.icon, size: 30, color: Colors.pinkAccent),
          title: Text(
            service.title,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(service.description),
          trailing: Icon(Icons.arrow_forward_ios_rounded, size: 18),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (i) => setState(() => selectedIndex = i),
        selectedItemColor: Colors.pinkAccent,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper), label: 'News'),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'TrackBox',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.work), label: 'Projects'),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            // Search bar + avatar
            Row(
              children: [
                Expanded(
                  child: TextField(
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      hintText: "Search 'Punjabi Lyrics'",
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      filled: true,
                      fillColor: Colors.grey[850],
                      contentPadding: EdgeInsets.symmetric(horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 12),
                CircleAvatar(
                  backgroundColor: Colors.pinkAccent,
                  child: Icon(Icons.person, color: Colors.white),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Gradient banner
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [Colors.pinkAccent, Colors.redAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Claim your", style: TextStyle(fontSize: 20)),
                  Text(
                    "Free Demo",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "for custom Music Production",
                    style: TextStyle(fontSize: 14),
                  ),
                  SizedBox(height: 12),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      shape: StadiumBorder(),
                    ),
                    child: Text("Book Now"),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30),

            // Section heading
            Text(
              "Hire hand-picked Pros for popular music services",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            SizedBox(height: 16),

            // List of services
            Column(children: serviceList.map(buildServiceCard).toList()),
          ],
        ),
      ),
    );
  }
}
