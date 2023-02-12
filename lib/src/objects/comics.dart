
class Comics {
  int? code;
  String? status;
  String? copyright;
  String? attributionText;
  String? attributionHtml;
  String? etag;
  Data? data;

  Comics({this.code, this.status, this.copyright, this.attributionText, this.attributionHtml, this.etag, this.data});

  Comics.fromJson(Map<String, dynamic> json) {
    if(json["code"] is int) {
      code = json["code"];
    }
    if(json["status"] is String) {
      status = json["status"];
    }
    if(json["copyright"] is String) {
      copyright = json["copyright"];
    }
    if(json["attributionText"] is String) {
      attributionText = json["attributionText"];
    }
    if(json["attributionHTML"] is String) {
      attributionHtml = json["attributionHTML"];
    }
    if(json["etag"] is String) {
      etag = json["etag"];
    }
    if(json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["code"] = code;
    _data["status"] = status;
    _data["copyright"] = copyright;
    _data["attributionText"] = attributionText;
    _data["attributionHTML"] = attributionHtml;
    _data["etag"] = etag;
    if(data != null) {
      _data["data"] = data?.toJson();
    }
    return _data;
  }
}

class Data {
  int? offset;
  int? limit;
  int? total;
  int? count;
  List<Results>? results;

  Data({this.offset, this.limit, this.total, this.count, this.results});

  Data.fromJson(Map<String, dynamic> json) {
    if(json["offset"] is int) {
      offset = json["offset"];
    }
    if(json["limit"] is int) {
      limit = json["limit"];
    }
    if(json["total"] is int) {
      total = json["total"];
    }
    if(json["count"] is int) {
      count = json["count"];
    }
    if(json["results"] is List) {
      results = json["results"] == null ? null : (json["results"] as List).map((e) => Results.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["offset"] = offset;
    _data["limit"] = limit;
    _data["total"] = total;
    _data["count"] = count;
    if(results != null) {
      _data["results"] = results?.map((e) => e.toJson()).toList();
    }
    return _data;
  }
}

class Results {
  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  dynamic description;
  String? modified;
  String? isbn;
  String? upc;
  String? diamondCode;
  String? ean;
  String? issn;
  String? format;
  int? pageCount;
  List<dynamic>? textObjects;
  String? resourceUri;
  List<Urls>? urls;
  Series? series;
  List<Variants>? variants;
  List<dynamic>? collections;
  List<dynamic>? collectedIssues;
  List<Dates>? dates;
  List<Prices>? prices;
  Thumbnail? thumbnail;
  List<dynamic>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Events? events;

  Results({this.id, this.digitalId, this.title, this.issueNumber, this.variantDescription, this.description, this.modified, this.isbn, this.upc, this.diamondCode, this.ean, this.issn, this.format, this.pageCount, this.textObjects, this.resourceUri, this.urls, this.series, this.variants, this.collections, this.collectedIssues, this.dates, this.prices, this.thumbnail, this.images, this.creators, this.characters, this.stories, this.events});

  Results.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["digitalId"] is int) {
      digitalId = json["digitalId"];
    }
    if(json["title"] is String) {
      title = json["title"];
    }
    if(json["issueNumber"] is int) {
      issueNumber = json["issueNumber"];
    }
    if(json["variantDescription"] is String) {
      variantDescription = json["variantDescription"];
    }
    description = json["description"];
    if(json["modified"] is String) {
      modified = json["modified"];
    }
    if(json["isbn"] is String) {
      isbn = json["isbn"];
    }
    if(json["upc"] is String) {
      upc = json["upc"];
    }
    if(json["diamondCode"] is String) {
      diamondCode = json["diamondCode"];
    }
    if(json["ean"] is String) {
      ean = json["ean"];
    }
    if(json["issn"] is String) {
      issn = json["issn"];
    }
    if(json["format"] is String) {
      format = json["format"];
    }
    if(json["pageCount"] is int) {
      pageCount = json["pageCount"];
    }
    if(json["textObjects"] is List) {
      textObjects = json["textObjects"] ?? [];
    }
    if(json["resourceURI"] is String) {
      resourceUri = json["resourceURI"];
    }
    if(json["urls"] is List) {
      urls = json["urls"] == null ? null : (json["urls"] as List).map((e) => Urls.fromJson(e)).toList();
    }
    if(json["series"] is Map) {
      series = json["series"] == null ? null : Series.fromJson(json["series"]);
    }
    if(json["variants"] is List) {
      variants = json["variants"] == null ? null : (json["variants"] as List).map((e) => Variants.fromJson(e)).toList();
    }
    if(json["collections"] is List) {
      collections = json["collections"] ?? [];
    }
    if(json["collectedIssues"] is List) {
      collectedIssues = json["collectedIssues"] ?? [];
    }
    if(json["dates"] is List) {
      dates = json["dates"] == null ? null : (json["dates"] as List).map((e) => Dates.fromJson(e)).toList();
    }
    if(json["prices"] is List) {
      prices = json["prices"] == null ? null : (json["prices"] as List).map((e) => Prices.fromJson(e)).toList();
    }
    if(json["thumbnail"] is Map) {
      thumbnail = json["thumbnail"] == null ? null : Thumbnail.fromJson(json["thumbnail"]);
    }
    if(json["images"] is List) {
      images = json["images"] ?? [];
    }
    if(json["creators"] is Map) {
      creators = json["creators"] == null ? null : Creators.fromJson(json["creators"]);
    }
    if(json["characters"] is Map) {
      characters = json["characters"] == null ? null : Characters.fromJson(json["characters"]);
    }
    if(json["stories"] is Map) {
      stories = json["stories"] == null ? null : Stories.fromJson(json["stories"]);
    }
    if(json["events"] is Map) {
      events = json["events"] == null ? null : Events.fromJson(json["events"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["id"] = id;
    _data["digitalId"] = digitalId;
    _data["title"] = title;
    _data["issueNumber"] = issueNumber;
    _data["variantDescription"] = variantDescription;
    _data["description"] = description;
    _data["modified"] = modified;
    _data["isbn"] = isbn;
    _data["upc"] = upc;
    _data["diamondCode"] = diamondCode;
    _data["ean"] = ean;
    _data["issn"] = issn;
    _data["format"] = format;
    _data["pageCount"] = pageCount;
    if(textObjects != null) {
      _data["textObjects"] = textObjects;
    }
    _data["resourceURI"] = resourceUri;
    if(urls != null) {
      _data["urls"] = urls?.map((e) => e.toJson()).toList();
    }
    if(series != null) {
      _data["series"] = series?.toJson();
    }
    if(variants != null) {
      _data["variants"] = variants?.map((e) => e.toJson()).toList();
    }
    if(collections != null) {
      _data["collections"] = collections;
    }
    if(collectedIssues != null) {
      _data["collectedIssues"] = collectedIssues;
    }
    if(dates != null) {
      _data["dates"] = dates?.map((e) => e.toJson()).toList();
    }
    if(prices != null) {
      _data["prices"] = prices?.map((e) => e.toJson()).toList();
    }
    if(thumbnail != null) {
      _data["thumbnail"] = thumbnail?.toJson();
    }
    if(images != null) {
      _data["images"] = images;
    }
    if(creators != null) {
      _data["creators"] = creators?.toJson();
    }
    if(characters != null) {
      _data["characters"] = characters?.toJson();
    }
    if(stories != null) {
      _data["stories"] = stories?.toJson();
    }
    if(events != null) {
      _data["events"] = events?.toJson();
    }
    return _data;
  }
}

class Events {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Events({this.available, this.collectionUri, this.items, this.returned});

  Events.fromJson(Map<String, dynamic> json) {
    if(json["available"] is int) {
      available = json["available"];
    }
    if(json["collectionURI"] is String) {
      collectionUri = json["collectionURI"];
    }
    if(json["items"] is List) {
      items = json["items"] ?? [];
    }
    if(json["returned"] is int) {
      returned = json["returned"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["available"] = available;
    _data["collectionURI"] = collectionUri;
    if(items != null) {
      _data["items"] = items;
    }
    _data["returned"] = returned;
    return _data;
  }
}

class Stories {
  int? available;
  String? collectionUri;
  List<Items1>? items;
  int? returned;

  Stories({this.available, this.collectionUri, this.items, this.returned});

  Stories.fromJson(Map<String, dynamic> json) {
    if(json["available"] is int) {
      available = json["available"];
    }
    if(json["collectionURI"] is String) {
      collectionUri = json["collectionURI"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items1.fromJson(e)).toList();
    }
    if(json["returned"] is int) {
      returned = json["returned"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["available"] = available;
    _data["collectionURI"] = collectionUri;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["returned"] = returned;
    return _data;
  }
}

class Items1 {
  String? resourceUri;
  String? name;
  String? type;

  Items1({this.resourceUri, this.name, this.type});

  Items1.fromJson(Map<String, dynamic> json) {
    if(json["resourceURI"] is String) {
      resourceUri = json["resourceURI"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["type"] is String) {
      type = json["type"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["resourceURI"] = resourceUri;
    _data["name"] = name;
    _data["type"] = type;
    return _data;
  }
}

class Characters {
  int? available;
  String? collectionUri;
  List<dynamic>? items;
  int? returned;

  Characters({this.available, this.collectionUri, this.items, this.returned});

  Characters.fromJson(Map<String, dynamic> json) {
    if(json["available"] is int) {
      available = json["available"];
    }
    if(json["collectionURI"] is String) {
      collectionUri = json["collectionURI"];
    }
    if(json["items"] is List) {
      items = json["items"] ?? [];
    }
    if(json["returned"] is int) {
      returned = json["returned"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["available"] = available;
    _data["collectionURI"] = collectionUri;
    if(items != null) {
      _data["items"] = items;
    }
    _data["returned"] = returned;
    return _data;
  }
}

class Creators {
  int? available;
  String? collectionUri;
  List<Items>? items;
  int? returned;

  Creators({this.available, this.collectionUri, this.items, this.returned});

  Creators.fromJson(Map<String, dynamic> json) {
    if(json["available"] is int) {
      available = json["available"];
    }
    if(json["collectionURI"] is String) {
      collectionUri = json["collectionURI"];
    }
    if(json["items"] is List) {
      items = json["items"] == null ? null : (json["items"] as List).map((e) => Items.fromJson(e)).toList();
    }
    if(json["returned"] is int) {
      returned = json["returned"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["available"] = available;
    _data["collectionURI"] = collectionUri;
    if(items != null) {
      _data["items"] = items?.map((e) => e.toJson()).toList();
    }
    _data["returned"] = returned;
    return _data;
  }
}

class Items {
  String? resourceUri;
  String? name;
  String? role;

  Items({this.resourceUri, this.name, this.role});

  Items.fromJson(Map<String, dynamic> json) {
    if(json["resourceURI"] is String) {
      resourceUri = json["resourceURI"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
    if(json["role"] is String) {
      role = json["role"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["resourceURI"] = resourceUri;
    _data["name"] = name;
    _data["role"] = role;
    return _data;
  }
}

class Thumbnail {
  String? path;
  String? extension;

  Thumbnail({this.path, this.extension});

  Thumbnail.fromJson(Map<String, dynamic> json) {
    if(json["path"] is String) {
      path = json["path"];
    }
    if(json["extension"] is String) {
      extension = json["extension"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["path"] = path;
    _data["extension"] = extension;
    return _data;
  }
}

class Prices {
  String? type;
  int? price;

  Prices({this.type, this.price});

  Prices.fromJson(Map<String, dynamic> json) {
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["price"] is int) {
      price = json["price"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["price"] = price;
    return _data;
  }
}

class Dates {
  String? type;
  String? date;

  Dates({this.type, this.date});

  Dates.fromJson(Map<String, dynamic> json) {
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["date"] is String) {
      date = json["date"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["date"] = date;
    return _data;
  }
}

class Variants {
  String? resourceUri;
  String? name;

  Variants({this.resourceUri, this.name});

  Variants.fromJson(Map<String, dynamic> json) {
    if(json["resourceURI"] is String) {
      resourceUri = json["resourceURI"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["resourceURI"] = resourceUri;
    _data["name"] = name;
    return _data;
  }
}

class Series {
  String? resourceUri;
  String? name;

  Series({this.resourceUri, this.name});

  Series.fromJson(Map<String, dynamic> json) {
    if(json["resourceURI"] is String) {
      resourceUri = json["resourceURI"];
    }
    if(json["name"] is String) {
      name = json["name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["resourceURI"] = resourceUri;
    _data["name"] = name;
    return _data;
  }
}

class Urls {
  String? type;
  String? url;

  Urls({this.type, this.url});

  Urls.fromJson(Map<String, dynamic> json) {
    if(json["type"] is String) {
      type = json["type"];
    }
    if(json["url"] is String) {
      url = json["url"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["type"] = type;
    _data["url"] = url;
    return _data;
  }
}