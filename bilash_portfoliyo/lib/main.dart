import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registration Login UI',
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(child: RegistrationLoginScreen()),
      ),
    );
  }
}

class RegistrationLoginScreen extends StatelessWidget {
  const RegistrationLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Screen width check for responsiveness
    bool isWideScreen = size.width > 600;

    Widget card({
      required Widget icon,
      required String label,
      required VoidCallback onPressed,
    }) {
      return Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            icon,
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
              ),
              onPressed: onPressed,
              child: Text(
                label,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
    }

    Widget loginCard() {
      final emailController = TextEditingController();
      final passwordController = TextEditingController();

      return Container(
        margin: const EdgeInsets.all(12),
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              spreadRadius: 1,
              offset: Offset(0, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 70,
              child: Image.network(
                'https://globalstudycontacts.com/images/logo.png',
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.error,
                    size: 50,
                    color: Colors.red,
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'E-mail',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 12),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                isDense: true,
              ),
              obscureText: true,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Sign in action
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
                child: const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
            const SizedBox(height: 12),
            GestureDetector(
              onTap: () {
                // Forgot password action
              },
              child: const Text(
                'I forgot my password',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            )
          ],
        ),
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: isWideScreen
            ? Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: card(
                      icon: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/1946/1946488.png',
                        height: 100,
                        width: 100,
                      ),
                      label: 'New Agent Registration',
                      onPressed: () {},
                    ),
                  ),
                  Expanded(
                    child: card(
                      icon: Image.network(
                        'https://cdn-icons-png.flaticon.com/512/201/201818.png',
                        height: 100,
                        width: 100,
                      ),
                      label: 'New Student Registration',
                      onPressed: () {},
                    ),
                  ),
                  Expanded(child: loginCard()),
                ],
              )
            : Column(
                children: [
                  card(
                    icon: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/1946/1946488.png',
                      height: 100,
                      width: 100,
                    ),
                    label: 'New Agent Registration',
                    onPressed: () {},
                  ),
                  card(
                    icon: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/201/201818.png',
                      height: 100,
                      width: 100,
                    ),
                    label: 'New Student Registration',
                    onPressed: () {},
                  ),
                  loginCard(),
                ],
              ),
      ),
    );
  }
}
