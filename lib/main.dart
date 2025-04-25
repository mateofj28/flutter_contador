import 'package:contador/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
      ),
      home: BlocProvider(
        create: ( context ) => CounterBloc(),
        child: MyHomePage()
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Contador App"),
      ),
      body: Center(
        
        child: Column(
          
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // aqui se define el value en este caso 4, es decir incrementara 4.
                FloatingActionButton(
                  onPressed: (){
                    BlocProvider.of<CounterBloc>(context).add(SetValueIncreOrDecreValueEvent(value: 4));
                  },
                  tooltip: 'Increment 4',
                  child: const Icon(Icons.looks_4_outlined),
                ),

                FloatingActionButton(
                  onPressed: (){
                    BlocProvider.of<CounterBloc>(context).add(SetValueIncreOrDecreValueEvent(value: 5));
                  },
                  tooltip: 'Increment 5',
                  child: const Icon(Icons.looks_5_outlined),
                ),

                FloatingActionButton(
                  onPressed: (){
                    BlocProvider.of<CounterBloc>(context).add(SetValueIncreOrDecreValueEvent(value: 6));
                  },
                  tooltip: 'Increment 6',
                  child: const Icon(Icons.looks_6_outlined),
                ),
              ],
            ),

            SizedBox(height: 200),

            const Text('You have pushed the button this many times:'),

            BlocBuilder<CounterBloc, CounterState>(
              builder: (_, state){
                return Text(
                  '${state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }
            )

            
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(IncrementCounterEvent());
            },
            tooltip: 'Increment',
            backgroundColor: Colors.green,
            child: const Icon(Icons.add, color: Colors.white),
          ),

          SizedBox(width: 10),

          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(DecrementCounterEvent());
            },
            tooltip: 'Decrement',
            backgroundColor: Colors.redAccent,
            child: const Icon(Icons.remove, color: Colors.white),
          ),

          SizedBox(width: 10),

          // aqui se incrementa considerando el valor de value definido arriba.
          FloatingActionButton(
            onPressed: (){
              BlocProvider.of<CounterBloc>(context).add(ClearCounterEvent());
            },
            tooltip: 'Resent',
            backgroundColor: Colors.blueGrey,
            child: const Icon(Icons.clear, color: Colors.white),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
