import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:itsewa/constants.dart';

import 'home_page.dart';
import 'login_page.dart';

class LandingPage extends StatelessWidget {
// Create the initialization Future outside of `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        //connecion initialized- firebase  app is running
        if (snapshot.connectionState == ConnectionState.done) {
          //streambuilder can check the login state live

          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              // Check for stream snapshot errors
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }
              // Connection state active - Do the user login check inside the
              // if statement
              if (streamSnapshot.connectionState == ConnectionState.active) {
                // Get the user
                User _user = streamSnapshot.data;

                // If the user is null, we're not logged in
                if (_user == null) {
                  // user not logged in, head to login
                  return LoginPage();
                } else {
                  // The user is logged in, head to homepage
                  return HomePage();
                }
              }

              // checking the auth state----Loading
              return Scaffold(
                body: Center(
                  child: Text(
                    "Checking Authentication......",
                    style: Constants.regualarHeading,
                  ),
                ),
              );
            },
          );
        }

        // connecting to firebase----loading
        return Scaffold(
          body: Center(
            child: Text(
              "Initializing App......",
              style: Constants.regualarHeading,
            ),
          ),
        );
      },
    );
  }
}
