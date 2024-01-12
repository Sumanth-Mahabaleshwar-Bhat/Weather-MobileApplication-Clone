import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
      home: WeatherApp()
  ));
}

class WeatherApp extends StatelessWidget {
  var timeData = ['11:00', '12:00', '13:00', '14:00'];
  var tempData = ['18°C', '7°C', '6°C', '-3°C'];
  var iconData = ['android/assets/sunny.png', 'android/assets/cloudy.png', 'android/assets/sunnyWindy.png', 'android/assets/sunnyWindy.png'];
  var backgroundImage = ['android/assets/sunnyBackgroundImage.png', 'android/assets/cloudyBackgroundImage.png', 'android/assets/windyBackgroundImage.png', 'android/assets/windyBackgroundImage.png'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
          },
        ),
        title: const Column(
          children: [
            Text('New York, USA'),
            Text('Hourly Weather')
          ],
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: timeData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(backgroundImage[index]),
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(
                          Colors.black.withOpacity(0.3), // Adjust opacity value as needed
                          BlendMode.darken,
                        )
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            timeData[index],
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text(
                              tempData[index],
                              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white)
                          ),
                          Image.asset(iconData[index],
                              height: 50,
                              width: 50
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                                DateFormat('dd/MM/yyyy').format(DateTime.now()),
                                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                const Divider(
                  color: Colors.white,   // Color of the divider
                  thickness: 0.5,        // Thickness of the divider
                  height: 2.0,         // Height of the divider
                ),
                DataContainer(index),
                const Divider(
                  color: Colors.white,
                  height: 2.0,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class DataContainer extends StatelessWidget {
  var humidityData = ['44%', '38%', '34%', '34%'];
  var precipitationData = ['0 mm', '0 mm', '0.00508 mm', '0.10205 mm'];
  var windChillData = ['3', '4', '5', '2'];
  var windSpeedData = ['12 km/h', '14 km/h', '17 km/h', '20 km/h'];
  var dewPointData = ['-6', '-6', '-7', '-7'];
  var cloudCoverData = ['18%', '47%', '77%', '80%'];
  var pressureData = ['1016mbar', '1016mbar', '1015mbar', '1000mbar'];
  var windDirectData = ['West North', 'West South', 'West', 'West North'];
  var backgroundImage = ['android/assets/sunnyBackgroundImage.png', 'android/assets/cloudyBackgroundImage.png', 'android/assets/windyBackgroundImage.png', 'android/assets/windyBackgroundImage.png'];

  int index;

  DataContainer(this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundImage[index]),
              fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.3), // Adjust opacity value as needed
                  BlendMode.darken,
                )
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DataRow(label: 'Humidity: ', value: humidityData[index]),
                DataRow(label: 'Precipitation: ', value: precipitationData[index]),
                DataRow(label: 'Wind chill: ', value: windChillData[index]),
                DataRow(label: 'Wind speed: ', value: windSpeedData[index]),
              ],
            ),
            Column(
              children: [
                DataRow(label: 'Dew Point: ', value: dewPointData[index]),
                DataRow(label: 'Cloud Cover: ', value: cloudCoverData[index]),
                DataRow(label: 'Pressure: ', value: pressureData[index]),
                DataRow(label: 'Wind Direct: ', value: windDirectData[index]),
              ],
            )
          ],
        ),
    );
  }
}

class DataRow extends StatelessWidget {
  String label;
  String value;

  DataRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 15.5,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(value,
              style: const TextStyle(
                  fontSize: 15.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
        ],
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
