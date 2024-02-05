import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/repositories/recordes_repository.dart';
import 'package:provider/provider.dart';

class RecordesPage extends StatelessWidget {
  final Modo modo;
  //final List<String> recs = ['Modo', 'Nível 8', 'Nível 10', 'Nível 12'];
  RecordesPage({super.key, required this.modo});

  getModo() {
    return modo == Modo.normal ? 'Normal' : 'Round 6';
  }

  List<Widget> getRecordesList(Map recordes) {
    final List<Widget> widget = [];

    recordes.forEach((nivel, score) {
      widget.add(ListTile(
        title: Text('Nivel $nivel'),
        trailing: Text(score.toString()),
        tileColor: Colors.grey[900],
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ));

      widget.add(const Divider(
        color: Colors.transparent,
      ));
    });

    if (widget.isEmpty) {
      widget.add(const Center(
        child: Text('SEM DADOS'),
      ));
    }

    return widget;
  }

  @override
  Widget build(BuildContext context) {
    final repository = Provider.of<RecordesRepository>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recordes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Observer(
            builder: (context) => Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 36, bottom: 24),
                      child: Center(
                        child: Text(
                          'Modo ${getModo()}',
                          style: const TextStyle(
                              fontSize: 28, color: Round6Theme.color),
                        ),
                      ),
                    ),
                    ...getRecordesList(modo == Modo.normal
                        ? repository.recordesNormal
                        : repository.recordesRound6)
                  ],
                )),
      ),
    );
  }
}
