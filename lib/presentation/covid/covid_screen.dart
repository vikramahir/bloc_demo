import 'package:demo_bloc_currency/presentation/covid/cubit/covid_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CovidScreen extends StatefulWidget {
  const CovidScreen({super.key});

  @override
  State<CovidScreen> createState() => _CovidScreenState();
}

class _CovidScreenState extends State<CovidScreen> {
  final _animalController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Covid History'),
        centerTitle: true,
      ),
      body: BlocConsumer<CovidCubit, CovidState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CovidLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          } else if (state is CovidLoadedState) {
            return Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Text(state.animalData.name),
                ],
              ),
            );
          } else if (state is CovidErorState) {
            return Text(state.errrorMessage);
          } else {
            return TextField(
              controller: _animalController,
              onSubmitted: (value) {
                context
                    .read<CovidCubit>()
                    .getAnimalsData(animalName: value.trim());
              },
              decoration: const InputDecoration(
                hintText: 'Enter currency type that you have.',
              ),
            );
          }
        },
      ),
    );
  }
}
