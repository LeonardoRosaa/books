import 'package:books/presentation/presentation.dart';
import 'package:books/presentation/widgets/icon.dart';
import 'package:flutter/material.dart';

const color =
{
50:Color.fromRGBO(91,94,166, .1),
100:Color.fromRGBO(91,94,166, .2),
200:Color.fromRGBO(91,94,166, .3),
300:Color.fromRGBO(91,94,166, .4),
400:Color.fromRGBO(91,94,166, .5),
500:Color.fromRGBO(91,94,166, .6),
600:Color.fromRGBO(91,94,166, .7),
700:Color.fromRGBO(91,94,166, .8),
800:Color.fromRGBO(91,94,166, .9),
900:Color.fromRGBO(91,94,166, 1),
};

const colorCustom = MaterialColor(0xFF5B5EA6, color);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: colorCustom,
        textTheme: const TextTheme(
          displaySmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          bodyMedium: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        colorScheme: const ColorScheme.light(
          background: Colors.white,
          primary: Color(0xFF5B5EA6),
          secondary: Color(0xFF263D36),
          tertiary: Color(0xFFE1EBE8),
          outline: Color(0xFF181A19),
        ),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AppIcon.bell('Bell'),
            AppIcon.calendar('calendar'),
            AppIcon.play('play'),
            AppIcon.search('search'),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
