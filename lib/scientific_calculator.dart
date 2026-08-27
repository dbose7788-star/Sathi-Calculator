import 'dart:math' as math;
import 'package:flutter/material.dart';

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({super.key});

  @override
  State<ScientificCalculator> createState() =>
      _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  String display = '0';
  bool degrees = true;

  double get value => double.tryParse(display) ?? 0;

  void setDisplay(double v) {
    setState(() {
      if (v.isNaN || v.isInfinite) {
        display = 'Error';
      } else {
        display = _format(v);
      }
    });
  }

  String _format(double v) {
    if (v == v.roundToDouble()) return v.toInt().toString();
    return v.toStringAsPrecision(15).replaceFirst(RegExp(r'\.?0+$'), '');
  }

  double _angle(double v) => degrees ? v * math.pi / 180 : v;

  double _fromAngle(double v) => degrees ? v * 180 / math.pi : v;

  void unary(String name) {
    final x = value;

    try {
      switch (name) {
        case 'sin':
          setDisplay(math.sin(_angle(x)));
          break;
        case 'cos':
          setDisplay(math.cos(_angle(x)));
          break;
        case 'tan':
          setDisplay(math.tan(_angle(x)));
          break;
        case 'asin':
          setDisplay(_fromAngle(math.asin(x)));
          break;
        case 'acos':
          setDisplay(_fromAngle(math.acos(x)));
          break;
        case 'atan':
          setDisplay(_fromAngle(math.atan(x)));
          break;
        case 'ln':
          setDisplay(math.log(x));
          break;
        case 'log':
          setDisplay(math.log(x) / math.ln10);
          break;
        case 'sqrt':
          setDisplay(math.sqrt(x));
          break;
        case 'square':
          setDisplay(x * x);
          break;
        case 'inverse':
          if (x == 0) {
            setDisplay(double.nan);
          } else {
            setDisplay(1 / x);
          }
          break;
        case 'factorial':
          if (x < 0 || x != x.floorToDouble() || x > 170) {
            setDisplay(double.nan);
          } else {
            double result = 1;
            for (int i = 2; i <= x.toInt(); i++) {
              result *= i;
            }
            setDisplay(result);
          }
          break;
      }
    } catch (_) {
      setDisplay(double.nan);
    }
  }

  void clear() {
    setState(() => display = '0');
  }

  void backspace() {
    setState(() {
      if (display.length <= 1 || display == 'Error') {
        display = '0';
      } else {
        display = display.substring(0, display.length - 1);
      }
    });
  }

  void input(String text) {
    setState(() {
      if (display == 'Error') {
        display = '0';
      }

      if (text == '.') {
        if (!display.contains('.')) {
          display += '.';
        }
      } else {
        if (display == '0') {
          display = text;
        } else {
          display += text;
        }
      }
    });
  }

  Widget button(
    String text, {
    VoidCallback? onTap,
    bool accent = false,
  }) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: accent
            ? const Color(0xFFDD7700)
            : const Color(0xFF2B2B2B),
        foregroundColor: const Color(0xFFE0C8FF),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF111111),
        foregroundColor: Colors.white,
        title: const Text('Scientific Calculator'),
        actions: [
          TextButton(
            onPressed: () {
              setState(() => degrees = !degrees);
            },
            child: Text(
              degrees ? 'DEG' : 'RAD',
              style: const TextStyle(
                color: Color(0xFFE0C8FF),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(18),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: const Color(0xFF202020),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Text(
                  display,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 36,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 4,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 1.25,
                  children: [
                    button('sin', onTap: () => unary('sin')),
                    button('cos', onTap: () => unary('cos')),
                    button('tan', onTap: () => unary('tan')),
                    button('ln', onTap: () => unary('ln')),

                    button('asin', onTap: () => unary('asin')),
                    button('acos', onTap: () => unary('acos')),
                    button('atan', onTap: () => unary('atan')),
                    button('log', onTap: () => unary('log')),

                    button('√', onTap: () => unary('sqrt')),
                    button('x²', onTap: () => unary('square')),
                    button('1/x', onTap: () => unary('inverse')),
                    button('xʸ', onTap: () {
                      // Power operation will be added to the
                      // expression engine in the next step.
                    }),

                    button('π', onTap: () => setDisplay(math.pi)),
                    button('e', onTap: () => setDisplay(math.e)),
                    button('n!', onTap: () => unary('factorial')),
                    button('⌫', onTap: backspace),

                    button('C', onTap: clear, accent: true),
                    button('7', onTap: () => input('7')),
                    button('8', onTap: () => input('8')),
                    button('9', onTap: () => input('9')),

                    button('4', onTap: () => input('4')),
                    button('5', onTap: () => input('5')),
                    button('6', onTap: () => input('6')),
                    button('3', onTap: () => input('3')),

                    button('1', onTap: () => input('1')),
                    button('2', onTap: () => input('2')),
                    button('0', onTap: () => input('0')),
                    button('.', onTap: () => input('.')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
