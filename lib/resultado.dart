import 'package:flutter/material.dart';

class TelaFinal extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;
  const TelaFinal(this.pontuacao, this.quandoReiniciarQuestionario,
      {super.key});

  String get fraseResultado {
    if (pontuacao < 10) {
      return "Você acertou nenhuma questão. Que pena ☹️";
    } else if (pontuacao < 20) {
      return "Você acertou uma questão";
    } else if (pontuacao < 30) {
      return "Você acertou duas questões";
    } else {
      return "Você Acertou todas as questões. Parabéns!!! 😀";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            textAlign: TextAlign.center,
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        ElevatedButton(
          onPressed: quandoReiniciarQuestionario,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amber,
          ),
          child: const Text(
            "Reiniciar?",
            style: const TextStyle(fontSize: 15),
          ),
        )
      ],
    );
  }
}
