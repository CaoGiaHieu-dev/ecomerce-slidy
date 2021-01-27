import 'package:ecomerce/app/modules/components/google_map_picker/google_map_picker_controller.dart';
import 'package:ecomerce/constaints/constaints.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import 'package:provider/provider.dart';

class GoogleMapPickerWidget extends StatefulWidget {
  
  @override
  _GoogleMapPickerWidgetState createState() => _GoogleMapPickerWidgetState();
}

class _GoogleMapPickerWidgetState extends ModularState<GoogleMapPickerWidget,GoogleMapPickerController> {
  
  @override
  Widget build(BuildContext context) 
  {
    final googleMapPicker = Provider.of<GoogleMapPickerController>(context);
    return Observer
    (
      builder:(_) => controller.isLoading
      ? Center
      (
        child: CircularProgressIndicator(),
      )
      : PlacePicker
      (
        apiKey: apiKey,
        initialPosition: LatLng(controller.currentPosition.latitude,controller.currentPosition.longitude),
        useCurrentLocation: true,
        selectInitialPosition: true,
        automaticallyImplyAppBarLeading:true,
        onPlacePicked: (result) 
        {
          googleMapPicker.setLocation(result);
          Modular.to.pop();
        },
      ),
    );
  }
}
