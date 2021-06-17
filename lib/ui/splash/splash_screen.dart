import 'package:flutter/material.dart';
import 'package:helpdesk/app/routes.dart';
import 'package:helpdesk/ui/widgets/logo.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ///to change the duration that splash last
  static const _kSplashDuration = const Duration(seconds: 2);

  @override
  void initState() {
    super.initState();

    Future.delayed(_kSplashDuration).then((_) {
      if (mounted) {
        _goNext();
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Center(child: LogoWidget(radius: 50)),
    );
  }

  void _goNext() {
     Navigator.pushNamed(context, '/home');
  }
}
