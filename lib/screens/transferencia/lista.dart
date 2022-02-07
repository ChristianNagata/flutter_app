
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
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const FormularioTransferencia();
        })).then((transferenciaRecebida) {
            _atualiza(transferenciaRecebida);
        });

      },
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
      leading: const Icon(Icons.monetization_on),
      title: Text(_transferencia.valor.toString()),
      subtitle: Text(_transferencia.numeroConta.toString()),
    ),
  );
}