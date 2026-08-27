import 'package:flutter/material.dart';

class Skin8Shell extends StatelessWidget {
  const Skin8Shell({
    super.key,
    required this.child,
    this.selectedIndex = 0,
  });

  final Widget child;
  final int selectedIndex;

  static const Color bg = Color(0xFF050A14);
  static const Color panel = Color(0xFF0B1220);
  static const Color cyan = Color(0xFF08C7E8);
  static const Color muted = Color(0xFF8492A8);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        child: Column(
          children: [
            _header(),
            _tabs(),
            Expanded(child: child),
            _bottomBar(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: cyan,
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.mic, color: Colors.white),
            Text(
              'VOICE',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _header() {
    return Container(
      color: bg,
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 14),
      child: Row(
        children: [
          Container(
            width: 54,
            height: 54,
            decoration: BoxDecoration(
              color: cyan,
              borderRadius: BorderRadius.circular(14),
            ),
            child: const Center(
              child: Text(
                '⚡',
                style: TextStyle(fontSize: 28),
              ),
            ),
          ),
          const SizedBox(width: 14),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'SATHI',
                      style: TextStyle(
                        color: cyan,
                        fontSize: 30,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(width: 12),
                    _SmartBadge(),
                  ],
                ),
                SizedBox(height: 3),
                Text(
                  'Smart & Goods',
                  style: TextStyle(
                    color: muted,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  'Calculator',
                  style: TextStyle(
                    color: muted,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const Text(
            'DEG',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 12),
          _headerIcon(Icons.volume_up_outlined),
          const SizedBox(width: 8),
          _headerIcon(Icons.light_mode_outlined),
        ],
      ),
    );
  }

  Widget _headerIcon(IconData icon) {
    return Container(
      width: 54,
      height: 54,
      decoration: BoxDecoration(
        color: panel,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFF1B2B40)),
      ),
      child: Icon(icon, color: cyan, size: 27),
    );
  }

  Widget _tabs() {
    const labels = [
      'CALCULATOR',
      'SCIENTIFIC',
      'GOODS / MATERIAL',
      'HISTORY',
      'SETTINGS',
    ];

    const icons = [
      Icons.calculate_outlined,
      Icons.science_outlined,
      Icons.inventory_2_outlined,
      Icons.history,
      Icons.settings_outlined,
    ];

    return Container(
      height: 74,
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xFF18263A)),
          bottom: BorderSide(color: Color(0xFF18263A)),
        ),
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: labels.length,
        itemBuilder: (context, index) {
          final selected = index == selectedIndex;

          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 7,
              vertical: 12,
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              decoration: BoxDecoration(
                color: selected ? cyan : Colors.transparent,
                borderRadius: BorderRadius.circular(24),
                boxShadow: selected
                    ? const [
                        BoxShadow(
                          color: Color(0x6608C7E8),
                          blurRadius: 18,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Icon(
                    icons[index],
                    color: selected ? Colors.black : muted,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    labels[index],
                    style: TextStyle(
                      color: selected ? Colors.black : muted,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _bottomBar() {
    return Container(
      height: 64,
      decoration: const BoxDecoration(
        color: Color(0xFF111111),
      ),
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Icon(Icons.home_outlined, color: Colors.white, size: 30),
          Icon(Icons.bookmark_border, color: Colors.white, size: 30),
          Icon(Icons.search, color: Colors.white, size: 32),
          Icon(Icons.calendar_month_outlined, color: Colors.white, size: 30),
          Icon(Icons.more_vert, color: Colors.white, size: 32),
        ],
      ),
    );
  }
}

class _SmartBadge extends StatelessWidget {
  const _SmartBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: const Color(0xFF17263A),
        borderRadius: BorderRadius.circular(5),
      ),
      child: const Text(
        '✧ SMART',
        style: TextStyle(
          color: Color(0xFF4DB8E8),
          fontWeight: FontWeight.bold,
          fontSize: 13,
        ),
      ),
    );
  }
}
