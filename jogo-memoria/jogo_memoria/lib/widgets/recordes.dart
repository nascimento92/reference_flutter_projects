import 'package:flutter/material.dart';
import 'package:jogo_memoria/components/constants.dart';
import 'package:jogo_memoria/components/theme.dart';
import 'package:jogo_memoria/pages/records_page.dart';

class Record extends StatefulWidget {
  const Record({super.key});

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      color: Colors.grey[900],
      child:  Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                'Recordes',
                style: TextStyle(color: Round6Theme.color, fontSize: 22),
              ),
            ),
            ListTile(
              title: const Text('Modo Normal'),
              trailing: const Icon(Icons.chevron_right),
              onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecordesPage(modo: Modo.normal)));
              },
            ),
            ListTile(
              title: const Text('Modo Round 6'),
              trailing: const Icon(Icons.chevron_right),
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>RecordesPage(modo: Modo.round6)));
              },
            )
          ],
        ),
      ),
    );
  }
}
