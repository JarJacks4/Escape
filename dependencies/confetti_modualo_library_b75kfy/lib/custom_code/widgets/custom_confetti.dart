// Automatic FlutterFlow imports
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'index.dart'; // Imports other custom widgets

import 'dart:async';
import 'dart:math';
import 'dart:ui';
import 'package:vector_math/vector_math.dart' as vmath;

// Initialize StreamController to manage the confetti events
final StreamController<List<String>> notifiedStream =
    StreamController<List<String>>.broadcast();

List<String> controllerIds = [];

Future<void> start(String id) async {
  if (!notifiedStream.isClosed) {
    controllerIds.add(id);
    notifiedStream.sink.add(controllerIds);
  }
}

Future<void> stop(String id) async {
  if (!notifiedStream.isClosed) {
    controllerIds.remove(id);
    notifiedStream.sink.add(controllerIds);
  }
}

class CustomConfetti extends StatefulWidget {
  const CustomConfetti({
    super.key,
    this.width,
    this.height,
    required this.id,
    required this.degree,
    this.isExplosion,
    this.gravity,
    this.emissionFrequency,
    this.duration,
    this.particleDrag = 0.05,
    this.shape,
    this.numberOfParticles,
    this.displayTarget,
    this.shouldLoop,
    this.colors,
  });

  final double? width;
  final double? height;
  final String id;
  final int degree;
  final bool? isExplosion;
  final double? gravity;
  final double? emissionFrequency;
  final int? duration;
  final double? particleDrag;
  final int? shape;
  final int? numberOfParticles;
  final bool? displayTarget;
  final bool? shouldLoop;
  final List<Color>? colors;

  @override
  State<CustomConfetti> createState() => _CustomConfettiState();
}

class _CustomConfettiState extends State<CustomConfetti> {
  ConfettiController? controller;
  double? direction;
  Timer? timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (timeStamp) => setState(() {
        controller = ConfettiController(
            duration: Duration(seconds: widget.duration ?? 3));
      }),
    );
    notifiedStream.stream.listen((event) {
      if (event.contains(widget.id)) {
        if (!(widget.shouldLoop ?? false)) {
          timer = Timer(Duration(seconds: widget.duration ?? 3), () {
            stop(widget.id);
          });
        }
        controller?.play();
      } else {
        controller?.stop();
        timer?.cancel();
      }
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    controller = null;
    super.dispose();
  }

  double _degreesToRadians(int degrees) {
    return degrees * (pi / 180);
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return const SizedBox.shrink();
    return ConfettiWidget(
      key: Key(
          '${widget.isExplosion}${widget.degree}${widget.gravity}${widget.emissionFrequency}${widget.shape}${widget.numberOfParticles}${widget.particleDrag}${widget.shouldLoop}${widget.colors}'),
      confettiController: controller!,
      blastDirectionality: (widget.isExplosion ?? true)
          ? BlastDirectionality.directional
          : BlastDirectionality.explosive,
      blastDirection: _degreesToRadians(widget.degree.clamp(0, 360)),
      gravity: (widget.gravity ?? 0.1).clamp(0, 1),
      emissionFrequency: (widget.emissionFrequency ?? 0.02).clamp(0, 1),
      createParticlePath: widget.shape == null
          ? null
          : (size) {
              switch (widget.shape) {
                case 0: // Right Triangle
                  return Path()
                    ..moveTo(size.width / 2, 0)
                    ..lineTo(size.width / 2, size.height)
                    ..lineTo(0, size.height / 2)
                    ..close();
                case 1: // Square
                  return Path()
                    ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));
                case 2: // Circle
                  return Path()
                    ..addOval(Rect.fromCircle(
                        center: Offset(size.width / 2, size.height / 2),
                        radius: size.width / 2));
                case 3: // Pentagon
                  return _createRegularPolygonPath(5, size.width / 2);
                case 4: // Hexagon
                  return _createRegularPolygonPath(6, size.width / 2);
                case 5: // Star
                  return _createStarPath(size.width / 2);
                case 6: // Heart
                  return _createHeartPath(size.width / 2);
                default:
                  return Path()
                    ..moveTo(0, 0)
                    ..lineTo(-size.width, 0)
                    ..lineTo(-size.width, size.height)
                    ..lineTo(0, size.height)
                    ..close();
              }
            },
      numberOfParticles: (widget.numberOfParticles ?? 10).clamp(1, 100),
      displayTarget: widget.displayTarget ?? false,
      particleDrag: (widget.particleDrag ?? 0.05).clamp(0, 1),
      shouldLoop: (widget.shouldLoop ?? false),
      colors: widget.colors ?? Colors.primaries,
    );
  }
}

Path _createRegularPolygonPath(int sides, double radius) {
  final path = Path();
  final angle = (2 * pi) / sides;

  path.moveTo(radius * cos(0), radius * sin(0));
  for (int i = 1; i < sides; i++) {
    path.lineTo(radius * cos(angle * i), radius * sin(angle * i));
  }
  path.close();
  return path;
}

Path _createStarPath(double size) {
  final path = Path();
  const int points = 5;
  const step = pi / points;

  path.moveTo(size, 0);
  for (int i = 1; i < 2 * points; i++) {
    final r = (i % 2 == 0) ? size : size / 2;
    path.lineTo(r * cos(step * i), r * sin(step * i));
  }
  path.close();
  return path;
}

Path _createHeartPath(double size) => Path()
  ..moveTo(size, size / 4)
  ..cubicTo(size * 1.5, -size / 3, size * 2, size / 4, size, size)
  ..moveTo(size, size / 4)
  ..cubicTo(size / 2, -size / 3, 0, size / 4, size, size)
  ..close();

enum BlastDirectionality {
  directional,
  explosive,
}

enum ConfettiControllerState {
  playing,
  stopped,
}

class ConfettiWidget extends StatefulWidget {
  const ConfettiWidget({
    super.key,
    required this.confettiController,
    this.emissionFrequency = 0.02,
    this.numberOfParticles = 10,
    this.maxBlastForce = 20,
    this.minBlastForce = 5,
    this.blastDirectionality = BlastDirectionality.directional,
    this.blastDirection = pi,
    this.gravity = 0.2,
    this.shouldLoop = false,
    this.displayTarget = false,
    this.colors,
    this.strokeColor = Colors.black,
    this.strokeWidth = 0,
    this.minimumSize = const Size(20, 10),
    this.maximumSize = const Size(30, 15),
    this.particleDrag = 0.05,
    this.canvas,
    this.child,
    this.createParticlePath,
  })  : assert(
          emissionFrequency >= 0 &&
              emissionFrequency <= 1 &&
              numberOfParticles > 0 &&
              maxBlastForce > 0 &&
              minBlastForce > 0 &&
              maxBlastForce > minBlastForce,
        ),
        assert(gravity >= 0 && gravity <= 1,
            '`gravity` needs to be between 0 and 1'),
        assert(strokeWidth >= 0, '`strokeWidth needs to be bigger than 0');

  final ConfettiController confettiController;
  final double maxBlastForce;
  final double minBlastForce;
  final BlastDirectionality blastDirectionality;
  final double blastDirection;
  final Path Function(Size size)? createParticlePath;
  final double gravity;
  final double emissionFrequency;
  final int numberOfParticles;
  final bool shouldLoop;
  final bool displayTarget;
  final List<Color>? colors;
  final double strokeWidth;
  final Color strokeColor;
  final Size minimumSize;
  final Size maximumSize;
  final double particleDrag;
  final Size? canvas;
  final Widget? child;

  @override
  ConfettiWidgetState createState() => ConfettiWidgetState();
}

class ConfettiWidgetState extends State<ConfettiWidget>
    with SingleTickerProviderStateMixin {
  final GlobalKey _particleSystemKey = GlobalKey();

  late AnimationController _animController;
  late Animation<double> _animation;
  late ParticleSystem _particleSystem;

  Offset? _emitterPosition;
  Size _screenSize = const Size(0, 0);

  @override
  void initState() {
    super.initState();
    widget.confettiController.addListener(_handleChange);

    _particleSystem = ParticleSystem(
        emissionFrequency: widget.emissionFrequency,
        numberOfParticles: widget.numberOfParticles,
        maxBlastForce: widget.maxBlastForce,
        minBlastForce: widget.minBlastForce,
        gravity: widget.gravity,
        blastDirection: widget.blastDirection,
        blastDirectionality: widget.blastDirectionality,
        colors: widget.colors,
        minimumSize: widget.minimumSize,
        maximumSize: widget.maximumSize,
        particleDrag: widget.particleDrag,
        createParticlePath: widget.createParticlePath);

    _particleSystem.addListener(_particleSystemListener);

    _initAnimation();
  }

  void _initAnimation() {
    _animController = AnimationController(
        vsync: this, duration: widget.confettiController.duration);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animController);
    _animation
      ..addListener(_animationListener)
      ..addStatusListener(_animationStatusListener);

    if (widget.confettiController.state == ConfettiControllerState.playing) {
      _startAnimation();
      _startEmission();
    }
  }

  void _handleChange() {
    if (widget.confettiController.state == ConfettiControllerState.playing) {
      _startAnimation();
      _startEmission();
    } else if (widget.confettiController.state ==
        ConfettiControllerState.stopped) {
      _stopEmission();
    }
  }

  void _animationListener() {
    if (_particleSystem.particleSystemStatus == ParticleSystemStatus.finished) {
      _animController.stop();
      return;
    }
    _particleSystem.update();
  }

  void _animationStatusListener(AnimationStatus status) {
    if (status == AnimationStatus.completed) {
      if (!widget.shouldLoop) {
        _stopEmission();
      }
      _continueAnimation();
    }
  }

  void _particleSystemListener() {
    if (_particleSystem.particleSystemStatus == ParticleSystemStatus.finished) {
      _stopAnimation();
    }
  }

  void _startEmission() {
    _particleSystem.startParticleEmission();
  }

  void _stopEmission() {
    if (_particleSystem.particleSystemStatus == ParticleSystemStatus.stopped) {
      return;
    }
    _particleSystem.stopParticleEmission();
  }

  void _startAnimation() {
    // Make sure widgets are built before setting screen size and position
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _setScreenSize();
        _setEmitterPosition();
        _animController.forward(from: 0);
      }
    });
  }

  void _stopAnimation() {
    _animController.stop();
    widget.confettiController.stop();
  }

  void _continueAnimation() {
    _animController.forward(from: 0);
  }

  void _setScreenSize() {
    _screenSize = _getScreenSize();
    _particleSystem.screenSize = _screenSize;
  }

  void _setEmitterPosition() {
    _emitterPosition = _getContainerPosition();
    _particleSystem.particleSystemPosition = _emitterPosition;
  }

  Offset _getContainerPosition() {
    final containerRenderBox =
        _particleSystemKey.currentContext!.findRenderObject() as RenderBox;
    return containerRenderBox.localToGlobal(Offset.zero);
  }

  Size _getScreenSize() {
    return widget.canvas ?? MediaQuery.of(context).size;
  }

  /// On layout change update the position of the emitter
  /// and the screen size.
  ///
  /// Only update the emitter if it has already been set, to avoid RenderObject
  /// issues.
  ///
  /// The emitter position is first set in the `addPostFrameCallback`
  /// in [initState].
  void _updatePositionAndSize() {
    if (_getScreenSize() != _screenSize) {
      _setScreenSize();
      if (_emitterPosition != null) {
        _setEmitterPosition();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    _updatePositionAndSize();
    return RepaintBoundary(
      child: CustomPaint(
        key: _particleSystemKey,
        foregroundPainter: ParticlePainter(
          _animController,
          strokeWidth: widget.strokeWidth,
          strokeColor: widget.strokeColor,
          particles: _particleSystem.particles,
          paintEmitterTarget: widget.displayTarget,
        ),
        child: widget.child,
      ),
    );
  }

  @override
  void dispose() {
    widget.confettiController.stop();
    _animController.dispose();
    widget.confettiController.removeListener(_handleChange);
    _particleSystem.removeListener(_particleSystemListener);
    super.dispose();
  }
}

class ParticlePainter extends CustomPainter {
  ParticlePainter(
    Listenable? repaint, {
    required this.particles,
    bool paintEmitterTarget = true,
    Color emitterTargetColor = Colors.black,
    Color strokeColor = Colors.black,
    this.strokeWidth = 0,
  })  : _paintEmitterTarget = paintEmitterTarget,
        _emitterPaint = Paint()
          ..color = emitterTargetColor
          ..style = PaintingStyle.stroke
          ..strokeWidth = 2.0,
        _particlePaint = Paint()
          ..color = Colors.green
          ..style = PaintingStyle.fill,
        _particleStrokePaint = Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = PaintingStyle.stroke,
        super(repaint: repaint);

  final List<Particle> particles;

  final Paint _emitterPaint;
  final bool _paintEmitterTarget;
  final Paint _particlePaint;
  final Paint _particleStrokePaint;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    if (_paintEmitterTarget) {
      _paintEmitter(canvas);
    }
    _paintParticles(canvas);
  }

  void _paintEmitter(Canvas canvas) {
    const radius = 10.0;
    canvas.drawCircle(Offset.zero, radius, _emitterPaint);
    final path = Path()
      ..moveTo(0, -radius)
      ..lineTo(0, radius)
      ..moveTo(-radius, 0)
      ..lineTo(radius, 0);
    canvas.drawPath(path, _emitterPaint);
  }

  void _paintParticles(Canvas canvas) {
    for (final particle in particles) {
      final rotationMatrix4 = Matrix4.identity()
        ..translate(particle.location.dx, particle.location.dy)
        ..rotateX(particle.angleX)
        ..rotateY(particle.angleY)
        ..rotateZ(particle.angleZ);

      final finalPath = particle.path.transform(rotationMatrix4.storage);
      canvas.drawPath(finalPath, _particlePaint..color = particle.color);
      if (strokeWidth > 0) {
        canvas.drawPath(finalPath, _particleStrokePaint);
      }
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class ConfettiController extends ChangeNotifier {
  ConfettiController({this.duration = const Duration(seconds: 30)})
      : assert(!duration.isNegative && duration.inMicroseconds > 0);

  Duration duration;

  ConfettiControllerState _state = ConfettiControllerState.stopped;

  ConfettiControllerState get state => _state;

  void play() {
    _state = ConfettiControllerState.playing;
    notifyListeners();
  }

  void stop() {
    _state = ConfettiControllerState.stopped;
    notifyListeners();
  }
}

final _rand = Random();

class Helper {
  static double randomize(double min, double max) {
    return lerpDouble(min, max, _rand.nextDouble())!;
  }

  static Color randomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}

enum ParticleSystemStatus {
  started,
  finished,
  stopped,
}

class ParticleSystem extends ChangeNotifier {
  ParticleSystem({
    required double emissionFrequency,
    required int numberOfParticles,
    required double maxBlastForce,
    required double minBlastForce,
    required double blastDirection,
    required BlastDirectionality blastDirectionality,
    required List<Color>? colors,
    required Size minimumSize,
    required Size maximumSize,
    required double particleDrag,
    required double gravity,
    Path Function(Size size)? createParticlePath,
  })  : assert(maxBlastForce > 0 &&
            minBlastForce > 0 &&
            emissionFrequency >= 0 &&
            emissionFrequency <= 1 &&
            numberOfParticles > 0 &&
            minimumSize.width > 0 &&
            minimumSize.height > 0 &&
            maximumSize.width > 0 &&
            maximumSize.height > 0 &&
            minimumSize.width <= maximumSize.width &&
            minimumSize.height <= maximumSize.height &&
            particleDrag >= 0.0 &&
            particleDrag <= 1 &&
            minimumSize.height <= maximumSize.height),
        assert(gravity >= 0 && gravity <= 1),
        _blastDirection = blastDirection,
        _blastDirectionality = blastDirectionality,
        _gravity = gravity,
        _maxBlastForce = maxBlastForce,
        _minBlastForce = minBlastForce,
        _frequency = emissionFrequency,
        _numberOfParticles = numberOfParticles,
        _colors = colors,
        _minimumSize = minimumSize,
        _maximumSize = maximumSize,
        _particleDrag = particleDrag,
        _rand = Random(),
        _createParticlePath = createParticlePath;

  ParticleSystemStatus? _particleSystemStatus;

  final List<Particle> _particles = [];

  /// A frequency between 0 and 1 to determine how often the emitter
  /// should emit new particles.
  final double _frequency;
  final int _numberOfParticles;
  final double _maxBlastForce;
  final double _minBlastForce;
  final double _blastDirection;
  final BlastDirectionality _blastDirectionality;
  final double _gravity;
  final List<Color>? _colors;
  final Size _minimumSize;
  final Size _maximumSize;
  final double _particleDrag;
  final Path Function(Size size)? _createParticlePath;

  Offset? _particleSystemPosition;
  Size? _screenSize;

  late double _bottomBorder;
  late double _rightBorder;
  late double _leftBorder;

  final Random _rand;

  set particleSystemPosition(Offset? position) {
    _particleSystemPosition = position;
  }

  set screenSize(Size size) {
    _screenSize = size;
    _setScreenBorderPositions(); // needs to be called here to only set the borders once
  }

  void stopParticleEmission() {
    _particleSystemStatus = ParticleSystemStatus.stopped;
  }

  void startParticleEmission() {
    _particleSystemStatus = ParticleSystemStatus.started;
  }

  void finishParticleEmission() {
    _particleSystemStatus = ParticleSystemStatus.finished;
  }

  List<Particle> get particles => _particles;

  ParticleSystemStatus? get particleSystemStatus => _particleSystemStatus;

  void update() {
    _clean();
    if (_particleSystemStatus != ParticleSystemStatus.finished) {
      _updateParticles();
    }

    if (_particleSystemStatus == ParticleSystemStatus.started) {
      // If there are no particles then immediately generate particles
      // This also ensures that particles are emitted on the first frame
      if (particles.isEmpty) {
        _particles.addAll(_generateParticles(number: _numberOfParticles));
        return;
      }

      // Determines whether to generate new particles based on the [frequency]
      final chanceToGenerate = _rand.nextDouble();
      if (chanceToGenerate < _frequency) {
        _particles.addAll(_generateParticles(number: _numberOfParticles));
      }
    }

    if (_particleSystemStatus == ParticleSystemStatus.stopped &&
        _particles.isEmpty) {
      finishParticleEmission();
      notifyListeners();
    }
  }

  void _setScreenBorderPositions() {
    _bottomBorder = _screenSize!.height * 1.1;
    _rightBorder = _screenSize!.width * 1.1;
    _leftBorder = _screenSize!.width - _rightBorder;
  }

  void _updateParticles() {
    for (final particle in _particles) {
      particle.update();
    }
  }

  void _clean() {
    if (_particleSystemPosition != null && _screenSize != null) {
      _particles
          .removeWhere((particle) => _isOutsideOfBorder(particle.location));
    }
  }

  bool _isOutsideOfBorder(Offset particleLocation) {
    final globalParticlePosition = particleLocation + _particleSystemPosition!;
    return (globalParticlePosition.dy >= _bottomBorder) ||
        (globalParticlePosition.dx >= _rightBorder) ||
        (globalParticlePosition.dx <= _leftBorder);
  }

  List<Particle> _generateParticles({int number = 1}) {
    return List<Particle>.generate(
        number,
        (i) => Particle(_generateParticleForce(), _randomColor(), _randomSize(),
            _gravity, _particleDrag, _createParticlePath));
  }

  double get _randomBlastDirection =>
      vmath.radians(Random().nextInt(359).toDouble());

  vmath.Vector2 _generateParticleForce() {
    var blastDirection = _blastDirection;
    if (_blastDirectionality == BlastDirectionality.explosive) {
      blastDirection = _randomBlastDirection;
    }
    final blastRadius = Helper.randomize(_minBlastForce, _maxBlastForce);
    final y = blastRadius * sin(blastDirection);
    final x = blastRadius * cos(blastDirection);
    return vmath.Vector2(x, y);
  }

  Color _randomColor() {
    if (_colors != null) {
      if (_colors!.length == 1) {
        return _colors![0];
      }
      final index = _rand.nextInt(_colors!.length);
      return _colors![index];
    }
    return Helper.randomColor();
  }

  Size _randomSize() {
    return Size(
      Helper.randomize(_minimumSize.width, _maximumSize.width),
      Helper.randomize(_minimumSize.height, _maximumSize.height),
    );
  }
}

class Particle {
  Particle(vmath.Vector2 startUpForce, Color color, Size size, double gravity,
      double particleDrag, Path Function(Size size)? createParticlePath)
      : _startUpForce = startUpForce,
        _color = color,
        _mass = Helper.randomize(1, 11),
        _particleDrag = particleDrag,
        _location = vmath.Vector2.zero(),
        _acceleration = vmath.Vector2.zero(),
        _velocity =
            vmath.Vector2(Helper.randomize(-3, 3), Helper.randomize(-3, 3)),
        // _size = size,
        _pathShape = createParticlePath != null
            ? createParticlePath(size)
            : createPath(size),
        _aVelocityX = Helper.randomize(-0.1, 0.1),
        _aVelocityY = Helper.randomize(-0.1, 0.1),
        _aVelocityZ = Helper.randomize(-0.1, 0.1),
        _gravity = lerpDouble(0.1, 5, gravity);

  final vmath.Vector2 _startUpForce;

  final vmath.Vector2 _location;
  final vmath.Vector2 _velocity;
  final vmath.Vector2 _acceleration;

  final double _particleDrag;
  double _aX = 0;
  double _aVelocityX;
  double _aY = 0;
  double _aVelocityY;
  double _aZ = 0;
  double _aVelocityZ;
  final double? _gravity;
  final _aAcceleration = 0.0001;

  final Color _color;
  final double _mass;
  final Path _pathShape;

  double _timeAlive = 0;

  static Path createPath(Size size) {
    final pathShape = Path()
      ..moveTo(0, 0)
      ..lineTo(-size.width, 0)
      ..lineTo(-size.width, size.height)
      ..lineTo(0, size.height)
      ..close();
    return pathShape;
  }

  void applyForce(vmath.Vector2 force) {
    final f = force.clone()..divide(vmath.Vector2.all(_mass));
    _acceleration.add(f);
  }

  void drag() {
    final speed = sqrt(pow(_velocity.x, 2) + pow(_velocity.y, 2));
    final dragMagnitude = _particleDrag * speed * speed;
    final drag = _velocity.clone()
      ..multiply(vmath.Vector2.all(-1))
      ..normalize()
      ..multiply(vmath.Vector2.all(dragMagnitude));
    applyForce(drag);
  }

  void _applyStartUpForce() {
    applyForce(_startUpForce);
  }

  void _applyWindForceUp() {
    applyForce(vmath.Vector2(0, -1));
  }

  void update() {
    drag();

    if (_timeAlive < 5) {
      _applyStartUpForce();
    }
    if (_timeAlive < 25) {
      _applyWindForceUp();
    }

    _timeAlive += 1;

    applyForce(vmath.Vector2(0, _gravity!));

    _velocity.add(_acceleration);
    _location.add(_velocity);
    _acceleration.setZero();

    _aVelocityX += _aAcceleration / _mass;
    _aVelocityY += _aAcceleration / _mass;
    _aVelocityZ += _aAcceleration / _mass;
    _aX += _aVelocityX;
    _aY += _aVelocityY;
    _aZ += _aVelocityZ;
  }

  Offset get location {
    if (_location.x.isNaN || _location.y.isNaN) {
      return const Offset(0, 0);
    }
    return Offset(_location.x, _location.y);
  }

  Color get color => _color;

  Path get path => _pathShape;

  double get angleX => _aX;

  double get angleY => _aY;

  double get angleZ => _aZ;
}
