

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BmiCalculator(),
    );
  }
}

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  TextEditingController ageController = TextEditingController();
  TextEditingController ftController = TextEditingController();
  TextEditingController inchController = TextEditingController();
  TextEditingController wtController = TextEditingController();
  double ans = 0.0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculation'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.replay_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded))
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: ageController,
                      decoration: InputDecoration(labelText: 'Age'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: ftController,
                      decoration: InputDecoration(labelText: 'Ht(ft)'),
                    ),
                  ),
                  SizedBox(
                    width: 50,
                    child: TextFormField(
                      controller: inchController,
                      decoration: InputDecoration(labelText: 'Ht(in)'),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.male, size: 30)),
                  Text('|', style: TextStyle(fontSize: 24)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.female, size: 30)),
                  SizedBox(
                    width: 100,
                    child: TextFormField(
                      controller: wtController,

                      decoration: InputDecoration(labelText: 'Weight(kg)'),
                    ),
                  ),
                  IconButton(onPressed: () {
                    double? ft = double.tryParse(ftController.text) ?? 0;
                    double? inc = double.tryParse(inchController.text) ?? 0;
                    double? wt = double.tryParse(wtController.text) ?? 0;

                    double meter = (ft * 12 + inc) * 0.0254;


                    ans = wt / (meter * meter);

                    setState(() {

                    });
                  }, icon: Icon(Icons.chevron_right)),
                ],
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 200,
                child: SfRadialGauge(
                  axes: <RadialAxis>[
                    RadialAxis(
                      minimum: 15,
                      maximum: 40,
                      ranges: <GaugeRange>[
                        GaugeRange(startValue: 15, endValue: 18, color: Colors.red),
                        GaugeRange(startValue: 18, endValue: 24, color: Colors.green),
                        GaugeRange(startValue: 24, endValue: 30, color: Colors.yellow),
                        GaugeRange(startValue: 30, endValue: 40, color: Colors.red),

                      ],
                      pointers: <GaugePointer>[
                    NeedlePointer(value: ans),

                      ],
                      annotations: <GaugeAnnotation>[
                        GaugeAnnotation(
                          widget: Container(
                            child: Text(
                          ans.toStringAsFixed(1),
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        )

      ),
                          angle: 90,
                          positionFactor: 0.5,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Very Severely Underweight',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.red.shade900,
                        ),
                      ),
                      Text(
                        '< 15.0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Severely Underweight',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange.shade900,
                        ),
                      ),
                      Text(
                        '16.0 – 16.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Underweight',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.orange,
                        ),
                      ),
                      Text(
                        '17.0 – 18.4',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Normal (Healthy weight)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.green.shade700,
                        ),
                      ),
                      Text(
                        '18.5 – 24.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Overweight',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.amber.shade800,
                        ),
                      ),
                      Text(
                        '25.0 – 29.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Obese Class I (Moderate)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange,
                        ),
                      ),
                      Text(
                        '30.0 – 34.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Obese Class II (Severe)',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.deepOrange.shade700,
                        ),
                      ),
                      Text(
                        '35.0 – 39.9',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Text(
                          'Obese Class III (Very Severe or Morbid Obesity)',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Text(
                        '≥ 40.0',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }
}
