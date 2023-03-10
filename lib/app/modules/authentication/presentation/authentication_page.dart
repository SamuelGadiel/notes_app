import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({super.key});

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  UserCredential? user;

  Future<void> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;

      final googleAuthCredential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      //Authenticate against Firebase with Google credentials
      await FirebaseAuth.instance.signInWithCredential(googleAuthCredential).then(
            (userCredential) => {
              setState(() => {user = userCredential})
            },
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notando'),
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: signInWithGoogle,
            child: const Text('Sign in'),
          ),
          Builder(
            builder: (context) {
              if (user == null) {
                return const SizedBox();
              }

              return Column(
                children: [
                  Text(user?.user?.displayName ?? ''),
                  CircleAvatar(
                    foregroundImage: NetworkImage(user?.user?.photoURL ?? ''),
                  )
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
