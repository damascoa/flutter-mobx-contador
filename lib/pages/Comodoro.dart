import 'package:comodoro/components/Cronometro.dart';
import 'package:comodoro/components/EntradaTempo.dart';
import 'package:comodoro/store/comodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class Comodoro extends StatelessWidget {
  const Comodoro({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Comodorostore>(context);

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Cronometro()),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 40.0),
          child: Observer(
              builder: (_) => Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      EntradaTempo(
                          titulo: "Trabalho",
                          valor: store.tempoTrabalho,
                          inc: store.iniciado && store.estaTrabalhando() ? null : store.incrementarTempoTrabalho,
                          dec: store.iniciado && store.estaTrabalhando() ? null : store.decrementarTempoTrabalho),
                      EntradaTempo(
                          titulo: "Descanso",
                          valor: store.tempoDescanso,
                          inc: store.iniciado && store.estaDescansando() ? null : store.incrementarTempoDescanso,
                          dec: store.iniciado && store.estaDescansando() ? null : store.decrementarTempoDescanso),
                    ],
                  )),
        )
      ],
    ));
  }
}
