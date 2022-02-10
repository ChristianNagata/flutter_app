import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController _controlador;
  final String _rotulo;
  final String _dica;
  final TextInputType _inputType;
  final IconData? _icone;

  Editor(this._controlador, this._rotulo, this._dica, this._inputType, [this._icone]);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: TextField(
        style: const TextStyle(fontSize: 24.0),
        decoration: InputDecoration(
          icon: _icone != null ? Icon(_icone) : null,
          labelText: _rotulo,
          hintText: _dica,
        ),
        keyboardType: _inputType,
        controller: _controlador,
      ),
    );
  }
}
