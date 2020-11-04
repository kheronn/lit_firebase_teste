import 'package:flutter/material.dart';
import 'package:lit_firebase_auth/lit_firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LitAuthInit(
      authProviders: AuthProviders(emailAndPassword: true, google: true),
      child: MaterialApp(
        home: LitAuthState(
          authenticated: HomePage(),
          unauthenticated: LoginPage(),
        ),
      ),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: SingleChildScrollView(
          child: LitAuth(
            config: AuthConfig(title: Text("Autenticação Simples")),
            errorNotification: NotificationConfig(backgroundColor: Colors.red),
          ),
        ));
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
        child: RaisedButton.icon(
          icon: Icon(Icons.lock_outline),
          onPressed: () {
            context.signOut();
          },
          label: Text("Sair"),
        ),
      ),
    );
  }
}
