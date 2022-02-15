import 'package:flutter/material.dart';
import 'package:flutter_app/http/webclients/transaction_webclient.dart';
import 'package:flutter_app/models/contact.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = Text('Criando transferência');

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _textoBotaoConfirmar = Text('Confirmar');

class FormularioTransferencia extends StatefulWidget {
  final Contact contact;

  FormularioTransferencia(this.contact, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FormularioTransferenciaState();
}

class _FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TransactionWebClient _webClient =TransactionWebClient();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: _tituloAppBar,
        backgroundColor: Theme
            .of(context)
            .backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                widget.contact.name,
                style: const TextStyle(
                  fontSize: 24.0,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                widget.contact.accountNumber.toString(),
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            Editor(
              _controladorCampoValor,
              _rotuloCampoValor,
              _dicaCampoValor,
              TextInputType.number,
              Icons.monetization_on,
            ),

            ElevatedButton(
              onPressed: () => _criaTransferencia(context),
              child: _textoBotaoConfirmar,
            ),

          ],
        ),
      ),
    );
  }

  void _criaTransferencia(BuildContext context) {
    final double? valor = double.tryParse(_controladorCampoValor.text);
    final transactionCreated = Transferencia(valor!, widget.contact);
    _webClient.save(transactionCreated).then((transaction) {
      Navigator.pop(context);
    });
  }
}

