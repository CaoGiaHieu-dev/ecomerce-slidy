// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'google_map_picker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$GoogleMapPickerController on _GoogleMapPickerControllerBase, Store {
  final _$selectedPlaceAtom =
      Atom(name: '_GoogleMapPickerControllerBase.selectedPlace');

  @override
  PickResult get selectedPlace {
    _$selectedPlaceAtom.reportRead();
    return super.selectedPlace;
  }

  @override
  set selectedPlace(PickResult value) {
    _$selectedPlaceAtom.reportWrite(value, super.selectedPlace, () {
      super.selectedPlace = value;
    });
  }

  final _$geolocatorAtom =
      Atom(name: '_GoogleMapPickerControllerBase.geolocator');

  @override
  Geolocator get geolocator {
    _$geolocatorAtom.reportRead();
    return super.geolocator;
  }

  @override
  set geolocator(Geolocator value) {
    _$geolocatorAtom.reportWrite(value, super.geolocator, () {
      super.geolocator = value;
    });
  }

  final _$currentPositionAtom =
      Atom(name: '_GoogleMapPickerControllerBase.currentPosition');

  @override
  Position get currentPosition {
    _$currentPositionAtom.reportRead();
    return super.currentPosition;
  }

  @override
  set currentPosition(Position value) {
    _$currentPositionAtom.reportWrite(value, super.currentPosition, () {
      super.currentPosition = value;
    });
  }

  final _$isLoadingAtom =
      Atom(name: '_GoogleMapPickerControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getCurrentLocationAsyncAction =
      AsyncAction('_GoogleMapPickerControllerBase.getCurrentLocation');

  @override
  Future getCurrentLocation() {
    return _$getCurrentLocationAsyncAction
        .run(() => super.getCurrentLocation());
  }

  final _$setLocationAsyncAction =
      AsyncAction('_GoogleMapPickerControllerBase.setLocation');

  @override
  Future setLocation(dynamic result) {
    return _$setLocationAsyncAction.run(() => super.setLocation(result));
  }

  @override
  String toString() {
    return '''
selectedPlace: ${selectedPlace},
geolocator: ${geolocator},
currentPosition: ${currentPosition},
isLoading: ${isLoading}
    ''';
  }
}
