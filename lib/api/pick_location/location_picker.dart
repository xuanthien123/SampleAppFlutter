import 'dart:async';

import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:flutter_google_location_picker/export.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import 'request_service_customer.dart';
class FlutterGoogleLocationPicker extends StatefulWidget {
  final LatLong center;
  final TextStyle? textStyle;
  final Color? markerColor;
  final Widget? markerWidget;
  final Widget? buttonWidget;
  final InputDecoration? inputDecoration;
  final void Function(PickedData pickedData) onPicked;
  final Color? primaryGreen;
  final bool? showZoomButtons;

  const FlutterGoogleLocationPicker(
      {Key? key,
      required this.center,
      required this.onPicked,
      this.primaryGreen,
      this.textStyle = const TextStyle(fontWeight: FontWeight.w600),
      this.showZoomButtons,
      this.buttonWidget,
      this.inputDecoration,
      this.markerWidget,
      this.markerColor})
      : super(key: key);

  @override
  State<FlutterGoogleLocationPicker> createState() =>
      _FlutterGoogleLocationPickerState();
}

class _FlutterGoogleLocationPickerState
    extends State<FlutterGoogleLocationPicker> {
  MapController _mapController = MapController();
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();
  List<OSMData> _options = <OSMData>[];
  Timer? _debounce;
  bool isProcess = false;

  void setNameCurrentPos(
      {required double latitude, required double longitude}) async {
    _searchController.text = await RequestServiceCustomer()
        .requestLocationName(latitude: latitude, longitude: longitude);
  }

  @override
  void initState() {
    RequestServiceCustomer().initState(() {
      if (mounted) {
        setState(() {});
      }
    });
    _mapController = MapController();

    _mapController.onReady.then((_) {
      setNameCurrentPos(
          latitude: widget.center.latitude, longitude: widget.center.longitude);
    });

    _mapController.mapEventStream.listen((event) async {
      if (event is MapEventMoveEnd) {
        setNameCurrentPos(
            latitude: event.center.latitude, longitude: event.center.longitude);
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    OutlineInputBorder inputFocusBorder = OutlineInputBorder(
      borderSide: BorderSide(
          color: widget.primaryGreen ?? Theme.of(context).primaryColor,
          width: 2.0),
    );
    final showZoom = widget.showZoomButtons ?? false;

    // String? _autocompleteSelection;
    return Stack(children: [
      Positioned.fill(
          child: FlutterMap(
              options: MapOptions(
                  center:
                      LatLng(widget.center.latitude, widget.center.longitude),
                  zoom: 15.0,
                  maxZoom: 18,
                  minZoom: 6),
              mapController: _mapController,
              layers: [
            TileLayerOptions(
                urlTemplate: Config.urlTemplate, subdomains: ['a', 'b', 'c']),
          ])),
      Positioned(
          top: MediaQuery.of(context).size.height * 0.5,
          left: 0,
          right: 0,
          child: IgnorePointer(
            child: Center(child: StatefulBuilder(builder: (context, setState) {
              return Text(
                _searchController.text,
                textAlign: TextAlign.center,
                style: widget.textStyle,
              );
            })),
          )),
      Positioned.fill(
          child: IgnorePointer(
        child: Center(
            child: widget.markerWidget ??
                Icon(
                  Icons.location_pin,
                  color: widget.markerColor ?? Theme.of(context).primaryColor,
                  size: 50,
                )),
      )),
      if (showZoom)
        Positioned(
            bottom: 180,
            right: 5,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                _mapController.move(
                    _mapController.center, _mapController.zoom + 1);
              },
              child: const Icon(Icons.add),
            )),
      if (showZoom)
        Positioned(
            bottom: 120,
            right: 5,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                _mapController.move(
                    _mapController.center, _mapController.zoom - 1);
              },
              child: const Icon(Icons.remove),
            )),
      Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: EdgeInsets.all(15),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(6)),
                child: TextFormField(
                    readOnly: true,
                    textCapitalization: TextCapitalization.sentences,
                    controller: _searchController,
                    focusNode: _focusNode,
                    decoration: widget.inputDecoration ??
                        InputDecoration(
                          contentPadding: EdgeInsets.symmetric(horizontal: 16),
                          hintText: 'Tìm kiếm vị trí',
                          enabledBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedBorder: inputFocusBorder,
                        ),
                    onChanged: (String value) {
                      if (_debounce?.isActive ?? false) _debounce?.cancel();

                      _debounce =
                          Timer(const Duration(milliseconds: 2000), () async {
                        var client = http.Client();
                        isProcess = true;
                        RequestServiceCustomer().notifyListener();
                        try {
                          var osmList = await RequestServiceCustomer()
                              .requestSearch(client: client, search: value);
                          _options = osmList;
                          isProcess = false;
                          RequestServiceCustomer().notifyListener();
                        } finally {
                          isProcess = false;
                          client.close();
                        }

                        RequestServiceCustomer().notifyListener();
                      });
                    }),
              ),
              StatefulBuilder(
                  builder: ((context, setState) => ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: _options.length > 5 ? 5 : _options.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          title: Text(_options[index].displayName),
                          subtitle: Text(
                              '${_options[index].lat},${_options[index].lon}'),
                          onTap: () {
                            _mapController.move(
                                LatLng(
                                    _options[index].lat, _options[index].lon),
                                15.0);
                            _searchController.text =
                                _options[index].displayName;
                            _focusNode.unfocus();
                            _options.clear();
                            setState(() {});
                          },
                        );
                      }))),
            ]),
          )),
      Positioned(
          bottom: 44,
          left: 0,
          right: 0,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: widget.buttonWidget != null
                  ? InkWell(
                      onTap: () async {
                        await RequestServiceCustomer()
                            .pickData(
                                latitude: _mapController.center.latitude,
                                longitude: _mapController.center.longitude)
                            .then((value) {
                          RequestServiceCustomer().notifyListener();
                          widget.onPicked(value);
                        });
                      },
                      child: widget.buttonWidget)
                  : CustomButton(
                      'Set Current Location',
                      onPressed: () async {
                        FocusScope.of(context).unfocus();

                        isProcess = true;
                        RequestServiceCustomer().notifyListener();
                        RequestServiceCustomer()
                            .pickData(
                                latitude: _mapController.center.latitude,
                                longitude: _mapController.center.longitude)
                            .then((value) {
                          isProcess = false;
                          RequestServiceCustomer().notifyListener();
                          widget.onPicked(value);
                        });
                      },
                      backGroundColor: Theme.of(context).primaryColor,
                    ),
            ),
          )),
      if (isProcess)
        const Center(
            child: CircularProgressIndicator(
          color: Colors.black,
        )),
    ]);
  }
}
