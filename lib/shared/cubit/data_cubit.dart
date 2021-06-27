import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:dsc_world_app/model/country.dart';
import 'package:dsc_world_app/shared/cubit/data_states.dart';
import 'package:dsc_world_app/shared/network/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DataCubit extends Cubit<DscDataStates> {
  DataCubit() : super(DataInitialState());

  static DataCubit get(context) => BlocProvider.of(context);

  Map<String, dynamic> map = {};
  List<Country> data = [];
  String continent = '';
  Map<String, bool> favourites = {};
  List<Country> loadJsonData(String continentName) {
    rootBundle.loadString('assets/data/data.json').then((value) {
      map = json.decode(value);
      continent = getContinentSymbol(continentName);
      data = [];
      for (final key in map['countries'].keys) {
        final String continentName = map['countries'][key]['continent'];
        if (continent == continentName) {
          Country country = Country(
              key: key,
              name: map['countries'][key]['name'],
              native: map['countries'][key]['native'],
              phone: map['countries'][key]['phone'],
              continent: continent,
              capital: map['countries'][key]['capital'],
              currency: map['countries'][key]['currency'],
              languages: map['countries'][key]['languages']);
          data.add(country);
          emit(CountriesDataState());
        }
        data.forEach((element) {
          favourites.addAll({element.key: element.isFavourited});
        });
      }
      emit(CountriesDataState());

      return 'success';
    });
    emit(CountriesDataState());

    return data;
  }

  String getContinentSymbol(String continent) {
    String symbol = "";
    switch (continent) {
      case 'Africa':
        symbol = "AF";
        break;
      case 'Antarctica':
        symbol = "AN";
        break;
      case 'Asia':
        symbol = "AS";
        break;
      case 'Europe':
        symbol = "EU";
        break;
      case 'North America':
        symbol = "NA";
        break;
      case 'Australia':
        symbol = "OC";
        break;
      case 'South America':
        symbol = "SA";
        break;
      default:
    }
    return symbol;
  }

  List<String> favouritedCountries = [];

  void changeFavouriteStatus({required String key, required String name}) {

    if ( favouritedCountries.length > 0) {
      favouritedCountries=getFavourites();

    }
    if (favourites[key] == true|| CasheHelper.getFavourite(key:key)==true) {
      favourites[key] = false;
      favouritedCountries.remove(name);

    } else {
      favourites[key] = true;
      favouritedCountries.add(name);

    }

    CasheHelper.setFavourite(key: key, value: favourites[key]);
    CasheHelper.setFavourites(key: 'Favourites', values: favouritedCountries);

    emit(ChangeFavouriteState());
  }

  List<String> getFavourites() {
    return CasheHelper.getFavourites(key: 'Favourites');
  }

  List<String> filterCountryList = [];

  Future<List<String>> getCountrySearch(
      {required String search, required List<Country> countryList}) async {
    filterCountryList = [];
    if (search == "empty") return [];
    if (search == "error") throw Error();

    countryList.forEach((country) {
      if (country.name.toLowerCase() == search.toLowerCase() ||
          country.name == (search)) filterCountryList.add(search);
    });
    emit(SearchListState());
    return filterCountryList;
  }
}
