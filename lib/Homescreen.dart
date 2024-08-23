import 'package:bmi_calc/Screens/ExerciseScreen.dart';
import 'package:bmi_calc/Screens/superfoods_screen.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // the controller for the text field associated with "height"
  final _heightController = TextEditingController();

  // the controller for the text field associated with "weight"
  final _weightController = TextEditingController();

  double? _bmi;
  // the message at the beginning
  String _message = 'Please enter your height and weight';

  // Background color for different BMI categories
  Color _backgroundColor = Colors.black87;

  // Emoji and warning sign widgets
  Widget? _emoji;
  Widget? _warningSign;

  // This function is triggered when the user presses the "Calculate" button
  void _calculate() {
    final double? height = double.tryParse(_heightController.value.text);
    final double? weight = double.tryParse(_weightController.value.text);

    // Check if the inputs are valid
    if (height == null || height <= 0 || weight == null || weight <= 0) {
      setState(() {
        _message = "Your height and weight must be positive numbers";
      });
      return;
    }

    setState(() {
      _bmi = weight / (height * height);

      if (_bmi! < 18.5) {
        _message = "You are underweight";
        _backgroundColor = Colors.yellow[100]!;
        _emoji = const Text("😞", style: TextStyle(fontSize: 40));
        _warningSign = null; // No warning sign for underweight
      } else if (_bmi! < 25) {
        _message = 'You body is fine';
        _backgroundColor = Colors.green[200]!;
        _emoji = const Text("😊", style: TextStyle(fontSize: 40));
        _warningSign = null; // No warning sign for normal
      } else if (_bmi! < 30) {
        _message = 'You are overweight';
        _backgroundColor = Colors.red[100]!;
        _emoji = const Text("😟", style: TextStyle(fontSize: 40));
        _warningSign = const Text("⚠️",
            style: TextStyle(fontSize: 40, color: Colors.black));
      } else {
        _message = 'You are obese';
        _backgroundColor = Colors.red[600]!;
        _emoji = const Text("😨", style: TextStyle(fontSize: 40));
        _warningSign =
            const Text("❗️", style: TextStyle(fontSize: 40, color: Colors.red));
      }
    });
  }

  // This function is triggered when the user presses the "Reset" button
  void _reset() {
    setState(() {
      _heightController.text = '';
      _weightController.text = '';
      _bmi = null;
      _message = 'Please enter your height and weight';
      _backgroundColor = Colors.black87;
      _emoji = null;
      _warningSign = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(60.0), // Customize the AppBar height
        child: AppBar(
          elevation: 0, // Remove the AppBar shadow
          backgroundColor: const Color.fromARGB(
              145, 81, 224, 33), // Make the AppBar transparent
          title: const Text(
            'BMI Calculator',
            style: TextStyle(
              color: Colors.black,
              fontSize: 24.0, // Customize the title font size
              fontWeight: FontWeight.bold, // Make the title bold
            ),
          ),
          centerTitle: true, // Center the title horizontally
        ),
      ),
      body: AnimatedContainer(
        duration: const Duration(seconds: 1), // Animation duration
        color: _backgroundColor,
        child: Center(
          child: SizedBox(
            width: 320,
            child: Neumorphic(
              style: const NeumorphicStyle(
                shape: NeumorphicShape.convex,
                depth: 5,
                lightSource: LightSource.topLeft,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration:
                          const InputDecoration(labelText: 'Height (m)'),
                      controller: _heightController,
                    ),
                    TextField(
                      keyboardType:
                          const TextInputType.numberWithOptions(decimal: true),
                      decoration: const InputDecoration(
                        labelText: 'Weight (kg)',
                      ),
                      controller: _weightController,
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        NeumorphicButton(
                          onPressed: _calculate,
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.convex,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(10)),
                            color: Colors.blueAccent,
                          ),
                          child: const Text(
                            'Calculate',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        NeumorphicButton(
                          onPressed: _reset,
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.convex,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(10)),
                            color: Colors.black,
                          ),
                          child: const Text(
                            'Reset',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text(
                      _bmi == null ? 'No Result' : _bmi!.toStringAsFixed(2),
                      style: const TextStyle(fontSize: 50),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      _message,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _emoji ?? Container(), // Display emoji
                        const SizedBox(width: 20),
                        _warningSign ?? Container(), // Display warning sign
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const SuperfoodScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Nutrition',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const ExerciseScreen(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Text(
                              'Exercises',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
