import 'package:flutter/material.dart';
import 'package:password_app/design/password_app_colors.dart';

import '../config/app_routes.dart';
import '../design/copys.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late BoxDecoration userNameDecoration;
  late BoxDecoration passwordDecoration;
  late String userName;
  final _formLoginKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // userNameDecoration
    // passwordDecoration
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 16),
          child: Column(
            children: [
              Text(
                PasswordAppCopys.welcome,
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                  color: Colors.lightBlueAccent,
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                child: Text(
                  PasswordAppCopys.welcomeMsg,
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                    color: PasswordAppColors.primaryColor,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                  children: [
                    TextFormField(
                      onTap: () => setState(() {
                        
                      }),
                      style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                      decoration: InputDecoration(
                        label: const Text(PasswordAppCopys.userName),
                        hintText: 'Recuerda ingresar el usuario',
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Errors.userName;
                        }
                        if (value.length >= 10) {
                          return Errors.validUser;
                        }
                        userName = value;
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: InputDecoration(
                        label: const Text(PasswordAppCopys.password),
                        floatingLabelBehavior: FloatingLabelBehavior.auto,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return Errors.password;
                        }
                    
                        userName = value;
                        return null;
                      },
                    ),
                    
                    const SizedBox(height: 20),

                    ElevatedButton(
                      onPressed: () {
                        if (_formLoginKey.currentState!.validate()) {
                          Navigator.of(context).pushReplacementNamed(AppRoutes.home, arguments: userName);
                        }
                      },
                      child: const Text('Subir formulario'),
                    ),
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
