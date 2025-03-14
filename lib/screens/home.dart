import 'package:flutter/material.dart';
import 'package:jokenpo/screens/results.dart';
import 'dart:math';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String escolhaUser = '';
  String escolhaApp = '';

  String appEscolher() {
    final escolhas = ['pedra', 'papel', 'tesoura'];
    final random = Random();
    return escolhas[random.nextInt(escolhas.length)];
  }

  String verificarResultado() {
    if (escolhaUser == escolhaApp) {
      return 'Empate';
    } else if ((escolhaUser == 'pedra' && escolhaApp == 'tesoura') ||
        (escolhaUser == 'tesoura' && escolhaApp == 'papel') ||
        (escolhaUser == 'papel' && escolhaApp == 'pedra')) {
      return 'Você venceu';
    } else {
      return 'Você perdeu';
    }
  }

  void userEscolher(String escolha) {
    setState(() {
      escolhaUser = escolha;
      escolhaApp = appEscolher();
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Results(
          escolhaUser: escolhaUser,
          escolhaApp: escolhaApp,
          resultado: verificarResultado(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: [
                Image.asset('assets/images/padrao.png', width: 200),
                const Text(
                  'Escolha do app (aleatório)',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () => userEscolher('pedra'),
                      child: Image.asset('assets/images/pedra.png', width: 100),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => userEscolher('papel'),
                      child: Image.asset('assets/images/papel.png', width: 100),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () => userEscolher('tesoura'),
                      child: Image.asset('assets/images/tesoura.png', width: 100),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Escolha do usuário',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}