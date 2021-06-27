import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/screens/search_screen.dart';
import 'package:dsc_world_app/shared/components/components.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CountriesScreen extends StatelessWidget {
  final String name;
  const CountriesScreen({Key? key, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<DataCubit, DscDataStates>(
      listener: (BuildContext context, DscDataStates state) {},
      builder: (BuildContext context, DscDataStates state) {
        DataCubit cubit = DataCubit.get(context);

        List<Country> data = cubit.loadJsonData(name);
        return Scaffold(
          appBar: AppBar(
            title: Text(name),
            actions: [
              IconButton(
                  onPressed: () => navigateTo(
                      context,
                      SearchScreen(
                        countryList: data,
                      )),
                  icon: Icon(Icons.search))
            ],
          ),
          body: Padding(
              padding: const EdgeInsets.all(16.0),
              child: buildCountryList(data, context)),
        );
      },
    );
  }
}
