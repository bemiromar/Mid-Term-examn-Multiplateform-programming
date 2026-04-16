import 'package:flutter/material.dart';

void main() {
  runApp(const EcoCityApp());
}

class EcoCityApp extends StatelessWidget {
  const EcoCityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoCity Dashboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.black))
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,
        textTheme: TextTheme(bodyLarge: TextStyle(color: Colors.white))
      ),
      home: const MainScaffold(),
    );
  }
}

class MainScaffold extends StatefulWidget {
  const MainScaffold({super.key});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Home(),
    Page2(),
    Page3(),
  ];

  final List<String> _titles = [
    'EcoCity Dashboard',
    'Statistiques',
    'Paramètres',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D1F0F),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D1F0F),
        title: Text(
          _titles[_currentIndex],
          style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: const Color(0xFF1A2E1C),
        selectedItemColor: Colors.lightGreen,
        unselectedItemColor: Colors.white38,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Paramètres'),
        ],
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Center(
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.lightGreen.withOpacity(0.15),
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.lightGreen, width: 2),
                ),
                child: const Center(
                  child: Text('🌱', style: TextStyle(fontSize: 44)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            const Center(
              child: Text(
                'EcoCity Dashboard',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 8),
            const Center(
              child: Text(
                'Smart Energy, Smarter Cities',
                style: TextStyle(fontSize: 14, color: Colors.white60),
              ),
            ),
            const SizedBox(height: 48),
            const Text(
              'Vue Globale',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            _buildEnergyCard('⚡', 'Électricité', '342 kWh', 0.68),
            const SizedBox(height: 12),
            _buildEnergyCard('💧', 'Eau', '128 L', 0.64),
            const SizedBox(height: 12),
            _buildEnergyCard('☀️', 'Solaire', '87 kWh', 0.58),
            const SizedBox(height: 12),
            _buildEnergyCard('🌿', 'CO₂', '210 kg', 0.52),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyCard(String icon, String label, String value, double percent) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A2E1C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.lightGreen.withOpacity(0.25)),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(color: Colors.white, fontSize: 14)),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: percent,
                  backgroundColor: Colors.lightGreen.withOpacity(0.15),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.lightGreen),
                  minHeight: 6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: const TextStyle(
              color: Colors.lightGreen,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Statistiques', style: TextStyle(color: Colors.white)),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page Paramètres', style: TextStyle(color: Colors.white)),
    );
  }
}