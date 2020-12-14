import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapSample extends StatefulWidget {
  @override
  _GoogleMapSampleState createState() => _GoogleMapSampleState();
}

class _GoogleMapSampleState extends State<GoogleMapSample> {

  MapType _currentMapType = MapType.normal;
  Completer<GoogleMapController> _controller = Completer();
  static const LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  void _onCameraMove(CameraPosition cameraPosition) {
    print(cameraPosition.target);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(

                child: GoogleMap(
                  mapType: _currentMapType,
                  onMapCreated: _onMapCreated,
                  onCameraMove: _onCameraMove,
                  initialCameraPosition: CameraPosition(
                    target: _center,
                    zoom: 11.0,
                  ),
                  markers: {
                    Marker(
                        markerId: MarkerId("1"),
                        position: LatLng(45.521563, -122.677433),
                        infoWindow: InfoWindow(title: "Marker 1")),
                    Marker(
                        markerId: MarkerId("2"),
                        position: LatLng(45.522563, -122.678433),
                        infoWindow: InfoWindow(title: "Marker 2"))
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: RaisedButton(
                  child: Text(
                    "Change Map Style",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: Colors.deepPurple,
                  onPressed: () {
                    // open bottom sheet dialog and select map style to reflect.
                    _settingModalBottomSheet(context);
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc){
          return Container(
            child: new Wrap(
              children: <Widget>[
                new ListTile(
                    leading: new Icon(Icons.satellite),
                    title: new Text('Satellite'),
                    onTap: () {
                      // change map style
                      setState(() {
                        _currentMapType = MapType.satellite;
                        Navigator.pop(context);
                      });
                    }
                ),
                new ListTile(
                  leading: new Icon(Icons.map),
                  title: new Text('Normal'),
                  onTap: () {
                    //change map style
                    setState(() {
                      _currentMapType = MapType.normal;
                      Navigator.pop(context);

                    });

                  },
                ),
              ],
            ),
          );
        }
    );
  }
}
// google map change style