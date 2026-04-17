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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;

    return Scaffold(
      backgroundColor: const Color(0xFF0D1F0F),
      body: isWide
          ? Row(
              children: [
                NavigationRail(
                  backgroundColor: const Color(0xFF1A2E1C),
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (index) {
                    setState(() => _currentIndex = index);
                  },
                  selectedIconTheme: const IconThemeData(color: Colors.lightGreen),
                  unselectedIconTheme: const IconThemeData(color: Colors.white38),
                  selectedLabelTextStyle: const TextStyle(color: Colors.lightGreen),
                  unselectedLabelTextStyle: const TextStyle(color: Colors.white38),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Accueil')),
                    NavigationRailDestination(icon: Icon(Icons.bar_chart), label: Text('Stats')),
                    NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Paramètres')),
                  ],
                ),
                const VerticalDivider(color: Colors.white12, width: 1),
                Expanded(child: Column(
                  children: [
                 Text(
  _titles[_currentIndex],
  style: TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.bold,
    fontSize: MediaQuery.of(context).size.width > 600 ? 28 : 20,
  ),
),
                    _pages[_currentIndex],
                  ],
                )),
              ],
            )
          : _pages[_currentIndex],
      bottomNavigationBar: isWide
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: const Color(0xFF1A2E1C),
              selectedItemColor: Colors.lightGreen,
              unselectedItemColor: Colors.white38,
              onTap: (index) {
                setState(() => _currentIndex = index);
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final padding = isWide ? 48.0 : 24.0;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Center(
              child: Container(
                width: isWide ? 120 : 90,
                height: isWide ? 120 : 90,
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.lightGreen, width: 2),
                ),
                child: Center(
                  child: Text('🌱', style: TextStyle(fontSize: isWide ? 60 : 44)),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: Text(
                'EcoCity Dashboard',
                style: TextStyle(
                  fontSize: isWide ? 36 : 28,
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
            const SizedBox(height: 40),
            const Text(
              'Vue Globale',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 16),
            isWide
                ? GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 3.5,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      _buildEnergyCard('⚡', 'Électricité', '342 kWh', 0.68),
                      _buildEnergyCard('💧', 'Eau', '128 L', 0.64),
                      _buildEnergyCard('☀️', 'Solaire', '87 kWh', 0.58),
                      _buildEnergyCard('🌿', 'CO₂', '210 kg', 0.52),
                    ],
                  )
                : Column(
                    children: [
                      _buildEnergyCard('⚡', 'Électricité', '342 kWh', 0.68),
                      const SizedBox(height: 12),
                      _buildEnergyCard('💧', 'Eau', '128 L', 0.64),
                      const SizedBox(height: 12),
                      _buildEnergyCard('☀️', 'Solaire', '87 kWh', 0.58),
                      const SizedBox(height: 12),
                      _buildEnergyCard('🌿', 'CO₂', '210 kg', 0.52),
                    ],
                  ),
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