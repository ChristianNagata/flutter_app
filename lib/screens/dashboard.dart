import 'package:flutter/material.dart';
import 'package:flutter_app/screens/contacts_list.dart';
import 'package:flutter_app/screens/transferencia/lista.dart';

const _textoBotaoContatos = 'Transferir';
const _textoBotaoTransferencias = 'Transferências';
const _titleAppBar = Text('Dashboard');

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: _titleAppBar,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('images/bytebank_logo.png'),
          SizedBox(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _FeatureItem(
                  _textoBotaoContatos,
                  Icons.monetization_on,
                  onClick: () => _showContactsList(context),
                ),
                _FeatureItem(
                  _textoBotaoTransferencias,
                  Icons.account_balance,
                  onClick: () => _showTransactionsList(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showContactsList(BuildContext context) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ContactsList()));

  void _showTransactionsList(BuildContext context) => Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const ListaTransferencias()));
}

class _FeatureItem extends StatelessWidget {
  final String name;
  final IconData icone;
  final Function onClick;

  _FeatureItem(this.name, this.icone, {required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () => onClick(),
          child: SizedBox(
            height: 90,
            width: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icone,
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
