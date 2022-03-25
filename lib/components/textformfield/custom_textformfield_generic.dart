import 'package:flutter/material.dart';

class CustomTextformFieldGeneric extends StatelessWidget {
  //fazendo componentização, para colocar cada um textFeild

  final void Function(String? text)? onSaved;
  final String? Function(String? text)? validator;
  final String? Function(String text)? onChanged;
  final bool obscureText;
  final Widget? icon;
  final Widget? suffix;
  final String? hint;

  const CustomTextformFieldGeneric({
    Key? key,
    this.obscureText = false,
    this.validator,
    this.onSaved,
    this.suffix,
    this.onChanged,
    this.icon,
    this.hint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // como é o textformField principal a componentizacao vai aqui so coloca variavel
    // ajuda na validaçoões e tem mais coisas que o textField
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      // reatividade,interação do usuario no campo
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // como sao todos TextFormField entao componetizei e por isso que so chama a funcao
      // validação simples
      validator: validator,
      onChanged: onChanged,

      onSaved: onSaved,

      obscureText: obscureText,

      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        prefixIcon: icon,
        suffixIcon: suffix,
        hintText: hint,
      ),
    );
  }
}
