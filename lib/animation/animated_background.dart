import 'dart:math';
import 'package:flutter/material.dart';
import 'package:practice_web/utils/constants.dart';

class AnimatedBackground extends StatefulWidget {
  const AnimatedBackground({super.key});

  @override
  State<AnimatedBackground> createState() => _AnimatedBackgroundState();
}

class _AnimatedBackgroundState extends State<AnimatedBackground>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  
  // Layered particles for parallax depth
  late List<Particle> _backgroundLayer;
  late List<Particle> _midgroundLayer;
  late List<Particle> _foregroundLayer;
  late List<Nebula> _nebulae;
  late List<RainbowWave> _waves;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    )..repeat();

    _initializeParticles();
  }

  void _initializeParticles() {
    _backgroundLayer = List.generate(40, (_) => Particle(depth: 0.3));
    _midgroundLayer = List.generate(25, (_) => Particle(depth: 0.6));
    _foregroundLayer = List.generate(15, (_) => Particle(depth: 1.0));
    _nebulae = List.generate(4, (_) => Nebula());
    _waves = List.generate(3, (index) => RainbowWave(index: index));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: DeepSpacePainter(
            background: _backgroundLayer,
            midground: _midgroundLayer,
            foreground: _foregroundLayer,
            nebulae: _nebulae,
            waves: _waves,
            time: _controller.value,
          ),
          child: Container(),
        );
      },
    );
  }
}

class Particle {
  double x = Random().nextDouble();
  double y = Random().nextDouble();
  final double depth;
  late double size;
  late double speedX;
  late double speedY;
  double opacity = Random().nextDouble();
  bool growing = Random().nextBool();
  final double pulseSpeed = Random().nextDouble() * 0.015 + 0.005;

  Particle({required this.depth}) {
    size = (Random().nextDouble() * 2.0 + 0.5) * depth;
    speedX = (Random().nextDouble() - 0.5) * 0.0006 * depth;
    speedY = (Random().nextDouble() - 0.5) * 0.0006 * depth;
  }

  void update() {
    x += speedX;
    y += speedY;

    if (x < -0.1) x = 1.1;
    if (x > 1.1) x = -0.1;
    if (y < -0.1) y = 1.1;
    if (y > 1.1) y = -0.1;

    // Natural Twinkle
    if (growing) {
      opacity += pulseSpeed;
      if (opacity >= 0.8) growing = false;
    } else {
      opacity -= pulseSpeed;
      if (opacity <= 0.1) growing = true;
    }
  }
}

class Nebula {
  double x = Random().nextDouble();
  double y = Random().nextDouble();
  double speedX = (Random().nextDouble() - 0.5) * 0.0002;
  double speedY = (Random().nextDouble() - 0.5) * 0.0002;
  double radius = 300 + Random().nextDouble() * 400;
  Color color = [AppColors.primary, AppColors.secondary, AppColors.accent][Random().nextInt(3)];

  void update() {
    x += speedX;
    y += speedY;
    if (x < -0.5) x = 1.5;
    if (x > 1.5) x = -0.5;
    if (y < -0.5) y = 1.5;
    if (y > 1.5) y = -0.5;
  }
}

class RainbowWave {
  final int index;
  double phase = Random().nextDouble() * pi * 2;
  final double speed = 0.002 + Random().nextDouble() * 0.003;
  final double amplitude = 50 + Random().nextDouble() * 100;
  final double frequency = 0.001 + Random().nextDouble() * 0.002;

  RainbowWave({required this.index});

  void update() {
    phase += speed;
  }
}

class DeepSpacePainter extends CustomPainter {
  final List<Particle> background;
  final List<Particle> midground;
  final List<Particle> foreground;
  final List<Nebula> nebulae;
  final List<RainbowWave> waves;
  final double time;

  DeepSpacePainter({
    required this.background,
    required this.midground,
    required this.foreground,
    required this.nebulae,
    required this.waves,
    required this.time,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // 0. Render Rainbow Waves (Aurora effect)
    for (var wave in waves) {
      wave.update();
      _drawRainbowWave(canvas, size, wave);
    }

    // 1. Render Nebulae with Screen Blending for organic light mixing
    for (var nebula in nebulae) {
      nebula.update();
      final center = Offset(nebula.x * size.width, nebula.y * size.height);
      
      final nebulaPaint = Paint()
        ..shader = RadialGradient(
          colors: [
            nebula.color.withValues(alpha: 0.12),
            nebula.color.withValues(alpha: 0.04),
            Colors.transparent,
          ],
          stops: const [0.0, 0.5, 1.0],
        ).createShader(Rect.fromCircle(center: center, radius: nebula.radius))
        ..blendMode = BlendMode.screen;

      canvas.drawCircle(center, nebula.radius, nebulaPaint);
    }

    // 2. Render Particles & Connections by Layer (Parallax)
    _drawLayer(canvas, size, background, 120, 0.08); // Far layer
    _drawLayer(canvas, size, midground, 160, 0.15);  // Mid layer
    _drawLayer(canvas, size, foreground, 200, 0.25); // Near layer
  }

  void _drawRainbowWave(Canvas canvas, Size size, RainbowWave wave) {
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0
      ..blendMode = BlendMode.screen;

    final path = Path();
    final yOffset = size.height * (0.3 + wave.index * 0.2);

    for (double x = 0; x <= size.width; x += 10) {
      final y = yOffset + sin(x * wave.frequency + wave.phase) * wave.amplitude;
      if (x == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    final colors = [
      Colors.red.withValues(alpha: 0.1),
      Colors.orange.withValues(alpha: 0.1),
      Colors.yellow.withValues(alpha: 0.1),
      Colors.green.withValues(alpha: 0.1),
      Colors.blue.withValues(alpha: 0.1),
      Colors.indigo.withValues(alpha: 0.1),
      Colors.purple.withValues(alpha: 0.1),
    ];

    // Draw multiple offset paths for a "rainbow band" effect
    for (int i = 0; i < colors.length; i++) {
      paint.color = colors[i];
      final offsetPath = Path();
      offsetPath.addPath(path, Offset(0, i * 8.0));
      canvas.drawPath(offsetPath, paint);
    }
  }

  void _drawLayer(Canvas canvas, Size size, List<Particle> particles, double maxDistance, double baseLineAlpha) {
    final linePaint = Paint()..style = PaintingStyle.stroke;
    
    // Draw Connections first (below particles)
    for (int i = 0; i < particles.length; i++) {
      for (int j = i + 1; j < particles.length; j++) {
        final p1 = particles[i];
        final p2 = particles[j];
        
        final dx = (p1.x - p2.x) * size.width;
        final dy = (p1.y - p2.y) * size.height;
        final distance = sqrt(dx * dx + dy * dy);

        if (distance < maxDistance) {
          final opacity = (1.0 - distance / maxDistance) * baseLineAlpha;
          final pos1 = Offset(p1.x * size.width, p1.y * size.height);
          final pos2 = Offset(p2.x * size.width, p2.y * size.height);

          linePaint
            ..strokeWidth = (1.0 - distance / maxDistance) * 1.2
            ..shader = LinearGradient(
              colors: [
                AppColors.primary.withValues(alpha: opacity),
                AppColors.accent.withValues(alpha: opacity * 0.6),
              ],
            ).createShader(Rect.fromPoints(pos1, pos2));

          canvas.drawLine(pos1, pos2, linePaint);
        }
      }
    }

    // Draw Particles
    for (var particle in particles) {
      particle.update();
      final center = Offset(particle.x * size.width, particle.y * size.height);
      
      // Core Star
      final starPaint = Paint()
        ..color = Colors.white.withValues(alpha: particle.opacity)
        ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 0.5);
      
      canvas.drawCircle(center, particle.size, starPaint);

      // Outer Glow
      if (particle.depth > 0.5) {
        final glowPaint = Paint()
          ..color = AppColors.accent.withValues(alpha: particle.opacity * 0.3)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 3);
        canvas.drawCircle(center, particle.size * 2.5, glowPaint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant DeepSpacePainter oldDelegate) => true;
}
