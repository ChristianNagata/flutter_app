import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BytebankApp());
}

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FormularioTransferencia(),
      ),
      debugShowCheckedModeBanner: true,
    );
  }
}

class FormularioTransferencia extends StatelessWidget {

  final TextEditingController _controladorCampoNumeroConta = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Criando transferência'),
      ),
      body: Column(
        children: [

          Editor(
              _controladorCampoNumeroConta,
              'Número da conta',
              '0000'
          ),
          Editor(
              _controladorCampoValor,
              'Valor',
              '0.00',
              Icons.monetization_on
          ),

          ElevatedButton(
            onPressed: () {
              final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
              final double? valor = double.tryParse(_controladorCampoValor.text);
              if (numeroConta != null && valor != null) {
                final transferenciaCriada = Transferencia(valor, numeroConta);
                debugPrint('$transferenciaCriada');
              }
            },
            child: const Text('Confirmar'),
          ),
        ],
      ),
    );
  }
}


class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transferências'),
      ),
      body: Column(
        children: [
          Itemtransferencia(Transferencia(100.0, 1040)),
          Itemtransferencia(Transferencia(150.1, 1660)),
          Itemtransferencia(Transferencia(300.3, 9000)),
          Itemtransferencia(Transferencia(105.5, 1900)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}


class Editor extends StatelessWidget {

  final TextEditingController controlador;
  final String rotulo;
  final String dica;
  final IconData? icone;

  Editor(this.controlador, this.rotulo, this.dica, [this.icone]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: const TextStyle(
            fontSize: 24.0
        ),
        decoration: InputDecoration(
          icon: icone != null ? Icon(icone) : null,
          labelText: rotulo,
          hintText: dica,
        ),
        keyboardType: TextInputType.number,
        controller: controlador,
      ),
    );
  }
}

class Itemtransferencia extends StatelessWidget {

  final Transferencia _transferencia;

  Itemtransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Card(
      child: ListTile(
        leading: const Icon(Icons.monetization_on),
        title: Text(_transferencia.valor.toString()),
        subtitle: Text(_transferencia.numeroConta.toString()),
      ),
    );
  }
}

class Transferencia {
  final double valor;
  final int numeroConta;

  Transferencia(this.valor, this.numeroConta);

  @override
  String toString() {
    return 'Transferencia{valor: $valor, numeroConta: $numeroConta}';
  }


}
