class AleatorioModel {
  int _contador = 0;

  AleatorioModel(this._contador);

  AleatorioModel.vazio() {
    _contador = 0;
  }

  int get contador => _contador;

  set contador(int v) => _contador = v;
}