import 'package:flutter/material.dart';
import 'package:si_kerja/constants.dart';
import 'package:si_kerja/controllers/users_controller.dart';
import 'package:si_kerja/model/users_model.dart';
import 'package:si_kerja/pages/home.dart';
import 'package:si_kerja/pages/login.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _form_key = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  bool _isObscure = true;

  Future Register() async {
    String url = "http://192.168.1.6/si_kerja/register.php";
    final response = await http.post(Uri.parse(url), body: {
      "username": usernameController.text,
      "email": emailController.text,
      "age": ageController.text,
      "password": passController.text,
    });
    var data = jsonDecode(response.body);

    if (data == "Berhasil") {
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => RegisterPage()));
    } else {
      await userController.setlogin(true);
      // ignore: use_build_context_synchronously
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Center(
        child: Form(
          key: _form_key,
          child: ListView(
            shrinkWrap: true,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Please complete your',
                    style: TextStyle(fontSize: 20),
                  ),
                  const Text(
                    'biodata correctly',
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
                            hintText: "Your Username",
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
                          controller: emailController,
                          style: const TextStyle(color: white),
                          cursorColor: white,
                          decoration: InputDecoration(
                            hintText: "Your E-mail",
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
                            Icons.email,
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
                          controller: ageController,
                          style: const TextStyle(color: white),
                          cursorColor: white,
                          decoration: InputDecoration(
                            hintText: "Your Age",
                            hintStyle: const TextStyle(
                              color: white,
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 80, vertical: 17),
                            filled: true,
                            fillColor: Colors.brown,
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
                            Icons.man,
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
                            } else if (val != passController.text) {
                              return 'password not match';
                            }
                            return null;
                          },
                          controller: passController,
                          style: const TextStyle(color: white),
                          cursorColor: white,
                          obscureText: _isObscure,
                          decoration: InputDecoration(
                            hintText: "Create your Password ",
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
                      color: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      onPressed: () {
                        bool passController =
                            _form_key.currentState!.validate();

                        if (passController) {
                          Register();
                        }
                      },
                      child: const Text(
                        'Sign up',
                        style: TextStyle(
                          fontSize: 20,
                          color: white,
                        ),
                      ),
                    ),
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
