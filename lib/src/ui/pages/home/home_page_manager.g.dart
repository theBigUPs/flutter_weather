// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_manager.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomePageManager on _HomePageManager, Store {
  late final _$temperatureAtom =
      Atom(name: '_HomePageManager.temperature', context: context);

  @override
  String get temperature {
    _$temperatureAtom.reportRead();
    return super.temperature;
  }

  @override
  set temperature(String value) {
    _$temperatureAtom.reportWrite(value, super.temperature, () {
      super.temperature = value;
    });
  }

  late final _$buttonUnitAtom =
      Atom(name: '_HomePageManager.buttonUnit', context: context);

  @override
  String get buttonUnit {
    _$buttonUnitAtom.reportRead();
    return super.buttonUnit;
  }

  @override
  set buttonUnit(String value) {
    _$buttonUnitAtom.reportWrite(value, super.buttonUnit, () {
      super.buttonUnit = value;
    });
  }

  late final _$_temperatureAtom =
      Atom(name: '_HomePageManager._temperature', context: context);

  @override
  double get _temperature {
    _$_temperatureAtom.reportRead();
    return super._temperature;
  }

  @override
  set _temperature(double value) {
    _$_temperatureAtom.reportWrite(value, super._temperature, () {
      super._temperature = value;
    });
  }

  late final _$cityAtom = Atom(name: '_HomePageManager.city', context: context);

  @override
  String get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$descAtom = Atom(name: '_HomePageManager.desc', context: context);

  @override
  String get desc {
    _$descAtom.reportRead();
    return super.desc;
  }

  @override
  set desc(String value) {
    _$descAtom.reportWrite(value, super.desc, () {
      super.desc = value;
    });
  }

  late final _$loadWeatherWithCityNameAsyncAction =
      AsyncAction('_HomePageManager.loadWeatherWithCityName', context: context);

  @override
  Future<void> loadWeatherWithCityName({required String cityName}) {
    return _$loadWeatherWithCityNameAsyncAction
        .run(() => super.loadWeatherWithCityName(cityName: cityName));
  }

  late final _$loadWeatherLatLonAsyncAction =
      AsyncAction('_HomePageManager.loadWeatherLatLon', context: context);

  @override
  Future<void> loadWeatherLatLon(
      {required double latitude, required double longtitude}) {
    return _$loadWeatherLatLonAsyncAction.run(() =>
        super.loadWeatherLatLon(latitude: latitude, longtitude: longtitude));
  }

  @override
  String toString() {
    return '''
temperature: ${temperature},
buttonUnit: ${buttonUnit},
city: ${city},
desc: ${desc}
    ''';
  }
}
