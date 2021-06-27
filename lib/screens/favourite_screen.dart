import 'package:dsc_world_app/shared/components/components.dart';

import 'package:dsc_world_app/shared/cubit/data_cubit.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
                  List<String> favouriteCountries = DataCubit.get(context).getFavourites();

    return BlocConsumer<DataCubit, DscDataStates>(
            listener: (BuildContext context, DscDataStates state) {},
            builder: (BuildContext context, DscDataStates state) {
            return favouriteCountries == null
                  ? Container()
                  : favouriteCountries.length == 0
                  ? Container()
                  : Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) {
                            return countryWidget(
                                name: favouriteCountries[index],
                                context: context,
                                index: index,
                                favourited: true);
                          },
                          separatorBuilder: (context, index) => SizedBox(
                                height: 16,
                              ),
                          itemCount: favouriteCountries.length),
                    );
            });
  }
}
