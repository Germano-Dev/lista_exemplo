import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:
          false, //retira a tarja de Debug da visualização
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      //darkTheme: ThemeData.dark(), deixa o tema da tela escuro
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Contato> contatos = [];

  @override
  void initState() {
    super.initState();
    contatos.add(new Contato(
        nome: 'Joao', telefone: '99999-9699', tipo: ContatoType.Celular));
    contatos.add(new Contato(
        nome: 'Maria', telefone: '99999-9698', tipo: ContatoType.trabalho));
    contatos.add(new Contato(
        nome: 'Pedro', telefone: '99999-9697', tipo: ContatoType.Casa));
    contatos.add(new Contato(
        nome: 'André', telefone: '99999-9696', tipo: ContatoType.Celular));
    contatos.add(new Contato(
        nome: 'Beatriz', telefone: '99999-9695', tipo: ContatoType.Favorito));
    contatos.add(new Contato(
        nome: 'Luiza', telefone: '99999-9694', tipo: ContatoType.trabalho));
    contatos.add(new Contato(
        nome: 'Marta', telefone: '99999-9693', tipo: ContatoType.Favorito));
    contatos.add(new Contato(
        nome: 'Cláudia', telefone: '99999-9692', tipo: ContatoType.trabalho));
    contatos.add(new Contato(
        nome: 'Anderson', telefone: '99999-9691', tipo: ContatoType.Casa));
    contatos.add(new Contato(
        nome: 'Mário', telefone: '99999-9690', tipo: ContatoType.Favorito));
    contatos.sort((a, b) => a.nome.compareTo(b.nome));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, index) {
          var contato = contatos[index];
          return ListTile(
            leading: CircleAvatar(
              child: ContatoHelper.getIconByContatoType(contato.tipo),
              backgroundColor: Colors.blue[200],
            ),
            title: Text(contato.nome),
            subtitle: Text(contato.telefone),
            trailing: IconButton(
              icon: Icon(Icons.call),
              onPressed: () => {},
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: contatos.length,
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Contato {
  final String nome;
  final String telefone;
  final ContatoType tipo;
  Contato({required this.nome, required this.telefone, required this.tipo});
}

enum ContatoType { Celular, trabalho, Favorito, Casa }

class ContatoHelper {
  static Icon getIconByContatoType(ContatoType tipo) {
    switch (tipo) {
      case ContatoType.Celular:
        return Icon(Icons.phone_android, color: Colors.green[700]);
      case ContatoType.trabalho:
        return Icon(Icons.work, color: Colors.brown[600]);
      case ContatoType.Favorito:
        return Icon(Icons.star, color: Colors.yellow[600]);
      case ContatoType.Casa:
        return Icon(
          Icons.home,
          color: Colors.purple[600],
        );
    }
  }
}
