import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

class SelectCountry extends StatefulWidget {
  const SelectCountry({super.key});

  @override
  State<SelectCountry> createState() => _SelectCountryState();
}

class _SelectCountryState extends State<SelectCountry> {
  List<dynamic>? dataRetrived;
  List<dynamic>? data;
  var _searchController = TextEditingController();
  var searchValue = "";

  @override
  void initState() {
    _getData();
    super.initState();
  }

  Future _getData() async {
    final String response =
        await rootBundle.loadString('assets/CountryCodes.json');
    dataRetrived = await json.decode(response) as List<dynamic>;
    setState(() {
      data = dataRetrived;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: CustomScrollView(slivers: [
        const CupertinoSliverNavigationBar(
          largeTitle: Text('Select Country'),
          previousPageTitle: 'Edit Number',
        ),
        SliverToBoxAdapter(
          child: CupertinoSearchTextField(
            autocorrect: true,
            onChanged: (value) {
              setState(() {
                searchValue = value;
              });
            },
            controller: _searchController,
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            (data != null)
                ? data!
                    .where((e) => e['name']
                        .toString()
                        .toLowerCase()
                        .contains(searchValue.toLowerCase()))
                    .map((e) => CupertinoListTile(
                          onTap: () {
                            Navigator.pop(context,
                                {"name": e['name'], "code": e['dial_code']});
                          },
                          title: Text(e['name']),
                          trailing: Text(e['dial_code']),
                        ))
                    .toList()
                : [
                    const Center(
                      child: Text('Empty List'),
                    )
                  ],
          ),
        ),
      ]),
    );
  }
}
