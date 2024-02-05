// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$GameController on _GameControllerBase, Store {
  Computed<bool>? _$jogadaCompletaComputed;

  @override
  bool get jogadaCompleta =>
      (_$jogadaCompletaComputed ??= Computed<bool>(() => super.jogadaCompleta,
              name: '_GameControllerBase.jogadaCompleta'))
          .value;

  late final _$gameCardsAtom =
      Atom(name: '_GameControllerBase.gameCards', context: context);

  @override
  List<GameOpcao> get gameCards {
    _$gameCardsAtom.reportRead();
    return super.gameCards;
  }

  @override
  set gameCards(List<GameOpcao> value) {
    _$gameCardsAtom.reportWrite(value, super.gameCards, () {
      super.gameCards = value;
    });
  }

  late final _$scoreAtom =
      Atom(name: '_GameControllerBase.score', context: context);

  @override
  int get score {
    _$scoreAtom.reportRead();
    return super.score;
  }

  @override
  set score(int value) {
    _$scoreAtom.reportWrite(value, super.score, () {
      super.score = value;
    });
  }

  late final _$venceuAtom =
      Atom(name: '_GameControllerBase.venceu', context: context);

  @override
  bool get venceu {
    _$venceuAtom.reportRead();
    return super.venceu;
  }

  @override
  set venceu(bool value) {
    _$venceuAtom.reportWrite(value, super.venceu, () {
      super.venceu = value;
    });
  }

  late final _$perdeuAtom =
      Atom(name: '_GameControllerBase.perdeu', context: context);

  @override
  bool get perdeu {
    _$perdeuAtom.reportRead();
    return super.perdeu;
  }

  @override
  set perdeu(bool value) {
    _$perdeuAtom.reportWrite(value, super.perdeu, () {
      super.perdeu = value;
    });
  }

  late final _$escolherAsyncAction =
      AsyncAction('_GameControllerBase.escolher', context: context);

  @override
  Future escolher(GameOpcao opcao, Function resetCard) {
    return _$escolherAsyncAction.run(() => super.escolher(opcao, resetCard));
  }

  late final _$_GameControllerBaseActionController =
      ActionController(name: '_GameControllerBase', context: context);

  @override
  dynamic startGame({required GamePlay gamePlay}) {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.startGame');
    try {
      return super.startGame(gamePlay: gamePlay);
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic restartGame() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.restartGame');
    try {
      return super.restartGame();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic nextLevel() {
    final _$actionInfo = _$_GameControllerBaseActionController.startAction(
        name: '_GameControllerBase.nextLevel');
    try {
      return super.nextLevel();
    } finally {
      _$_GameControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
gameCards: ${gameCards},
score: ${score},
venceu: ${venceu},
perdeu: ${perdeu},
jogadaCompleta: ${jogadaCompleta}
    ''';
  }
}
