import 'package:tabichizu/data/model/places/address_component.dart';
import 'package:tabichizu/data/model/places/geometry.dart';
import 'package:tabichizu/data/model/places/place_editorial_summary.dart';
import 'package:tabichizu/data/model/places/place_opening_hours.dart';
import 'package:tabichizu/data/model/places/place_photo.dart';
import 'package:tabichizu/data/model/places/place_review.dart';
import 'package:tabichizu/data/model/places/plus_code.dart';

class PlaceModel {
  final List<AddressComponentModel>? addressComponents;
  final String? adrAddress;
  final String? businessStatus;
  final bool? curbsidePickup;
  final PlaceOpeningHoursModel? currentOpeningHours;
  final bool? delivery;
  final bool? dineIn;
  final PlaceEditorialSummaryModel? editorialSummary;
  final String? formattedAddress;
  final String? formattedPhoneNumber;
  final GeometryModel? geometry;
  final String? icon;
  final String? iconBackgroundColor;
  final String? iconMaskBaseUri;
  final String? internationalPhoneNumber;
  final String? name;
  final PlaceOpeningHoursModel? openingHours;
  final List<PlacePhotoModel>? photos;
  final String? placeId;
  final PlusCodeModel? plusCode;
  final num? priceLevel;
  final num? rating;
  final bool? reservable;
  final List<PlaceReviewModel>? reviews;
  final List<PlaceOpeningHoursModel>? secondaryOpeningHours;
  final bool? servesBeer;
  final bool? servesBreakfast;
  final bool? servesBrunch;
  final bool? servesDinner;
  final bool? servesLunch;
  final bool? servesVegetarianFood;
  final bool? servesWine;
  final bool? takeout;
  final List<String>? types;
  final String? url;
  final num? userRatingsTotal;
  final num? utcOffset;
  final String? vicinity;
  final String? website;
  final bool? wheelchairAccessibleEntrance;

  PlaceModel({
    this.addressComponents,
    this.adrAddress,
    this.businessStatus,
    this.curbsidePickup,
    this.currentOpeningHours,
    this.delivery,
    this.dineIn,
    this.editorialSummary,
    this.formattedAddress,
    this.formattedPhoneNumber,
    this.geometry,
    this.icon,
    this.iconBackgroundColor,
    this.iconMaskBaseUri,
    this.internationalPhoneNumber,
    this.name,
    this.openingHours,
    this.photos,
    this.placeId,
    this.plusCode,
    this.priceLevel,
    this.rating,
    this.reservable,
    this.reviews,
    this.secondaryOpeningHours,
    this.servesBeer,
    this.servesBreakfast,
    this.servesBrunch,
    this.servesDinner,
    this.servesLunch,
    this.servesVegetarianFood,
    this.servesWine,
    this.takeout,
    this.types,
    this.url,
    this.userRatingsTotal,
    this.utcOffset,
    this.vicinity,
    this.website,
    this.wheelchairAccessibleEntrance,
  });

  factory PlaceModel.fromJson(Map<String, dynamic> json) {
    var addressComponents = <AddressComponentModel>[];
    if (json['address_components'] != null) {
      var addressComponentsJson = json['address_components'] as List<dynamic>;
      for (var addressComponentJson in addressComponentsJson) {
        var addressComponent =
            AddressComponentModel.fromJson(addressComponentJson);
        addressComponents.add(addressComponent);
      }
    }

    PlaceOpeningHoursModel? currentOpeningHours;
    if (json['current_opening_hours'] != null) {
      var currentOpeningHoursJson = json['current_opening_hours'] as dynamic;
      currentOpeningHours =
          PlaceOpeningHoursModel.fromJson(currentOpeningHoursJson);
    }

    PlaceEditorialSummaryModel? editorialSummary;
    if (json['editorial_summary'] != null) {
      var editorialSummaryJson = json['editorial_summary'] as dynamic;
      editorialSummary =
          PlaceEditorialSummaryModel.fromJson(editorialSummaryJson);
    }

    GeometryModel? geometry;
    if (json['geometry'] != null) {
      var geometryJson = json['geometry'] as dynamic;
      geometry = GeometryModel.fromJson(geometryJson);
    }

    PlaceOpeningHoursModel? openingHours;
    if (json['opening_hours'] != null) {
      var openingHoursJson = json['opening_hours'] as dynamic;
      openingHours = PlaceOpeningHoursModel.fromJson(openingHoursJson);
    }

    var photos = <PlacePhotoModel>[];
    if (json['photos'] != null) {
      var photosJson = json['photos'] as List<dynamic>;
      for (var photoJson in photosJson) {
        var photo = PlacePhotoModel.fromJson(photoJson);
        photos.add(photo);
      }
    }

    PlusCodeModel? plusCode;
    if (json['plus_code'] != null) {
      var plusCodeJson = json['plus_code'] as dynamic;
      plusCode = PlusCodeModel.fromJson(plusCodeJson);
    }

    var reviews = <PlaceReviewModel>[];
    if (json['reviews'] != null) {
      var reviewsJson = json['reviews'] as List<dynamic>;
      for (var reviewJson in reviewsJson) {
        var review = PlaceReviewModel.fromJson(reviewJson);
        reviews.add(review);
      }
    }

    var secondaryOpeningHours = <PlaceOpeningHoursModel>[];
    if (json['secondary_opening_hours'] != null) {
      var secondaryOpeningHoursJson =
          json['secondary_opening_hours'] as List<dynamic>;
      for (var secondaryOpeningHourJson in secondaryOpeningHoursJson) {
        var secondaryOpeningHour =
            PlaceOpeningHoursModel.fromJson(secondaryOpeningHourJson);
        secondaryOpeningHours.add(secondaryOpeningHour);
      }
    }

    var types = <String>[];
    if (json['types'] != null) {
      var typesJson = json['types'] as List<dynamic>;
      for (var typeJson in typesJson) {
        types.add(typeJson);
      }
    }

    return PlaceModel(
      addressComponents: addressComponents,
      adrAddress: json['adr_address'] ?? "",
      businessStatus: json['business_status'] ?? "",
      curbsidePickup: json['curbside_pickup'] == null
          ? null
          : bool.parse(json['curbside_pickup'].toString()),
      currentOpeningHours: currentOpeningHours,
      delivery: json['delivery'] == null
          ? null
          : bool.parse(json['delivery'].toString()),
      dineIn: json['dine_in'] == null
          ? null
          : bool.parse(json['dine_in'].toString()),
      editorialSummary: editorialSummary,
      formattedAddress: json['formatted_address'],
      formattedPhoneNumber: json['formatted_phone_number'],
      geometry: geometry,
      icon: json['icon'],
      iconBackgroundColor: json['icon_background_color'],
      iconMaskBaseUri: json['icon_mask_base_uri'],
      internationalPhoneNumber: json['international_phone_number'],
      name: json['name'],
      openingHours: openingHours,
      photos: photos,
      placeId: json['place_id'],
      plusCode: plusCode,
      priceLevel: json['price_level'],
      rating: json['rating'],
      reservable: json['reservable'] == null
          ? null
          : bool.tryParse(json['reservable'].toString()),
      reviews: reviews,
      secondaryOpeningHours: secondaryOpeningHours,
      servesBeer: json['serves_beer'] == null
          ? null
          : bool.tryParse(json['serves_beer'].toString()),
      servesBreakfast: json['serves_breakfast'] == null
          ? null
          : bool.tryParse(json['serves_breakfast'].toString()),
      servesBrunch: json['serves_brunch'] == null
          ? null
          : bool.tryParse(json['serves_brunch'].toString()),
      servesDinner: json['serves_dinner'] == null
          ? null
          : bool.tryParse(json['serves_dinner'].toString()),
      servesLunch: json['serves_lunch'] == null
          ? null
          : bool.tryParse(json['serves_lunch'].toString()),
      servesVegetarianFood: json['serves_vegetarian_food'] == null
          ? null
          : bool.tryParse(json['serves_vegetarian_food'].toString()),
      servesWine: json['serves_wine'] == null
          ? null
          : bool.tryParse(json['serves_wine'].toString()),
      takeout: json['takeout'] == null
          ? null
          : bool.tryParse(json['takeout'].toString()),
      types: types,
      url: json['url'],
      userRatingsTotal: json['user_ratings_total'],
      utcOffset: json['utc_offset'],
      vicinity: json['vicinity'],
      website: json['website'],
      wheelchairAccessibleEntrance:
          json['wheelchair_accessible_entrance'] == null
              ? null
              : bool.tryParse(json['wheelchair_accessible_entrance'].toString(),
                  caseSensitive: false),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "address_components": addressComponents,
      "adr_address": adrAddress,
      "business_status": businessStatus,
      "curbside_pickup": curbsidePickup,
      "current_opening_hours": currentOpeningHours,
      "delivery": delivery,
      "dine_in": dineIn,
      "editorial_summary": editorialSummary,
      "formatted_address": formattedAddress,
      "formatted_phone_number": formattedPhoneNumber,
      "geometry": geometry,
      "icon": icon,
      "ico_background_color": iconBackgroundColor,
      "icon_mask_base_uri": iconMaskBaseUri,
      "international_phone_number": internationalPhoneNumber,
      "name": name,
      "opening_hours": openingHours,
      "photos": photos,
      "place_id": placeId,
      "plus_code": plusCode,
      "price_level": priceLevel,
      "rating": rating,
      "reservable": reservable,
      "reviews": reviews,
      "secondary_opening_hours": secondaryOpeningHours,
      "serves_beer": servesBeer,
      "serves_breakfast": servesBreakfast,
      "serves_brunch": servesBreakfast,
      "serves_dinner": servesDinner,
      "serves_lunch": servesLunch,
      "serves_vegetarian_food": servesVegetarianFood,
      "serves_wine": servesWine,
      "takeout": takeout,
      "types": types,
      "url": url,
      "user_ratings_total": userRatingsTotal,
      "utc_offset": utcOffset,
      "vicinity": vicinity,
      "website": website,
      "wheelchair_accessible_entrance": wheelchairAccessibleEntrance,
    };
  }
}
