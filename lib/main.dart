import 'package:flutter/material.dart';

import 'formulario.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'app todo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => Home(),
        '/formulario': (context) => Formulario(),
      },
      initialRoute: '/',
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool hidepassword = true;

  get adicionarItem => null;

  List<String> itens = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Center(
        child: Text('lista de tarefas'),
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final resultado =
              Navigator.of(context).pushNamed('/formulario').then((value) {
            if (value != null) {
              setState(() {
                itens.add(value.toString());
              });
            }
          });
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blueGrey,
      ),
      body: SafeArea(
        child: ListView.builder(
            itemCount: itens.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  ListTile(
                    title: Text(
                      '${index + 1} - ${itens[index]}',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  Divider(color: Colors.black)
                ],
              );
            }),
      ),
    );
  }
}
