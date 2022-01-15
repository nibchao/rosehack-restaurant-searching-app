import 'package:flutter/material.dart';
/*
class _HomePageState extends State<HomeScreen> {
  static const historyLength = 5;

  List<String> _searchHistory = [
    'fuchsia',
    'flutter',
    'widgets',
    'resocoder'
  ];

  List<String> filteredSearchHistory;

  List<String> filterSearchTerms({
  @required String filter,
}) {
    if (filter != null && filter.isNotEmpty)
      {
        return _searchHistory.reversed.where((term)) => term.startsWith(filter)).toList();
      }
    else
      {
        return _searchHistory.reversed.toList();
      }
  }

  String selectedTerm = "";

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      //
      body: SearchResultsListView(
        searchTerm: null,
      ),
    );
  }
}
*/

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Search Bar',
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Icon customIcon = const Icon(Icons.search);
  Widget customSearchBar = const Text('Restaurant Selector');
  Widget searchDescription = const Text('Enter your address and select a search radius');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {
            setState(() {
              if (customIcon.icon == Icons.search)
                {
                  customIcon = const Icon(Icons.cancel);
                  customSearchBar = const ListTile(
                  leading: Icon(Icons.search, color: Colors.white, size: 28),
                  title: TextField
                (decoration: InputDecoration(hintText: 'Enter address', hintStyle: TextStyle(color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic), border: InputBorder.none),
                  style: TextStyle(color: Colors.white),
                ),
                );
                }
              else
                {
                  customIcon = const Icon(Icons.search);
                  customSearchBar = const Text('Restaurant Selector');
                }
            });
          }, icon: customIcon)
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: searchDescription,
          ),
        ],
      ),
    );
  }
}


