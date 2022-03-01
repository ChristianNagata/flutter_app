import 'package:flutter/material.dart';
import 'package:flutter_app/components/centered_message.dart';
import 'package:flutter_app/http/webclients/transaction_webclient.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = Text('Transferências');

class ListaTransferencias extends StatefulWidget {
  const ListaTransferencias({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  final TransactionWebClient _webClient = TransactionWebClient();

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: _tituloAppBar,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: FutureBuilder<List<Transferencia>>(
          future: _webClient.findAll(),
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
                return const CenteredMessage('No transactions founded', icon: Icons.warning,);
            }
            return const CenteredMessage('Unknown Error', icon: Icons.warning,);
          },
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
          title: Text('R\$ ${_transferencia.value.toString()}'),
          subtitle:
              Text('conta: ${_transferencia.contact.accountNumber.toString()}'),
        ),
      );
}
