class Transferencia {
  final String nomeRecebedor;
  final double valor;
  final int numeroConta;

  Transferencia(
    this.nomeRecebedor,
    this.valor,
    this.numeroConta,
  );

  @override
  String toString() {
    return 'Transferencia{nomeRecebedor: $nomeRecebedor, valor: $valor, numeroConta: $numeroConta}';
  }
}
