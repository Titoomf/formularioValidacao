import 'package:flutter/material.dart';

import '../../components/dropDownButton/custom_dropdown_button.dart';
import '../../components/textformfield/custom_textformfield_cpf.dart';
import '../../components/textformfield/custom_textformfield_generic.dart';
import '../../components/textformfield/custom_textformfield_phone.dart';
import '../../controller/validação/login_controller.dart';
import '../../modules/models/mascaras/cpf_mask.dart';
import '../../modules/models/mascaras/telefone_mask.dart';
import '../../modules/models/usuario/user_model.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = loginPageController();
  var user = const UserModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE9E7E7),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                icon: (const Icon(
                  Icons.arrow_back,
                )),
                onPressed: () => Navigator.pushNamed(context, '/'),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 15,
                    ),
                    child: Text(
                      '😎 Setting up your',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'profile ',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 30,
                  bottom: 10,
                  left: 15,
                ),
                child: Row(
                  children: [
                    RichText(
                      text: const TextSpan(
                        text: 'Add your profile photo',
                        style: TextStyle(
                          color: Color(0xA3979696),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Color(0xB3FFFCFC),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: Form(
                    key: loginController.formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.asset(
                              'assets/images/avatar.png',
                              height: 100,
                              width: 150,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              const Text(
                                'Display Name',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              CustomTextformFieldGeneric(
                                icon: Image.asset('assets/images/person.png'),
                                hint: 'Augusto',
                                onSaved: (text) => user = user.copyWith(
                                  name: text,
                                ),
                                validator: loginController.validarNome,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'RG',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomTextformFieldGeneric(
                                icon: Image.asset('assets/images/rg.png'),
                                hint: '000000',
                                onSaved: (text) => user = user.copyWith(
                                  rg: text,
                                ),
                                validator: loginController.validarRg,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'Telefone',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomTextFieldPhone(
                                hint: '(00)00000-0000',
                                telefoneInformado: [
                                  telefoneMask(),
                                ],
                                validator: loginController.validarPhone,
                              ),
                              const SizedBox(height: 10),
                              const Text(
                                'CPF',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 10),
                              CustomTextformFieldCpf(
                                icon: Image.asset('assets/images/cpf.png'),
                                hint: '000.000.000-00',
                                cpfformatado: [
                                  CpfMask(),
                                ],
                                validator: loginController.validarCpf,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Country',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .083,
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  right: 16,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: const Color(0xA00F37EB),
                                  ),
                                ),
                                child: const CustomDropDownButton(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            width: 400,
                            height: 50,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.resolveWith<Color?>(
                                  (states) {
                                    return const Color(0xA00F37EB);
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
                                if (loginController.formKey.currentState!
                                    .validate()) {
                                  loginController.formKey.currentState!.save();
                                  Navigator.of(context)
                                      .pushReplacementNamed('/');
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
                                    'Confirm',
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
    );
  }
}
