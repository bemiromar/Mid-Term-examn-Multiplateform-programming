import 'package:flutter/material.dart';

void main() {
  runApp(const EcoCityApp());
}

class EcoCityApp extends StatefulWidget {
  const EcoCityApp({super.key});

  static _EcoCityAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_EcoCityAppState>()!;

  @override
  State<EcoCityApp> createState() => _EcoCityAppState();
}

class _EcoCityAppState extends State<EcoCityApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  bool get isDark => _themeMode == ThemeMode.dark;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EcoCity Dashboard',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: const Color(0xFFF1F8E9),
        cardColor: const Color(0xFFE8F5E9),
        colorScheme: const ColorScheme.light(
          primary: Colors.lightGreen,
          secondary: Color(0xFF4CAF50),
          surface: Color(0xFFE8F5E9),
          onPrimary: Colors.white,
          onSurface: Colors.black87,
          tertiary: Color.fromARGB(255, 80, 80, 80)
        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.black87),
          bodyMedium: TextStyle(fontSize: 13, color: Colors.black54),
          titleLarge: TextStyle(fontSize: 22, color: Colors.black87, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.w600),
          labelSmall: TextStyle(fontSize: 11, color: Colors.black45),
          labelMedium: TextStyle(fontSize: 13, color: Colors.black54),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightGreen,
        scaffoldBackgroundColor: const Color(0xFF0D1F0F),
        cardColor: const Color(0xFF1A2E1C),
        colorScheme: const ColorScheme.dark(
          primary: Colors.lightGreen,
          secondary: Color(0xFF4CAF50),
          surface: Color(0xFF1A2E1C),
          onPrimary: Colors.white,
          onSurface: Colors.white,
          tertiary: Color.fromARGB(255, 169, 169, 169)

        ),
        textTheme: const TextTheme(
          bodyLarge: TextStyle(fontSize: 14, color: Colors.white),
          bodyMedium: TextStyle(fontSize: 13, color: Colors.white70),
          titleLarge: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.bold),
          titleMedium: TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w600),
          labelSmall: TextStyle(fontSize: 11, color: Colors.white60),
          labelMedium: TextStyle(fontSize: 13, color: Colors.white70),
        ),
      ),
      themeMode: _themeMode,
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
    'Statistics',
    'Settings',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      body: isWide
          ? Row(
              children: [
                NavigationRail(
                  backgroundColor: theme.cardColor,
                  selectedIndex: _currentIndex,
                  onDestinationSelected: (index) {
                    setState(() => _currentIndex = index);
                  },
                  selectedIconTheme: IconThemeData(color: theme.colorScheme.primary),
                  unselectedIconTheme: IconThemeData(color: theme.colorScheme.tertiary),
                  selectedLabelTextStyle: TextStyle(color: theme.colorScheme.primary),
                  unselectedLabelTextStyle: TextStyle(color: theme.colorScheme.tertiary),
                  labelType: NavigationRailLabelType.all,
                  destinations: const [
                    NavigationRailDestination(icon: Icon(Icons.dashboard), label: Text('Homepage')),
                    NavigationRailDestination(icon: Icon(Icons.bar_chart), label: Text('Stats')),
                    NavigationRailDestination(icon: Icon(Icons.settings), label: Text('Settings')),
                  ],
                ),
                const VerticalDivider(color: Colors.white12, width: 1),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        _titles[_currentIndex],
                        style: TextStyle(
                          color: theme.colorScheme.onSurface,
                          fontWeight: FontWeight.bold,
                          fontSize: isWide ? 28 : 20,
                        ),
                      ),
                      Expanded(child: _pages[_currentIndex]),
                    ],
                  ),
                ),
              ],
            )
          : _pages[_currentIndex],
      bottomNavigationBar: isWide
          ? null
          : BottomNavigationBar(
              currentIndex: _currentIndex,
              backgroundColor: theme.cardColor,
              selectedItemColor: theme.colorScheme.primary,
              unselectedItemColor: Colors.white38,
              onTap: (index) {
                setState(() => _currentIndex = index);
              },
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'Homepage'),
                BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Stats'),
                BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
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
    final theme = Theme.of(context);

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
                  color: theme.colorScheme.primary.withValues(alpha:0.2),
                  shape: BoxShape.circle,
                  border: Border.all(color: theme.colorScheme.primary, width: 2),
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
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: Text(
                'Smart Energy, Smarter Cities',
                style: theme.textTheme.bodyLarge,
              ),
            ),
            const SizedBox(height: 24),
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                'https://images.unsplash.com/photo-1477959858617-67f85cf4f1df?w=800',
                height: 180,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 40),
            Text('Global view', style: theme.textTheme.titleMedium),
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
                      _buildEnergyCard(context, '⚡', 'Electricity', '342 kWh', 0.68),
                      _buildEnergyCard(context, '💧', 'Water', '128 L', 0.64),
                      _buildEnergyCard(context, '☀️', 'Solar', '87 kWh', 0.58),
                      _buildEnergyCard(context, '🌿', 'CO₂', '210 kg', 0.52),
                    ],
                  )
                : Column(
                    children: [
                      _buildEnergyCard(context, '⚡', 'Electricity', '342 kWh', 0.68),
                      const SizedBox(height: 12),
                      _buildEnergyCard(context, '💧', 'Water', '128 L', 0.64),
                      const SizedBox(height: 12),
                      _buildEnergyCard(context, '☀️', 'Solar', '87 kWh', 0.58),
                      const SizedBox(height: 12),
                      _buildEnergyCard(context, '🌿', 'CO₂', '210 kg', 0.52),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnergyCard(BuildContext context, String icon, String label, String value, double percent) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha:0.25)),
      ),
      child: Row(
        children: [
          Text(icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 6),
                LinearProgressIndicator(
                  value: percent,
                  backgroundColor: theme.colorScheme.primary.withValues(alpha:0.15),
                  valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                  minHeight: 6,
                ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Text(
            value,
            style: TextStyle(
              color: theme.colorScheme.primary,
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
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final padding = isWide ? 48.0 : 24.0;
    final theme = Theme.of(context);

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Summary of the month', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('April 2026', style: theme.textTheme.bodyLarge),
            const SizedBox(height: 24),
            GridView.count(
              crossAxisCount: isWide ? 4 : 2,
              shrinkWrap: true,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.1,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                _buildStatCard(context, '⚡', 'Consumption', '342 kWh', Colors.lightGreen),
                _buildStatCard(context, '☀️', 'Solar', '87 kWh', Colors.amber),
                _buildStatCard(context, '🌿', 'CO₂ avoids', '42 kg', Colors.greenAccent),
                _buildStatCard(context, '💰', 'Economies', '28 €', Colors.tealAccent),
              ],
            ),
            const SizedBox(height: 32),
            Text('Consumption by category', style: theme.textTheme.titleMedium),
            const SizedBox(height: 16),
            _buildBarRow(context, '⚡ Electricity', 0.68),
            const SizedBox(height: 12),
            _buildBarRow(context, '💧 Water', 0.64),
            const SizedBox(height: 12),
            _buildBarRow(context, '☀️ Solar', 0.58),
            const SizedBox(height: 12),
            _buildBarRow(context, '🌿 CO₂', 0.52),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(BuildContext context, String icon, String label, String value, Color color) {
    final theme = Theme.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: color.withValues(alpha:0.3)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(icon, style: const TextStyle(fontSize: 28)),
          const SizedBox(height: 8),
          Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
          const SizedBox(height: 4),
          Text(label, textAlign: TextAlign.center, style: theme.textTheme.labelSmall),
        ],
      ),
    );
  }

  Widget _buildBarRow(BuildContext context, String label, double percent) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.labelMedium),
        const SizedBox(height: 6),
        Row(
          children: [
            Expanded(
              child: LinearProgressIndicator(
                value: percent,
                backgroundColor: theme.colorScheme.primary.withValues(alpha:0.15),
                valueColor: AlwaysStoppedAnimation<Color>(theme.colorScheme.primary),
                minHeight: 8,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              '${(percent * 100).toInt()}%',
              style: TextStyle(
                color: theme.colorScheme.primary,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWide = screenWidth > 600;
    final padding = isWide ? 48.0 : 24.0;
    final theme = Theme.of(context);
    final isDark = EcoCityApp.of(context).isDark;

    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 24),
            Text('Settings', style: theme.textTheme.titleLarge),
            const SizedBox(height: 8),
            Text('Manage your preferences', style: theme.textTheme.bodyLarge),
            const SizedBox(height: 32),
            _buildSectionTitle(context, 'Account'),
            const SizedBox(height: 12),
            _buildSettingItem(context, Icons.person_outline, 'Profile', 'Edit your personal info'),
            _buildSettingItem(context, Icons.notifications_outlined, 'Notifications', 'Manage alerts'),
            _buildSettingItem(context, Icons.language, 'Language', 'English'),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'Energy Preferences'),
            const SizedBox(height: 12),
            _buildSettingItem(context, Icons.solar_power, 'Solar Target', '150 kWh / month'),
            _buildSettingItem(context, Icons.water_drop_outlined, 'Water Limit', '200 L / day'),
            _buildSettingItem(context, Icons.co2, 'CO₂ Alert', '400 kg threshold'),
            const SizedBox(height: 24),
            _buildSectionTitle(context, 'App'),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              decoration: BoxDecoration(
                color: theme.cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: theme.colorScheme.primary.withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.dark_mode_outlined, color: theme.colorScheme.primary, size: 22),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text('Dark Mode', style: theme.textTheme.bodyLarge),
                  ),
                  Switch(
                    value: isDark,
                    activeThumbColor: theme.colorScheme.primary,
                    onChanged: (_) => EcoCityApp.of(context).toggleTheme(),
                  ),
                ],
              ),
            ),
            _buildSettingItem(context, Icons.info_outline, 'About', 'EcoCity v1.0.0'),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w600,
        color: theme.colorScheme.primary,
        letterSpacing: 1.2,
      ),
    );
  }

  Widget _buildSettingItem(BuildContext context, IconData icon, String title, String subtitle) {
    final theme = Theme.of(context);
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: theme.colorScheme.primary.withValues(alpha:0.3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: theme.colorScheme.primary, size: 22),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: theme.textTheme.bodyLarge),
                const SizedBox(height: 2),
                Text(subtitle, style: theme.textTheme.labelMedium),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: theme.colorScheme.onSurface.withValues(alpha: 0.3), size: 20),
        ],
      ),
    );
  }
}