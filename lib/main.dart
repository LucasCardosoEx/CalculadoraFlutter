import 'package:flutter/material.dart';

void main() {
  runApp(const MinhaCalculadora());
}

class MinhaCalculadora extends StatelessWidget {
  const MinhaCalculadora({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const CalculadoraPage(),
    );
  }
}

class CalculadoraPage extends StatefulWidget {
  const CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();
  
  String _resultado = "Resultado: ";

  void _calcular(String operacao) {
    double n1 = double.tryParse(_num1Controller.text) ?? 0;
    double n2 = double.tryParse(_num2Controller.text) ?? 0;
    double res = 0;

    setState(() {
      switch (operacao) {
        case 'Soma':
          res = n1 + n2;
          break;
        case 'Subtracao':
          res = n1 - n2;
          break;
        case 'Multiplicacao':
          res = n1 * n2;
          break;
        case 'Divisao':
          if (n2 == 0) {
            _resultado = "Erro: Divisão por 0";
            return;
          }
          res = n1 / n2;
          break;
      }
      _resultado = "Resultado: ${res.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _num1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o primeiro número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _num2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Digite o segundo número",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 25),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(onPressed: () => _calcular('Soma'), child: const Text("Somar")),
                ElevatedButton(onPressed: () => _calcular('Subtracao'), child: const Text("Subtrair")),
                ElevatedButton(onPressed: () => _calcular('Multiplicacao'), child: const Text("Multiplicar")),
                ElevatedButton(onPressed: () => _calcular('Divisao'), child: const Text("Dividir")),
              ],
            ),
            const SizedBox(height: 40),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}