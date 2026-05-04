import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/onboarding_screen.dart';
import 'screens/login_screen.dart';
import 'screens/otp_screen.dart';
import 'screens/signup_screen.dart';
import 'screens/category_selection_screen.dart';
import 'screens/home_screen.dart';
import 'screens/messages_screen.dart';
import 'screens/chat_detail_screen.dart';
import 'screens/experts_screen.dart';
import 'screens/account_screen.dart';
import 'screens/booking_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prozsphere',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6229A7),
          primary: const Color(0xFF6229A7),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/onboarding': (context) => const OnboardingScreen(),
        '/login': (context) => const LoginScreen(),
        '/otp': (context) => const OtpScreen(),
        '/signup': (context) => const SignupScreen(),
        '/categories': (context) => const CategorySelectionScreen(),
        '/home': (context) => const HomeScreen(),
        '/chat_detail': (context) => const ChatDetailScreen(),
        '/booking': (context) => const BookingScreen(),
      },
    );
  }
}
