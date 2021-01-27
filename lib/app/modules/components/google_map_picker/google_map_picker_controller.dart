import 'package:flutter_modular/flutter_modular.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:mobx/mobx.dart';

part 'google_map_picker_controller.g.dart';

@Injectable()
class GoogleMapPickerController = _GoogleMapPickerControllerBase
    with _$GoogleMapPickerController;

abstract class _GoogleMapPickerControllerBase with Store {

  @observable
  PickResult selectedPlace;
  @observable
  Geolocator geolocator ;
  @observable
  Position currentPosition;

  @observable 
  bool isLoading =true;

  _GoogleMapPickerControllerBase()
  {
    getCurrentLocation();
  }
  
  @action
  getCurrentLocation() async
  {
    Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.best).then
    (
      (Position position) 
      {
        currentPosition = position;
        isLoading = false;
      }
    ).catchError((e) 
    {
      print(e);
    });
  }

  @action 
  setLocation(result) async
  {
    selectedPlace = result;
  }
}
