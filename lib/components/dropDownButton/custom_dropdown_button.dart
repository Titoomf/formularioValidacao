import 'package:flutter/material.dart';

import '../../modules/models/dropdownbutton/custom_dropItem_model.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({Key? key}) : super(key: key);

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  final List<CustomDropItem> itens = [
    CustomDropItem(
      image: 'assets/images/brasil.png',
      text: 'Brasil',
    ),
    CustomDropItem(
      image: 'assets/images/coreia_do_sul.png',
      text: 'Coreia do Sul',
    ),
    CustomDropItem(
      image: 'assets/images/chile.png',
      text: 'Chile',
    ),
    CustomDropItem(
      image: 'assets/images/bandeira.png',
      text: 'Indonésia',
    ),
  ];
  late CustomDropItem selectedItems;

  @override
  void initState() {
    super.initState();
    selectedItems = itens[3];
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<CustomDropItem>(
      decoration: const InputDecoration(
        border: InputBorder.none,
      ),
      items: itens
          .map(
            (e) => DropdownMenuItem(
              child: Row(
                children: [
                  Row(
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: Image.asset(e.image),
                      ),
                    ],
                  ),
                  Text(e.text),
                ],
              ),
              value: e,
            ),
          )
          .toList(),
      onChanged: (value) {
        setState(() {
          selectedItems = value!;
        });
      },
      value: selectedItems,
      onSaved: (value) {
        setState(
          () {
            // selectedItems = value.toString() as CustomDropItem;
          },
        );
      },
      validator: (value) {
        if (value == null) {
          return "can't empty";
        } else {
          return null;
        }
      },
    );
  }
}
