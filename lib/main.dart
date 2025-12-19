import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Biscoito da Sorte',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _currentFortune = '';

  final List<String> _fortuneList = [
    'Coisas boas acontecem quando você confia no seu caminho.',
    'Um pequeno passo hoje pode mudar tudo amanhã.',
    'A resposta que você procura virá no momento certo.',
    'Você é mais forte do que imagina.',
    'Novas oportunidades surgem quando você se permite tentar.',
  ];

@override
  void initState() {
    super.initState();
    _randomFortune(); 
  }

  void _randomFortune() {
    final random = Random();
    final int fortune = random.nextInt(_fortuneList.length);

    setState(() {
      _currentFortune = _fortuneList[fortune];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Biscoito da Sorte App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Image.asset('assets/images/fortune_cookie.png', 
            width: 200, 
            height: 200, 
            fit: BoxFit.cover,
            ),
            Card(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    _currentFortune,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
            
            ElevatedButton(onPressed: _randomFortune, child: Text('Pegue sua sorte!'))
          ],
        ),
      ),
      
    );
  }
}
