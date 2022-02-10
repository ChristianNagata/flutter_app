import 'package:flutter/material.dart';
import 'package:flutter_app/screens/contacts_list.dart';
import 'package:flutter_app/screens/transferencia/lista.dart';

const _textoBotaoContatos = 'Constatos';
const _textoBotaoTransferencias = 'Transferências';
const _titleAppBar = Text('Dashboard');

class Dashboard extends StatelessWidget {
  final ContactsList _contactsList = ContactsList();
  final ListaTransferencias _listaTransferencias = ListaTransferencias();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: _titleAppBar,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('images/bytebank_logo.png'),
            _botao(
              context,
              _contactsList,
              _textoBotaoContatos,
            ),
            _botao(
              context,
              _listaTransferencias,
              _textoBotaoTransferencias,
            )
          ],
        ),
      ),
    );
  }

  Padding _botao(BuildContext context, page, name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => page));
          },
          child: SizedBox(
            height: 90,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.people,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
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
