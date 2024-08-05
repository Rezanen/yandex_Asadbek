class GeocoderResp {
  GeocoderResp({
      this.response,});

  GeocoderResp.fromJson(dynamic json) {
    response = json['response'] != null ? Response.fromJson(json['response']) : null;
  }
  Response? response;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (response != null) {
      map['response'] = response?.toJson();
    }
    return map;
  }

}

class Response {
  Response({
      this.geoObjectCollection,});

  Response.fromJson(dynamic json) {
    geoObjectCollection = json['GeoObjectCollection'] != null ? GeoObjectCollection.fromJson(json['GeoObjectCollection']) : null;
  }
  GeoObjectCollection? geoObjectCollection;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (geoObjectCollection != null) {
      map['GeoObjectCollection'] = geoObjectCollection?.toJson();
    }
    return map;
  }

}

class GeoObjectCollection {
  GeoObjectCollection({
      this.featureMember,});

  GeoObjectCollection.fromJson(dynamic json) {
    if (json['featureMember'] != null) {
      featureMember = [];
      json['featureMember'].forEach((v) {
        featureMember?.add(FeatureMember.fromJson(v));
      });
    }
  }
  List<FeatureMember>? featureMember;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (featureMember != null) {
      map['featureMember'] = featureMember?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class FeatureMember {
  FeatureMember({
      this.geoObject,});

  FeatureMember.fromJson(dynamic json) {
    geoObject = json['GeoObject'] != null ? GeoObject.fromJson(json['GeoObject']) : null;
  }
  GeoObject? geoObject;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (geoObject != null) {
      map['GeoObject'] = geoObject?.toJson();
    }
    return map;
  }

}

class GeoObject {
  GeoObject({
      this.name, 
      this.description,});

  GeoObject.fromJson(dynamic json) {
    name = json['name'];
    description = json['description'];
  }
  String? name;
  String? description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['description'] = description;
    return map;
  }

}