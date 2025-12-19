import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

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
      appBar: AppBar(),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Título antes da imagem
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 16.0,
              ),
              child: Text(
                '🍪 Biscoito da Sorte',
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                  letterSpacing: 1.0,
                ),
              ),
            ),

            Image.asset(
              'assets/images/fortune_cookie.png',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16.0,
              ),
              child: Text(
                _currentFortune,
                textAlign: TextAlign.center,
                style: GoogleFonts.raleway(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 0.5,
                  color: const Color.fromARGB(221, 106, 106, 106),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 450.0,
                vertical: 16.0,
              ), // espaço lateral e vertical
              child: ElevatedButton(
                onPressed: _randomFortune,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 0,
                  backgroundColor: Colors.deepPurple, // cor principal
                  padding:
                      EdgeInsets.zero, // mantém o padding interno como zero
                ),
                child: Text(
                  'Pegue sua sorte!',
                  style: GoogleFonts.raleway(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Quer saber mais?  ',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Colors.black87,
                      ),
                    ),
                    TextSpan(
                      text: 'Clique aqui.',
                      style: GoogleFonts.inter(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.deepPurple,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ],
                ),
              ),
            ),

Padding(
  padding: const EdgeInsets.symmetric(vertical: 24.0),
  child: RichText(
    textAlign: TextAlign.center,
    text: TextSpan(
      children: [
        TextSpan(
          text: 'Feito com ❤️ por Camila Scholl',
          style: GoogleFonts.inter(
            fontSize: 10,
            fontWeight: FontWeight.w400,
            color: Colors.black87,
          ),
        ),
      ],
    ),
  ),
)


          ],
        ),
      ),
    );
  }
}
