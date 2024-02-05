import 'package:hive/hive.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/model/game_play.dart';
import 'package:mobx/mobx.dart';
part 'recordes_repository.g.dart';

class RecordesRepository = _RecordesRepositoryBase with _$RecordesRepository;

abstract class _RecordesRepositoryBase with Store {

  late final Box _recordes;
  late final GamePlay gameplay;

  @observable
  Map recordesRound6 = {};

  @observable
  Map recordesNormal = {};

  RecordesRepository(){
    _initRepository();
  }

  _initRepository() async{
    await _initDatabase();
    await loadRecordes();
  }

  _initDatabase() async{
    _recordes = await Hive.openBox('gameRecordes');
  }

  @action
  loadRecordes(){
    recordesNormal = _recordes.get(Modo.normal.toString()) ?? {};
    recordesRound6 = _recordes.get(Modo.round6.toString()) ?? {}; 
  }

  updateRecordes({required GamePlay gameplay, required int score}){
    final key = gameplay.modo.toString();

    if(gameplay.modo == Modo.normal && (recordesNormal[gameplay.nivel] == null || score < recordesNormal[gameplay.nivel])){
      recordesNormal[gameplay.nivel] = score;
      _recordes.put(key, recordesNormal);
    }else if(gameplay.modo == Modo.round6 && (recordesRound6[gameplay.nivel] == null || score > recordesRound6[gameplay.nivel])){
      recordesRound6[gameplay.nivel] = score;
      _recordes.put(key, recordesRound6);
    }
  }
  
}