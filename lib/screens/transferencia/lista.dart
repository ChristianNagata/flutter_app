import 'package:flutter/material.dart';
import 'package:flutter_app/components/centered_message.dart';
import 'package:flutter_app/http/webclient.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = Text('Transferências');

class ListaTransferencias extends StatefulWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: _tituloAppBar,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: FutureBuilder<List<Transferencia>>(
          future: findAll(),
          initialData: const [],
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                break;
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if (snapshot.hasData) {
                  final List<Transferencia>? transferencias = snapshot.data;
                  if (transferencias != null) {
                    return ListView.builder(
                      itemBuilder: (context, index) {
                        final Transferencia transferencia =
                            transferencias[index];
                        return Itemtransferencia(transferencia);
                      },
                      itemCount: transferencias.length,
                    );
                  }
                }
                return CenteredMessage('No transactions founded');
                break;
            }
            return CenteredMessage('Unknown Error');
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(
              MaterialPageRoute(
                builder: (context) => const FormularioTransferencia(),
              ),
            )
                .then((value) {
              setState(() {
                widget.createState();
              });
            });
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );
}

class Itemtransferencia extends StatelessWidget {
  final Transferencia _transferencia;

  const Itemtransferencia(this._transferencia, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Card(
        child: ListTile(
          leading: const Icon(
            Icons.monetization_on,
            color: Colors.green,
          ),
          title: Text('R\$ ${_transferencia.valor.toString()}'),
          subtitle:
              Text('conta: ${_transferencia.contact.accountNumber.toString()}'),
        ),
      );
}
