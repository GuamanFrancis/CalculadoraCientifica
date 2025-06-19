import 'package:flutter/material.dart';
import 'calculator_logic.dart'; 

void main() {
  runApp(const ScientificCalculatorApp());
}

class ScientificCalculatorApp extends StatelessWidget {
  const ScientificCalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculadora Científica',
      home: ScientificCalculator(),
    );
  }
}

class ScientificCalculator extends StatefulWidget {
  const ScientificCalculator({super.key});

  @override
  State<ScientificCalculator> createState() => _ScientificCalculatorState();
}

class _ScientificCalculatorState extends State<ScientificCalculator> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  String result = '';
  String operation = ''; 
  bool isSecondFieldVisible = true;

  
  void toggleSecondField(String operation) {
    setState(() {
      if (operation == "Raíz" || operation == "Seno" || operation == "Coseno" || operation == "Tangente" || operation == "Logaritmo" || operation == "Número Primo") {
        isSecondFieldVisible = false;
      } else {
        isSecondFieldVisible = true;
      }
      this.operation = operation; 
    });
  }

  @override
  void dispose() {
    controller1.dispose();
    controller2.dispose();
    super.dispose();
  }

 
  Widget buildInputFields() {
    return Column(
      children: [
        TextField(
          controller: controller1,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
            labelText: 'Número 1',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
        
        if (isSecondFieldVisible)
          TextField(
            controller: controller2,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Número 2 (si aplica)',
              border: OutlineInputBorder(),
            ),
          ),
      ],
    );
  }


  Widget buildOperationButton(String label, VoidCallback onPressed) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
    );
  }

 
  Widget buildOperationsGrid() {
    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: [
      
        buildOperationButton("Suma", () {
          toggleSecondField("Suma");
          double a = double.tryParse(controller1.text) ?? 0;
          double b = double.tryParse(controller2.text) ?? 0;
          setState(() {
            result = suma(a, b).toString();
          });
        }),

        
        buildOperationButton("Resta", () {
          toggleSecondField("Resta");
          double a = double.tryParse(controller1.text) ?? 0;
          double b = double.tryParse(controller2.text) ?? 0;
          setState(() {
            result = resta(a, b).toString();
          });
        }),

       
        buildOperationButton("Multiplicación", () {
          toggleSecondField("Multiplicación");
          double a = double.tryParse(controller1.text) ?? 0;
          double b = double.tryParse(controller2.text) ?? 0;
          setState(() {
            result = multiplicacion(a, b).toString();
          });
        }),

        
        buildOperationButton("División", () {
          toggleSecondField("División");
          double a = double.tryParse(controller1.text) ?? 0;
          double b = double.tryParse(controller2.text) ?? 0;
          setState(() {
            result = division(a, b).toString();
          });
        }),

      
        buildOperationButton("Potencia", () {
          toggleSecondField("Potencia");
          double a = double.tryParse(controller1.text) ?? 0;
          double b = double.tryParse(controller2.text) ?? 0;
          setState(() {
            result = potencia(a, b).toString();
          });
        }),

        
        buildOperationButton("Raíz", () {
          toggleSecondField("Raíz");
          double a = double.tryParse(controller1.text) ?? 0;
          setState(() {
            result = raiz(a, 0).toString();  
          });
        }),

        
        buildOperationButton("Seno", () {
          toggleSecondField("Seno");
          double a = double.tryParse(controller1.text) ?? 0;
          setState(() {
            result = seno(a, 0).toString();  
          });
        }),

     
        buildOperationButton("Coseno", () {
          toggleSecondField("Coseno");
          double a = double.tryParse(controller1.text) ?? 0;
          setState(() {
            result = coseno(a, 0).toString(); 
          });
        }),

        // Botón con lógica: Tangente
        buildOperationButton("Tangente", () {
          toggleSecondField("Tangente");
          double a = double.tryParse(controller1.text) ?? 0;
          setState(() {
            result = tangente(a, 0).toString();  
          });
        }),

       
        buildOperationButton("Número Primo", () {
          toggleSecondField("Número Primo");
          double a = double.tryParse(controller1.text) ?? 0;
          setState(() {
            result = esPrimo(a, 0).toString();  
          });
        }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculadora Científica'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Seleccione una operación para ingresar los valores, luego presione nuevamente el botón para obtener el resultado de la operación.",
                style: TextStyle(fontSize: 16, fontStyle: FontStyle.italic, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 24),
        
            Text(
              operation.isEmpty ? 'Seleccione una operación' : 'Operación: $operation',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            buildInputFields(),
            const SizedBox(height: 24),
            buildOperationsGrid(),
            const SizedBox(height: 24),
            Text(
              'Resultado: $result',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
