import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/page/home.dart';
import 'package:flutter_sample/page/splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context,child){
      return  MaterialApp(
        title: 'Welcome to Flutter',
        theme: ThemeData(
          primaryColor: Colors.white,
        ),
        home: const Scaffold(
          body: Center(
            child: HomePage(),
          ),
        ),
      );
    });

  }
}


class RandomWords extends StatefulWidget {
  const RandomWords({Key? key}) : super(key: key);

  @override
  _RandomWordsState createState() => _RandomWordsState();
}

class _RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final Set<WordPair> _saved = {};
  final _biggerFont = const TextStyle(fontSize: 18);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("page1"),
        actions: <Widget>[
          IconButton(onPressed: _pushSaved, icon: const Icon(Icons.list))
        ],
      ),
      body: _buildSuggestions(),
    );
  }

  void _pushSaved2() {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) {
          final Iterable<ListTile> tiles = _saved.map(
            (WordPair pair) {
              return ListTile(
                title: Text(
                  pair.asPascalCase,
                  style: _biggerFont,
                ),
              );
            },
          );
          final List<Widget> divided = ListTile.divideTiles(
            context: context,
            tiles: tiles,
          ).toList();

          return Scaffold(
            // 新增 6 行代码开始 ...
            appBar: AppBar(
              title: const Text('Saved Suggestions'),
            ),
            body: ListView(children: divided),
          ); // ... 新增代码段结束.
        },
      ),
    );
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return page2();
    }));
  }

  Widget page2() {
    final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
      return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
    });

    final List<Widget> divided =
        ListTile.divideTiles(context: context, tiles: tiles).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text("page2"),
      ),
      body: ListView(children: divided,),
    );
  }

  ListView _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, i) {
          if (i.isOdd) return const Divider();
          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair wordPair) {
    final isContains = _saved.contains(wordPair);
    return ListTile(
      title: Text(
        wordPair.asPascalCase,
        style: _biggerFont,
      ),
      trailing: Icon(
        isContains ? Icons.favorite : Icons.favorite_border,
        color: isContains ? Colors.red : null,
      ),
      onTap: () {
        setState(() {
          if (isContains) {
            _saved.remove(wordPair);
          } else {
            _saved.add(wordPair);
          }
        });
      },
    );
  }
}
