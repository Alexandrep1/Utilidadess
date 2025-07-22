import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Eventos
abstract class CounterEvents {}

class IncrementEvent extends CounterEvents {}

class DecrementEvent extends CounterEvents {}

// Estado
class CounterState {
  final int counter;
  CounterState(this.counter);
}

// bloc
class CounterBloc extends Bloc<CounterEvents, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<IncrementEvent>((event, emit) {
      emit(CounterState(state.counter + 1));
    });

    on<DecrementEvent>((event, emit) {
      emit(CounterState(state.counter - 1));
    });
  }
}

// View
class BlocExampleView extends StatelessWidget {
  const BlocExampleView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child: Builder(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(title: const Text('Eu gosto de pornoGay')),
            body: Center(
              child: BlocBuilder<CounterBloc, CounterState>(
                builder: (context, state) {
                  return Text(
                    'Contador: ${state.counter}',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
            ),
            floatingActionButton: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FloatingActionButton(
                  heroTag: 'btn1',
                  onPressed: () {
                    context.read<CounterBloc>().add(IncrementEvent());
                  },
                  child: const Icon(Icons.add),
                ),
                const SizedBox(height: 20),
                FloatingActionButton(
                  heroTag: 'btn2',
                  onPressed: () {
                    context.read<CounterBloc>().add(DecrementEvent());
                  },
                  child: const Icon(Icons.remove),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
