import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:si_kerja/constants.dart';
import 'package:crypto/crypto.dart' as crypto;
import 'package:si_kerja/controllers/users_controller.dart';
import 'package:si_kerja/pages/home.dart';

import 'package:si_kerja/pages/register.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  final formKey = GlobalKey<FormState>();

  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passController = TextEditingController();
    bool _isObscure = true;

    Future<void> login() async {
      String url = "http://192.168.1.6/si_kerja/login.php";
      final response = await http.post(Uri.parse(url), body: {
        "username": usernameController.text,
        // "password": passController.text,
        "password": generateMD5(passController.text),
      });
      var data = jsonDecode(response.body);

      print(data);
      print(generateMD5(passController.text));

      if (data == "Error") {
        // ignore: use_build_context_synchronously
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const LoginPage()));
      } else {
        await userController.setlogin(true);
        // ignore: use_build_context_synchronously
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const HomePage()));
      }
    }

    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Form(
          key: formKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Welcome !',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'To app Si Kerja',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'Please sign in first.',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Image.asset('assets/images/picture.png'),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Empty';
                            }
                            return null;
                          },
                          controller: usernameController,
                          style: const TextStyle(color: white),
                          cursorColor: white,
                          decoration: InputDecoration(
                            hintText: "Your email",
                            hintStyle: const TextStyle(
                              color: white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 17),
                            filled: true,
                            fillColor: kPrimaryColor,
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: white,
                          child: Icon(
                            Icons.person,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        TextFormField(
                          validator: (val) {
                            if (val!.isEmpty) {
                              return 'Empty';
                            }
                            return null;
                          },
                          controller: passController,
                          style: const TextStyle(color: white),
                          obscureText: _isObscure,
                          cursorColor: white,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                              color: white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 17),
                            filled: true,
                            fillColor: kPrimaryColor,
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _isObscure = !_isObscure;
                                });
                              },
                              color: white,
                              icon: Icon(_isObscure == false
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        const CircleAvatar(
                          radius: 30,
                          backgroundColor: white,
                          child: Icon(
                            Icons.key_outlined,
                            size: 30,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 350,
                    height: 60,
                    child: MaterialButton(
                      onPressed: () {
                        bool passController = formKey.currentState!.validate();

                        if (passController) {
                          login();
                        }
                      },
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          fontSize: 20,
                          color: white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        "Don’t have an Account ? ",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RegisterPage();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

generateMD5(String data) {
  var content = Utf8Encoder().convert(data);
  var md5 = crypto.md5;
  var digest = md5.convert(content);
  return hex.encode(digest.bytes);
}
