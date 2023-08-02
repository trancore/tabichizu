import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:tabichizu/data/constants/hive.dart';
import 'package:tabichizu/data/model/hive/location/location.dart';
import 'package:tabichizu/data/model/places/places_autocomplete.dart';
import 'package:tabichizu/domain/places.dart';
import 'package:tabichizu/ui/common/form/custom_form.dart';
import 'package:tabichizu/ui/common/form/custom_form_text_field.dart';
import 'package:tabichizu/ui/common/location.dart';
import 'package:tabichizu/ui/common/suggest.dart';
import 'package:uuid/uuid.dart';

class Travel extends StatefulWidget {
  const Travel({super.key});

  @override
  State<Travel> createState() => _TravelState();
}

class _TravelState extends State<Travel> {
  final PlacesBloc _placesBloc = PlacesBloc();

  late Box<Location> locationBox;
  TextEditingController textController = TextEditingController();
  bool hasSuggest = false;

  void onChanged(String? value) async {
    await _placesBloc.getPlacesAutocomplete(value);

    setState(() {
      hasSuggest = value?.isNotEmpty ?? false;
    });
  }

  void selectSuggest(String? id, String value) async {
    _placesBloc.clearAutocomplete();
    await _placesBloc.getPlacesDetails(id);

    setState(() {
      textController.text = value;
      hasSuggest = false;
    });
  }

  void registerLocation(
      String title, String prefecture, double lat, double lng) {
    var uuid = const Uuid().v4();
    while (locationBox.values.toList().any((location) => location.id == uuid)) {
      // 被りがある場合、UUIDを再生成する
      uuid = const Uuid().v4();
    }

    locationBox.add(
      Location(
        id: uuid,
        prefecture: prefecture,
        locationName: title,
        lat: lat,
        lng: lng,
      ),
    );
  }

  void deleteLocation(String id) {
    final location =
        locationBox.values.firstWhere((location) => location.id == id);
    locationBox.delete(location.key);
  }

  @override
  Widget build(BuildContext context) {
    locationBox = Hive.box(locationBoxName);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 36),
        child: CustomScrollView(slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            pinned: true,
            flexibleSpace: CustomForm(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
                child: CustomFormTextField(
                  name: "travelLocation",
                  hasBorder: true,
                  hintText: "訪れた場所を入力してください",
                  onChanged: onChanged,
                  controller: textController,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                StreamBuilder<PlacesAutocompleteModel?>(
                  stream: _placesBloc.autocompleteDataStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.data?.predictions != null &&
                        snapshot.data!.predictions.isNotEmpty) {
                      return Suggest(
                        suggestList: snapshot.data!.predictions
                            .map(
                              (prediction) => SuggestData(
                                  placeId: prediction.placeId,
                                  description: prediction.description),
                            )
                            .toList(),
                        onTap: selectSuggest,
                      );
                    } else {
                      return textController.text.isNotEmpty
                          ? StreamBuilder(
                              stream: _placesBloc.detailsDataStream,
                              builder: (context, snapshot) {
                                if (snapshot.data != null &&
                                    snapshot.data?.result.addressComponents !=
                                        null &&
                                    snapshot.data?.result.geometry != null &&
                                    snapshot.data?.result.geometry?.location !=
                                        null) {
                                  return LocationWidget(
                                    title:
                                        snapshot.data?.result.formattedAddress,
                                    prefecture: snapshot
                                        .data?.result.addressComponents!
                                        .firstWhere(
                                      (addressComponent) {
                                        return addressComponent.types.contains(
                                            "administrative_area_level_1");
                                      },
                                    ).longName,
                                    lat: snapshot.data?.result.geometry
                                        ?.location.lat as double,
                                    lng: snapshot.data?.result.geometry
                                        ?.location.lng as double,
                                    registerLocation: registerLocation,
                                  );
                                } else {
                                  return const SizedBox();
                                }
                              },
                            )
                          : const SizedBox();
                    }
                  },
                ),
                ValueListenableBuilder(
                  valueListenable: locationBox.listenable(),
                  builder: (context, box, _) {
                    return hasSuggest
                        ? const SizedBox()
                        : Column(
                            children: [
                              for (Location location in box.values)
                                LocationWidget(
                                  lat: location.lat,
                                  lng: location.lng,
                                  id: location.id,
                                  title: location.locationName,
                                  deleteLocation: deleteLocation,
                                )
                            ],
                          );
                  },
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  @override
  void dispose() {
    _placesBloc.dispose();
    super.dispose();
  }
}
