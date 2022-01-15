import 'package:flutter/material.dart';

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
  _HomePageState createState() => _HomePageState();
//_HomeScreenState createState() => _HomeScreenState();
}

class _HomePageState extends State<HomeScreen> {
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

class SearchResultsListView extends StatelessWidget {
  final String searchTerm = "";

  const SearchResultsListView({
    Key key;
    @required this.searchTerm
}) : super(key : key);

  @override
  Widget build(BuildContext context) {
    if (searchTerm == null)
      {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search,
                size: 64,
              ),
              Text(
                'Start searching',
                style:Theme.of(context).textTheme.headline5,
              )
            ],
          )
        );
      }

      return ListView(
      children: List.generate(50, (index) => ListTile(title: Text('$searchTerm search result'), subtitle: Text(index.toString()),
      ),
      ),
      );
  }
}

/*
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
*/


