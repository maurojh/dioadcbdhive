import 'package:dioadcbdhive/aleatorio_model.dart';
import 'package:hive/hive.dart';

class AleatorioRepository {
  static late Box _caixa;

  // construtor vazio só para ser retornado
  AleatorioRepository._cria();

  // chama sem criar objeto: static
  static Future<AleatorioRepository> carrega() async {
    if(Hive.isBoxOpen('box_numeros_aleatorios')) {
      _caixa = Hive.box('box_numeros_aleatorios');
    } else {
      _caixa = await Hive.openBox('box_numeros_aleatorios');
    }
    return AleatorioRepository._cria();
  }

  void salvar(AleatorioModel aleatorioModel) {
    // nome e map
    _caixa.put('aleatorioModel', {
      'contador': aleatorioModel.contador
    });
  }

  AleatorioModel obterDados() {
    var aleatorio = _caixa.get('aleatorioModel');

    return AleatorioModel(aleatorio['contador']);
  }
    
}