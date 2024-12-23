import 'package:flutter/material.dart';

class EVCal extends StatefulWidget {
  const EVCal({super.key});

  @override
  State<EVCal> createState() => _EVCalState();
}

class _EVCalState extends State<EVCal> {
  final _controllers = {
    'current_soc': TextEditingController(),
    'target_soc': TextEditingController(),
    'charge_rate': TextEditingController(),
    'volt': TextEditingController(),
    'battery_kwh': TextEditingController(),
    'eff': TextEditingController(),
  };
  double _wattCharge = 0.0;
  double _chargeTime = 0.0;

  void calculate() {
    if (_controllers['current_soc']!.text.isEmpty ||
        _controllers['target_soc']!.text.isEmpty ||
        _controllers['charge_rate']!.text.isEmpty ||
        _controllers['volt']!.text.isEmpty ||
        _controllers['battery_kwh']!.text.isEmpty ||
        _controllers['eff']!.text.isEmpty) {
      return;
    }

    final currentSoc = double.parse(_controllers['current_soc']!.text);
    final targetSoc = double.parse(_controllers['target_soc']!.text);
    final chargeRate = double.parse(_controllers['charge_rate']!.text);
    final volt = double.parse(_controllers['volt']!.text);
    final batteryKwh = double.parse(_controllers['battery_kwh']!.text);
    final eff = double.parse(_controllers['eff']!.text);

    final chgPwr = (volt * chargeRate) / 1000;
    final chgTime =
        (targetSoc - currentSoc) * batteryKwh / 100 / (chgPwr * eff);
    setState(() {
      _wattCharge = chgPwr;
      _chargeTime = chgTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EV App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              debugPrint('Search Tap');
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              debugPrint('Notifications Tap');
            },
          ),
        ],
      ),
      // Week 4
      body: Column(
        children: [
          const Image(
            image: AssetImage('assets/images/img2.png'),
          ),
          // Scroll Layout
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const Text(
                      'EV Charging Calculator',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controllers['current_soc'],
                            decoration: const InputDecoration(
                              icon: Icon(Icons.battery_0_bar),
                              labelText: 'Current SOC %',
                              hintText: 'Enter %',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _controllers['target_soc'],
                            decoration: const InputDecoration(
                              icon: Icon(Icons.battery_full),
                              labelText: 'Target SOC %',
                              hintText: 'Enter %',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _controllers['charge_rate'],
                            decoration: const InputDecoration(
                              icon: Icon(Icons.power),
                              labelText: 'Charge Rate (A)',
                              hintText: 'Enter A',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: TextField(
                            controller: _controllers['volt'],
                            decoration: const InputDecoration(
                              icon: Icon(Icons.bolt),
                              labelText: 'Volt (V)',
                              hintText: 'Enter V',
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _controllers['battery_kwh'],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.battery_full),
                        labelText: 'Battery kWh',
                        hintText: 'Enter V',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    TextField(
                      controller: _controllers['eff'],
                      decoration: const InputDecoration(
                        icon: Icon(Icons.savings),
                        labelText: 'Eff %',
                        hintText: 'Enter Eff %',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    ElevatedButton.icon(
                      onPressed: () {
                        calculate();
                      },
                      icon: const Icon(Icons.check),
                      iconAlignment: IconAlignment.end,
                      label: const Text('Calculate'),
                    ),
                    const SizedBox(height: 10),
                    Card(
                      color: const Color.fromRGBO(255, 220, 24, 1),
                      child: ListTile(
                        leading: const Icon(Icons.bolt),
                        title: const Text('Watt Charge (kWh)'),
                        subtitle: Text(
                          _wattCharge.toStringAsFixed(4),
                        ),
                      ),
                    ),
                    Card(
                      color: const Color.fromARGB(255, 23, 137, 109),
                      child: ListTile(
                        leading: const Icon(
                          Icons.fast_forward,
                          color: Colors.white,
                        ),
                        title: const Text(
                          'Charge Time',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          _chargeTime.toStringAsFixed(3),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
