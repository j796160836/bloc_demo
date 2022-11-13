import 'package:bloc_demo/my_bloc.dart';
import 'package:bloc_demo/my_bloc_state.dart';
import 'package:bloc_demo/score_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'my_bloc_event.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late MyBloc _myBloc;

  @override
  void initState() {
    super.initState();
    _myBloc = MyBloc(scoreRepo: ScoreRepository());
  }

  @override
  void dispose() {
    _myBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: BlocBuilder<MyBloc, MyBlocState>(
            bloc: _myBloc,
            builder: (context, state) {
              if (state is SmileState) {
                return const Text('😄', style: TextStyle(fontSize: 70));
              } else if (state is CryingState) {
                return const Text('😭', style: TextStyle(fontSize: 70));
              } else if (state is ErrorState) {
                return const Text('🙄', style: TextStyle(fontSize: 70));
              }
              return const Text('😐', style: TextStyle(fontSize: 70));
            }),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _myBloc.add(GetScoringDataEvent());
        },
        tooltip: 'Get Score',
        child: const Text('Go!'),
      ),
    );
  }
}
