import 'package:flutter/material.dart';
import 'package:hetal_dave_practical/util/image_constant.dart';
import 'package:hetal_dave_practical/view/widget/google_signin_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16.0,
            right: 16.0,
            bottom: 20.0,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                      flex: 1,
                      child: Image.asset(
                        ImageConstant.FIREBASE_SYMBOL,
                        height: height * 0.16
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              GoogleSignInButton()
            ],
          ),
        ),
      ),
    );
  }
}
