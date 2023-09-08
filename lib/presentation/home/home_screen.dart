import 'package:demo_bloc_currency/core/utils/app_navigator.dart';
import 'package:demo_bloc_currency/core/utils/app_routes.dart';
import 'package:demo_bloc_currency/presentation/home/bloc/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _haveController = TextEditingController();
  final _wantController = TextEditingController();
  final _amountController = TextEditingController();

  @override
  void dispose() {
    _haveController.dispose();
    _wantController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Currency Count'),
        centerTitle: true,
        shadowColor: Colors.grey,
        elevation: 1,
      ),
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeLoaddedState) {
            _amountController.clear();
            _haveController.clear();
            _wantController.clear();
          }
        },
        builder: (context, state) {
          if (state is HomeLoadingState) {
            return Container(
              alignment: Alignment.center,
              child: const CircularProgressIndicator(),
            );
          }
          return Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              children: [
                TextField(
                  controller: _haveController,
                  decoration: const InputDecoration(
                    hintText: 'Enter currency type that you have.',
                  ),
                ),
                TextField(
                  controller: _wantController,
                  decoration: const InputDecoration(
                    hintText: 'Enter currency type that you want.',
                  ),
                ),
                TextField(
                  controller: _amountController,
                  decoration: const InputDecoration(
                    hintText: 'Enter convert value.',
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    if (_isValid()) {
                      context.read<HomeBloc>().add(
                            GetCurrencyDataEvent(
                              haveCurrency: _haveController.text.trim(),
                              wntCurrency: _wantController.text.trim(),
                              amountCurrency: _amountController.text.trim(),
                            ),
                          );
                    }
                  },
                  child: const Text('Submit'),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                TextButton(
                  onPressed: () {
                    AppNavigation.intent(
                      context,
                      AppRoutes.covidScreen,
                    );
                  },
                  child: const Text('Next Screen'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  bool _isValid() {
    return _haveController.text.trim().isNotEmpty &&
        _wantController.text.trim().isNotEmpty &&
        _amountController.text.trim().isNotEmpty;
  }
}
