import 'package:flutter/material.dart';
import 'package:flutter_web_admin/constant/style.dart';
import 'package:flutter_web_admin/helpers/firebase_helper.dart';
import 'package:flutter_web_admin/routing/routes.dart';
import 'package:flutter_web_admin/widgets/custom_text.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/google_button.dart';

class AuthenticationPage extends StatefulWidget {
  AuthenticationPage({Key? key}) : super(key: key);

  @override
  _AuthenticationPageState createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  String? _errorText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          constraints: BoxConstraints(maxWidth: 400),
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: Image.asset("assets/icons/logo.png"),
                  ),
                  Expanded(child: Container()),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text("Login",
                      style: GoogleFonts.roboto(
                          fontSize: 30, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  CustomText(
                    text: "Welcome back to the admin panel.",
                    color: lightGrey,
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                    labelText: "Email",
                    hintText: "abc@domain.com",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: "Password",
                    hintText: "123",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      CustomText(
                        text: "Remeber Me",
                      ),
                    ],
                  ),
                  CustomText(text: "Forgot password?", color: active)
                ],
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () async {
                  var res = await signInWithEmailPassword(
                      _emailController.text, _passwordController.text);
                  if (res != null) {
                    Get.offAllNamed(rootRoute);
                  } else {
                    setState(() => _errorText = 'Invalid Email or password!');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: active, borderRadius: BorderRadius.circular(20)),
                  alignment: Alignment.center,
                  width: double.maxFinite,
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: CustomText(
                    text: "Login",
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Visibility(
                visible: _errorText != null,
                child: Text(
                  _errorText ?? '',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red,
                  ),
                ),
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: "Do not have admin credentials? "),
                TextSpan(
                    text: "Request Credentials! ",
                    style: TextStyle(color: active))
              ])),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: GoogleButton(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
