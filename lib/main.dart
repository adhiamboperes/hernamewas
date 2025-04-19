import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HerNameWas.org',
      theme: ThemeData(
        colorSchemeSeed: const Color(0xFFFCF8F3),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}

typedef MenuEntry = DropdownMenuEntry<String>;

class HomePage extends StatelessWidget {
  HomePage({super.key});

  static const List<String> counties = <String>[
    'County',
    'Nairobi',
    'Kakamega',
    'Mombasa',
  ];
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    counties.map<MenuEntry>(
      (String name) => MenuEntry(value: name, label: name),
    ),
  );

  static const List<String> caseStatus = <String>[
    'Case Status',
    'Arrest Made',
    'Mentioned in Court',
    'Trial Ongoing',
    'Conviction',
    'Open',
  ];
  static final List<MenuEntry> caseStatusMenuEntries =
      UnmodifiableListView<MenuEntry>(
        caseStatus.map<MenuEntry>(
          (String name) => MenuEntry(value: name, label: name),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(242, 238, 233, 1),
        foregroundColor: const Color(0xFFD35757),
        centerTitle: true,
        toolbarHeight: 100.0,
        title: const Text(
          'Her Name Was...',
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color(0xFFFCF8F3),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 16.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Flexible(
                    flex: 1,
                    child: SearchAnchor(
                      builder: (
                        BuildContext context,
                        SearchController controller,
                      ) {
                        return SearchBar(
                          controller: controller,
                          hintText: 'Search',
                          backgroundColor: WidgetStatePropertyAll(
                            Color(0xFFFCF8F3),
                          ),
                          elevation: const WidgetStatePropertyAll(0),
                          padding: const WidgetStatePropertyAll<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 8.0),
                          ),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                4.0,
                              ), 
                              side: const BorderSide(
                                color: Colors.black, 
                                width: 1.0, 
                              ),
                            ),
                          ),
                          onTap: () {
                            controller.openView();
                          },
                          onChanged: (_) {
                            controller.openView();
                          },
                          trailing: [const Icon(Icons.search, size: 20)],
                        );
                      },
                      suggestionsBuilder: (
                        BuildContext context,
                        SearchController controller,
                      ) {
                        return List<ListTile>.generate(5, (int index) {
                          final String item = 'item $index';
                          return ListTile(
                            title: Text(item),
                            onTap: () {
                              // todo something
                            },
                          );
                        });
                      },
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: DropdownMenu<String>(
                      initialSelection: counties.first,
                      onSelected: (String? value) {
                        // setState(() {
                        //   dropdownValue = value!;
                        // });
                      },
                      dropdownMenuEntries: menuEntries,
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: DropdownMenu<String>(
                      initialSelection: caseStatus.first,
                      onSelected: (String? value) {
                        // setState(() {
                        //   dropdownValue = value!;
                        // });
                      },
                      dropdownMenuEntries: caseStatusMenuEntries,
                    ),
                  ),
                ],
              ),
            ),
            const Text('This is the home page', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
