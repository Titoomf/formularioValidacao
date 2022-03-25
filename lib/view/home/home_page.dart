import 'package:flutter/material.dart';

import '../../components/textformfield/custom_textformfield_generic.dart';
import '../../controller/validação/home_controller.dart';
import '../../modules/models/usuario/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool obscureTextPassword = false;
  var cachePassword = '';
  var cachePasswordConfirm = '';
  var user = const UserModel();

  final homePageController = HomePageController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE9E7E7),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: (const Icon(
                    Icons.arrow_back,
                  )),
                  onPressed: () {},
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '👋 Hello,',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      const Text(
                        'Are you new here? ',
                        style: TextStyle(
                          fontSize: 25,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 30,
                          bottom: 10,
                        ),
                        child: Row(
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'if have an account/',
                                style: TextStyle(
                                  color: Color(0xA3979696),
                                ),
                                children: [
                                  TextSpan(
                                    text: 'Login',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Color(
                                        0x761A1919,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    // height: MediaQuery.of(context).size.height * 0.09,
                    decoration: const BoxDecoration(
                      color: Color(0x67FFFCFC),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      ),
                    ),
                    child: Form(
                      key: homePageController.formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Full name',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextformFieldGeneric(
                              hint: 'Augusto Mendonca',
                              icon: Image.asset(
                                'assets/images/person.png',
                              ),
                              onSaved: (text) => user = user.copyWith(
                                name: text,
                              ),
                              validator: homePageController.validarFullNome,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'E-mail',
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            CustomTextformFieldGeneric(
                              hint: '@gmail.com',
                              icon: Image.asset(
                                'assets/images/email.png',
                              ),
                              onSaved: (text) => user = user.copyWith(
                                name: text,
                              ),
                              validator: homePageController.validarEmail,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Password',
                            ),
                            const SizedBox(height: 20),
                            CustomTextformFieldGeneric(
                              hint: '*****',
                              icon: Image.asset(
                                'assets/images/password.png',
                              ),
                              obscureText: obscureTextPassword,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      obscureTextPassword =
                                          !obscureTextPassword;
                                    },
                                  );
                                },
                                icon: Icon(
                                  obscureTextPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              onSaved: (text) => user = user.copyWith(
                                password: text,
                              ),
                              validator: homePageController.validarPassword,
                              onChanged: (text) => cachePassword = text,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Text(
                              'Confirm Password',
                            ),
                            const SizedBox(height: 20),
                            CustomTextformFieldGeneric(
                              hint: '*****',
                              icon: Image.asset(
                                'assets/images/password.png',
                              ),
                              obscureText: obscureTextPassword,
                              suffix: IconButton(
                                onPressed: () {
                                  setState(
                                    () {
                                      obscureTextPassword =
                                          !obscureTextPassword;
                                    },
                                  );
                                },
                                icon: Icon(
                                  obscureTextPassword
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                              ),
                              onSaved: (text) => user = user.copyWith(
                                password: text,
                              ),
                              validator:
                                  homePageController.validarPasswordConfirm,
                              onChanged: (text) => cachePasswordConfirm = text,
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            SizedBox(
                              height: 60,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      MaterialStateProperty.resolveWith<Color?>(
                                    (states) {
                                      return const Color(0xA00F37EB)
                                          .withOpacity(
                                        0.50,
                                      );
                                    },
                                  ),
                                  textStyle: MaterialStateProperty.resolveWith<
                                      TextStyle>(
                                    (states) {
                                      return const TextStyle(
                                        fontSize: 15,
                                      );
                                    },
                                  ),
                                  shape: MaterialStateProperty.resolveWith(
                                    (states) {
                                      return RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      );
                                    },
                                  ),
                                ),
                                onPressed: () {
                                  if (homePageController.formKey.currentState!
                                      .validate()) {
                                    homePageController.formKey.currentState!
                                        .save();
                                    Navigator.of(context)
                                        .pushReplacementNamed('/login');
                                  } else {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return const AlertDialog(
                                          backgroundColor: Colors.red,
                                          title: Text(
                                              'Erro no login, Tente novamente....'),
                                        );
                                      },
                                    );
                                  }
                                },
                                child: const SizedBox(
                                  width: 400,
                                  child: Center(
                                    child: Text(
                                      'Sign Up',
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
