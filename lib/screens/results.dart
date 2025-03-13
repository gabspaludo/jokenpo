import 'package:flutter/material.dart';

class Results extends StatelessWidget {
  final String escolhaUser;
  final String escolhaApp;
  final String resultado;

  const Results({
    super.key,
    required this.escolhaUser,
    required this.escolhaApp,
    required this.resultado,
  });

  String getImagePath(String escolha) {
    switch (escolha) {
      case 'pedra':
        return 'assets/images/pedra.png';
      case 'papel':
        return 'assets/images/papel.png';
      case 'tesoura':
        return 'assets/images/tesoura.png';
      default:
        return 'assets/images/padrao.png';
    }
  }

  String resultImagem() {
    if (resultado == 'Empate') {
      return 'assets/images/empatou.png';
    } else if (resultado == 'Você venceu') {
      return 'assets/images/venceu.png';
    } else {
      return 'assets/images/perdeu.png';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Resultado',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Image.asset(getImagePath(escolhaApp), width: 100),
                const Text(
                  'Escolha do App',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Image.asset(getImagePath(escolhaUser), width: 100),
                const Text(
                  'Escolha do Usuário',
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            Column(
              children: [
                Image.asset(resultImagem(), width: 100, fit: BoxFit.contain),
                const SizedBox(height: 10),
                Text(
                  resultado,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: const Text(
                    'Jogar novamente',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
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