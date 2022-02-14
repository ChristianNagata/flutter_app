import 'package:flutter/material.dart';
import 'package:flutter_app/database/dao/transferencia_dao.dart';
import '../../components/editor.dart';
import '../../models/transferencia.dart';

const _tituloAppBar = Text('Criando transferência');

const _rotuloCampoValor = 'Valor';
const _dicaCampoValor = '0.00';

const _rotuloCampoNumeroConta = 'Número da conta';
const _dicaCampoNumeroConta = '0000';

const _rotuloCampoNome = 'Quem vai receber?';
const _dicaCampoNome = 'Nome Completo';

const _textoBotaoConfirmar = Text('Confirmar');

class FormularioTransferencia extends StatefulWidget {
  const FormularioTransferencia({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controladorCampoNumeroConta =
      TextEditingController();
  final TextEditingController _controladorCampoNome = TextEditingController();
  final TextEditingController _controladorCampoValor = TextEditingController();
  final TransferenciaDao _dao = TransferenciaDao();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: _tituloAppBar,
        backgroundColor: Theme.of(context).backgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Editor(
              _controladorCampoNome,
              _rotuloCampoNome,
              _dicaCampoNome,
              TextInputType.name,
            ),
            Editor(
              _controladorCampoNumeroConta,
              _rotuloCampoNumeroConta,
              _dicaCampoNumeroConta,
              TextInputType.number,
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
    final String nomeRecebedor = _controladorCampoNome.text;
    final int? numeroConta = int.tryParse(_controladorCampoNumeroConta.text);
    final double? valor = double.tryParse(_controladorCampoValor.text);
    if (numeroConta != null && valor != null) {
      final transferenciaCriada = Transferencia(nomeRecebedor, valor, numeroConta);
      _dao.saveTransferencia(transferenciaCriada).then((id) => Navigator.pop(context));
    }
  }
}
