import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class _HomeScreenState extends State<HomeScreen> {
  Widget customSearchBar = const Text('Restaurant Selector');
  Widget searchDescription = const Text('Enter your address and select a search radius');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: customSearchBar,
        automaticallyImplyLeading: false,
        centerTitle: true
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton (
              child: Text('Search for Restaurants'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SearchPage())),
            )

            ),
          ],
      ),
      );
  }
}

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super( key : key );

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
      title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
        color: Colors.white),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                  onPressed: () {

                  },
              ),
              hintText: 'Search...',
              border: InputBorder.none),
            ),
          ),
        ),
      )
    );
  }
}

//import 'package:material_floating_search_bar/material_floating_search_bar.dart';

//void main() => runApp(MyApp());

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
  //_HomePageState createState() => _HomePageState();
  _HomeScreenState createState() => _HomeScreenState();
}

/*class _HomePageState extends State<HomeScreen> {
  static const searchHistoryLength = 5;

  final List<String> _searchHistory = ['1', '2', '3', '4'];

  List<String> filteredSearchHistory = [];
  String selectedTerm = '';
  String filter = '';

  List<String> filterSearchTerms({
  @required filter,
}) {
    if (filter != null && filter.isNotEmpty)
      {
        return _searchHistory.reversed.where((term) => term.startsWith(filter)).toList();
    }
    else
      {
        return _searchHistory.reversed.toList();
      }
  }

  void addSearchTerm(String term)
  {
    if (_searchHistory.contains(term))
      {
        putSearchTermsFirst(term);
        return;
      }
    _searchHistory.add(term);
    if (_searchHistory.length > searchHistoryLength)
      {
        _searchHistory.removeRange(0, _searchHistory.length - searchHistoryLength);
      }
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void deleteSearchTerm(String term)
  {
    _searchHistory.removeWhere((element) => element == term);
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  void putSearchTermsFirst(String term)
  {
    deleteSearchTerm(term);
    addSearchTerm(term);
  }

  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      body: FloatingSearchBar(
        controller: controller,
        body: const FloatingSearchBarScrollNotifier(
          child: SearchResultsListView(searchTerm: selectedTerm),
      ),
        transition: CircularFloatingSearchBarTransition(),
        physics: const BouncingScrollPhysics(),
        title: Text('Search Bar', style: Theme.of(context).textTheme.headline5),
        hint: 'Search...',
        actions: [
          FloatingSearchBarAction.searchToClear(),
        ],
        onQueryChanged: (query)
        {
          setState(() {
            filteredSearchHistory = filterSearchTerms(filter: query);
          });
        },
        onSubmitted: (query)
        {
          setState(() {
            addSearchTerm(query);
            selectedTerm = query;
          });
          controller.close();
        }, builder: (context, transition) {
          return ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: const Material(
              color: Colors.white,
              elevation: 4,
              child: Placeholder(
                fallbackHeight: 200,
              ),
            ),
          );
      },
    )
    );
  }

  late FloatingSearchBarController controller;

  @override
  void initState()
  {
    super.initState();
    controller = FloatingSearchBarController();
    filteredSearchHistory = filterSearchTerms(filter: null);
  }

  @override
  void dispose()
  {
    controller.dispose();
    super.dispose();
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
              const Icon(
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


*/

