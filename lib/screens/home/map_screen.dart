import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:semsark/components/show_ads_item.dart';

import '../../utils/helper.dart';

class Home extends StatefulWidget {
  late Position cameraPosition ;

  Home({required this.cameraPosition}) ;
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static bool isMap = true;
  final _textEditingController = TextEditingController();
  final List<String> _sortOptions = [    'Price (High to Low)',
    'Price (Low to High)',
    'Name (A to Z)',
    'Name (Z to A)',
    'Nearest',
  ];
  String _selectedSortOption = '';

  void _showSortOptionsDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: SizedBox(
            height: _sortOptions.length*61,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    'Sort By',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _sortOptions.length,
                      itemBuilder: (context, index) {
                        final sortOption = _sortOptions[index];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedSortOption = sortOption;
                            });
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              vertical: 5.0,
                              horizontal: 10.0,
                            ),
                            padding: const EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: _selectedSortOption == sortOption
                                  ? Colors.grey.shade300
                                  : null,
                            ),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  sortOption,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: _selectedSortOption ==
                                        sortOption
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                                  ),
                                ),
                                if (_selectedSortOption == sortOption)
                                  const Icon(Icons.check),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _onMapCreated(GoogleMapController _cntlr) {}
  Widget mapWidget() => SafeArea(
        child: GoogleMap(
          zoomGesturesEnabled: true,
          initialCameraPosition:
              CameraPosition(target: LatLng(
                  double.tryParse('${widget.cameraPosition.latitude}')!.toDouble() ,
                  double.tryParse('${widget.cameraPosition.longitude}')!.toDouble() ,
              ), zoom: 15),
          onMapCreated: _onMapCreated,
          myLocationEnabled: true,
          padding: const EdgeInsets.only(bottom: 90, right: 10),
          onLongPress: (l) {},

        ),
      );
  Widget listViewWidget() => SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textEditingController,
                onChanged: (txt) {
                  print(txt);
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  prefixIcon: const Icon(Icons.search, color: Colors.grey),
                  hintText: 'Search..',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.grey[300],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Helper.blue,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Row(
                        children: const [
                          Icon(Icons.filter_list_alt, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Filter', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      _showSortOptionsDialog();
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Helper.blue,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      child: Row(
                        children: const [
                          Icon(Icons.sort, color: Colors.white),
                          SizedBox(width: 8),
                          Text('Sort', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemBuilder: (context, index) => const AdItem(), itemCount: 20),
            ),
          ],
        ),
      );
  @override
  Widget build(BuildContext context) =>Scaffold(
    body :
    isMap ? mapWidget() : listViewWidget() ,
    floatingActionButton: Container(
      margin: const EdgeInsets.only(bottom: 10, left: 20),
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 75
        ),
        child: FloatingActionButton(
          backgroundColor: Helper.blue,
          onPressed: () {
            setState(() {
              isMap = !isMap;
            });
          },
          child: Icon(
            isMap ? Icons.list : Icons.map_outlined,
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}
