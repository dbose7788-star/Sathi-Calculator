import 'package:flutter/material.dart';
import 'scientific_calculator.dart';
import 'screens/history_screen.dart';
import 'screens/settings_screen.dart';
import 'goods_calculator.dart';

class SathiHome extends StatelessWidget {
  const SathiHome({
    super.key,
    required this.normalScreen,
  });

  final Widget normalScreen;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF050B12),
      appBar: AppBar(
        backgroundColor: const Color(0xFF07131D),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'SATHI',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF07131D),
              Color(0xFF050B12),
            ],
          ),
        ),
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
          _item(
            context,
            'Normal Calculator',
            Icons.calculate,
            () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => normalScreen),
            ),
          ),
          _item(
            context,
            'Scientific Calculator',
            Icons.science,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const ScientificCalculator(),
              ),
            ),
          ),
          _item(
            context,
            'Goods / Material Calculator',
            Icons.inventory_2,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const GoodsCalculator(),
              ),
            ),
          ),
          _item(
            context,
            'History',
            Icons.history,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const HistoryScreen(),
              ),
            ),
          ),
          _item(
            context,
            'Settings',
            Icons.settings_outlined,
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const SettingsScreen(),
              ),
            ),
          ),
          ],
        ),
      ),
    );
  }

  Widget _item(
    BuildContext context,
    String title,
    IconData icon,
    VoidCallback onTap,
  ) {
    return Card(
      color: const Color(0xFF0B1822),
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: const BorderSide(
          color: Color(0xFF17303D),
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: Row(
            children: [
              Container(
                width: 46,
                height: 46,
                decoration: BoxDecoration(
                  color: const Color(0xFF07131D),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(
                  icon,
                  color: const Color(0xFF00E5FF),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.chevron_right,
                color: Color(0xFF78909C),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
