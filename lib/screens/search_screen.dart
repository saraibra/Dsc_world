import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/shared/components/components.dart';
import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key, required this.countryList}) : super(key: key);
  final List<Country> countryList;
  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();

    return BlocConsumer<DataCubit, DscDataStates>(
      listener: (context, state) {},
      builder: (context, state) {
        List<String> list = DataCubit.get(context).filterCountryList;

        return Scaffold(
          appBar: AppBar(),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: defaultTextFormField(
                  context: context,
                    controller: searchController,
                    type: TextInputType.text,
                    onChanged: (value) {
                      DataCubit.get(context).getCountrySearch(
                          search: value, countryList: countryList);
                      list = DataCubit.get(context).filterCountryList;
                    },
                    validate: (value) {
                      if (value.isEmpty) {
                        return 'Search must be not empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    icon: Icons.search),
              ),
              list.length > 0
                  ? Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: searchItem(name: list[0], context: context),
                  )
                  : Container(),
            ],
          ),
        );
      },
    );
  }
}
