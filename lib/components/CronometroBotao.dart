import 'package:comodoro/store/comodoro.store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CronometroBotao extends StatelessWidget {
  final String texto;
  final IconData icone;
  final void Function()? click;

  const CronometroBotao({Key? key, required this.texto, required this.icone, this.click})
      : super(key: key);

  @override
  Widget build(BuildContext context) {

   final store = Provider.of<Comodorostore>(context);

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          primary: Colors.black,
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          textStyle: TextStyle(fontSize: 25)),
      onPressed: click,
      child: Row(children: [
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Icon(
            this.icone,
            size: 35,
          ),
        ),
        Text(this.texto)
      ]),
    );
  }
}