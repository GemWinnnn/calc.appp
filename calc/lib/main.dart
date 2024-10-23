import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  TextEditingController firstNumberController = TextEditingController();
  TextEditingController secondNumberController = TextEditingController();

  int additionResult = 0;
  int subtractionResult = 0;
  int multiplicationResult = 0;
  double divisionResult = 0;

  void calculateAddition() {
    int num1 = int.tryParse(firstNumberController.text) ?? 0;
    int num2 = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      additionResult = num1 + num2;
    });
  }

  void calculateSubtraction() {
    int num1 = int.tryParse(firstNumberController.text) ?? 0;
    int num2 = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      subtractionResult = num1 - num2;
    });
  }

  void calculateMultiplication() {
    int num1 = int.tryParse(firstNumberController.text) ?? 0;
    int num2 = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      multiplicationResult = num1 * num2;
    });
  }

  void calculateDivision() {
    int num1 = int.tryParse(firstNumberController.text) ?? 0;
    int num2 = int.tryParse(secondNumberController.text) ?? 0;

    setState(() {
      divisionResult = num2 != 0 ? num1 / num2 : double.infinity;
    });
  }

  void clearAll() {
    setState(() {
      firstNumberController.clear();
      secondNumberController.clear();
      additionResult = 0;
      subtractionResult = 0;
      multiplicationResult = 0;
      divisionResult = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calculator",
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            Text(
              "Gem Win Canete | BSCS 3B AI",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: calculateAddition,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: firstNumberController,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" + "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumberController,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" = "),
                Expanded(
                  child: Text("$additionResult"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.remove),
                  onPressed: calculateSubtraction,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: firstNumberController,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" - "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumberController,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" = "),
                Expanded(
                  child: Text("$subtractionResult"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: calculateMultiplication,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: firstNumberController,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" × "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumberController,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" = "),
                Expanded(
                  child: Text("$multiplicationResult"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Text(
                    "÷",
                    style: TextStyle(fontSize: 24),
                  ),
                  onPressed: calculateDivision,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: firstNumberController,
                    decoration:
                        const InputDecoration(labelText: "First Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" ÷ "),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: secondNumberController,
                    decoration:
                        const InputDecoration(labelText: "Second Number"),
                    keyboardType: TextInputType.number,
                  ),
                ),
                const SizedBox(width: 10),
                const Text(" = "),
                Expanded(
                  child: Text(
                    divisionResult.isNaN ? "Undefined" : "$divisionResult",
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: clearAll,
              child: const Text("Clear all"),
            ),
          ],
        ),
      ),
    );
  }
}
