import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:informate/controllers/home_controller.dart';
import 'package:informate/models/construction.dart';
import 'package:informate/models/institution.dart';
import 'package:marker_icon/marker_icon.dart';

class HomePage extends StatefulWidget {
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late GoogleMapController _controller;
  Set<Marker> markers = {};
  int option = 1;
  int selectedOption = 1;
  @override
  void initState() {
    //addMarkers().then((value) {
    //  setState(() {});
    //});
    HomeController().getPointsObras();
    super.initState();
  }

  Future<void> getPoints() async {
    List<Construction> constructions = await HomeController().getPointsObras();

    BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/image_construction_road3.png');
    for (int i = 0; i <= constructions.length - 1; i++) {
      int k = 0;
      LatLng latlng =
          LatLng(constructions[i].points[k], constructions[i].points[k + 1]);
      markers.add(Marker(
        onTap: () {
          showInformationObra(constructions[i]);
        },
        markerId: MarkerId(i.toString()),
        position: latlng,
        icon: icon,
      ));
    }
  }

  Future<void> getMarkersLanguage() async {
    List<Institution> institutions =
        await HomeController().getInstitutionsWithLanguage();
    print('instituciones length' + institutions.length.toString());
    BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/image_construction_road3.png');
    for (int i = 0; i <= institutions.length - 1; i++) {
      markers.add(Marker(
        onTap: () {
          showInformationInstitute(institutions[i]);
        },
        markerId: MarkerId(i.toString()),
        position: LatLng(institutions[i].lat, institutions[i].lng),
        icon: icon,
      ));
    }
  }

  Future<void> addMarkers() async {
    List<Institution> institutions =
        await HomeController().getInstitutionsWithBraille();

    print('instituciones length' + institutions.length.toString());
    BitmapDescriptor icon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(), 'assets/images/museum2r.png');
    for (int i = 0; i <= institutions.length - 1; i++) {
      markers.add(Marker(
        onTap: () {
          showInformationInstitute(institutions[i]);
        },
        markerId: MarkerId(i.toString()),
        position: LatLng(institutions[i].lat, institutions[i].lng),
        icon: icon,
      ));
    }
    /*
    markers.add(
      Marker(
        markerId: MarkerId("1"),
        icon: await MarkerIcon.pictureAsset(
          assetPath: 'assets/images/image_construction_road.png',
          width: 80,
          height: 80,
        ),
      ),
    );*/
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (HomeController homecontroller) {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              GoogleMap(
                  onMapCreated: (GoogleMapController controller) {
                    _controller = controller;
                  },
                  markers: markers,
                  myLocationEnabled: true,
                  initialCameraPosition: CameraPosition(
                      target: LatLng(-27.45110, -58.98663), zoom: 15)),
              Container(
                margin: EdgeInsets.fromLTRB(10, 20, 0, 0),
                child: Row(
                  children: [
                    ChoiceChip(
                        selectedColor: Colors.blue,
                        disabledColor: Colors.red,
                        onSelected: (val) async {
                          if (val == true) {
                            setState(() {
                              selectedOption = 1;
                            });
                          }

                          await addMarkers();
                        },
                        label: Text('Obras',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        selected: selectedOption == 1 ? true : false),
                    SizedBox(width: 5.0),
                    ChoiceChip(
                        selectedColor: Colors.blue,
                        disabledColor: Colors.red,
                        onSelected: (val) async {
                          if (val == true) {
                            setState(() {
                              selectedOption = 2;
                            });
                          }

                          await getPoints();
                        },
                        label: Text('Instituciones',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        selected: selectedOption == 2 ? true : false),
                    /*
                    ChoiceChip(
                        selectedColor: Colors.blue,
                        disabledColor: Colors.red,
                        onSelected: (val) async {
                          if (val == true) {
                            setState(() {
                              selectedOption = 1;
                            });
                          }

                          await addMarkers();
                        },
                        label: Text('Braille',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        selected: selectedOption == 1 ? true : false),
                    ChoiceChip(
                        onSelected: (val) async {
                          if (val == true) {
                            setState(() {
                              selectedOption = 2;
                            });
                          }
                          await getMarkersLanguage();
                        },
                        selectedColor: Colors.blue,
                        disabledColor: Colors.red,
                        label: Text('Lengua de señas',
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.bold,
                                color: Colors.white)),
                        selected: selectedOption == 2 ? true : false),*/
                  ],
                ),
              ),
            ],
          ),
        ),
        /*
        floatingActionButtonLocation: ExpandableFab.location,
        floatingActionButton: ExpandableFab(
          //key: key,
          overlayStyle: ExpandableFabOverlayStyle(
            // color: Colors.black.withOpacity(0.5),
            blur: 5,
          ),
          onOpen: () {
            debugPrint('onOpen');
          },
          afterOpen: () {
            debugPrint('afterOpen');
          },
          onClose: () {
            debugPrint('onClose');
          },
          afterClose: () {
            debugPrint('afterClose');
          },
          children: [
            FloatingActionButton.small(
              heroTag: null,
              child: const FaIcon(FontAwesomeIcons.buildingColumns, size: 21.0),
              onPressed: () {},
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const Icon(Icons.construction, size: 21.0),
              onPressed: () async {
                setState(() {
                  option = 2;
                });
                await getPoints();
                // Navigator.of(context).push(MaterialPageRoute(
                //  builder: ((context) => const NextPage())));
              },
            ),
            FloatingActionButton.small(
              heroTag: null,
              child: const FaIcon(FontAwesomeIcons.personWalkingWithCane,
                  size: 21.0),
              onPressed: () {},
            ),
          ],
        ),*/
      );
    });
  }

  void showInformationInstitute(Institution inst) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return FadeInUp(
              duration: Duration(milliseconds: 700),
              child: Container(
                  height: 150,
                  child: ListTile(
                    leading: FaIcon(FontAwesomeIcons.museum, size: 25.0),
                    title: Text(inst.nombre,
                        style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500)),
                    subtitle: Row(
                      children: [
                        Icon(Icons.room, size: 18.0),
                        Text(inst.direccion,
                            style: GoogleFonts.ubuntu(
                                fontWeight: FontWeight.w500)),
                      ],
                    ),
                  )));
        });
  }

  void showInformationObra(Construction inst) {
    showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        builder: (context) {
          return FadeInUp(
              duration: Duration(milliseconds: 700),
              child: Container(
                height: 150,
                child: ListTile(
                  leading: Icon(Icons.construction, size: 25.0),
                  title: Text(inst.calle,
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500)),
                  subtitle: Text(inst.tipo_obra,
                      style: GoogleFonts.ubuntu(fontWeight: FontWeight.w500)),
                ),
              ));
        });
  }
}
