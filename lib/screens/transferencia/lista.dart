import 'package:flutter/material.dart';

import '../../models/transferencia.dart';
import 'formulario.dart';

const _tituloAppBar = Text('Transferências');

class ListaTransferencias extends StatefulWidget {
  final List<Transferencia> _transferencias = [];

  @override
  State<StatefulWidget> createState() => ListaTransferenciasState();
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: _tituloAppBar,
          backgroundColor: Theme.of(context).backgroundColor,
        ),
        body: ListView.builder(
          itemCount: widget._transferencias.length,
          itemBuilder: (context, index) {
            final transferencia = widget._transferencias[index];
            return Itemtransferencia(transferencia);
          },
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        const FormularioTransferencia())).then(
                (transferenciaRecebida) => _atualiza(transferenciaRecebida));
          },
          backgroundColor: Theme.of(context).primaryColor,
        ),
      );

  void _atualiza(Transferencia? transferenciaRecebida) {
    if (transferenciaRecebida != null) {
      setState(() {
        widget._transferencias.add(transferenciaRecebida);
      });
    }
  }
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
          subtitle: Text('Conta: ${_transferencia.numeroConta.toString()}'),
        ),
      );
}
