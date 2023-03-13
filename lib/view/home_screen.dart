import 'dart:developer';

import 'package:bloc_random_api/logic/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    log('entire page rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Api Fetching'),
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          log('Specific section is rebuilding');
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(state.result.toString()),
              ],
            ),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          context.read<HomeBloc>().add(FetchApiEvent());
        },
        label: const Text('Add'),
      ),
    );
  }
}
