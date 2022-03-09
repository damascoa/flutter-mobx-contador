import 'package:comodoro/store/comodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EntradaTempo extends StatelessWidget {
  final String titulo;
  final int valor;
  final void Function()? inc;
  final void Function()? dec;

  const EntradaTempo(
      {Key? key, required this.titulo, required this.valor, this.inc, this.dec})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<Comodorostore>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(this.titulo, style: TextStyle(fontSize: 25)),
        SizedBox(height: 10),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: this.dec,
            child: Icon(Icons.arrow_downward, color: Colors.white),
            style: ElevatedButton.styleFrom(
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
                shape: CircleBorder(),
                padding: EdgeInsets.all(15)),
          ),
          Text(
            '${this.valor} min',
            style: TextStyle(fontSize: 18),
          ),
          ElevatedButton(
            onPressed: this.inc,
            child: Icon(Icons.arrow_upward, color: Colors.white),
            style: ElevatedButton.styleFrom(
                primary: store.estaTrabalhando() ? Colors.red : Colors.green,
                shape: CircleBorder(),
                padding: EdgeInsets.all(15)),
          ),
        ]),
      ],
    );
  }
}
