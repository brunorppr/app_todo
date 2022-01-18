import 'package:flutter/material.dart';

class Formulario extends StatelessWidget {
  final formkey = GlobalKey<FormState>();
  final _controler = TextEditingController();

  get value => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
        ),
        body: Form(
            key: formkey,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      controller: _controler,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'o campo não foi preenchido';
                        }
                      },
                      decoration: InputDecoration(hintText: 'nome'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState?.validate() == true)
                          (Navigator.of(context).pop(_controler.text));
                      },
                      child: Text('salvar'),
                    ),
                  ],
                ),
              ),
            )));
  }
}
