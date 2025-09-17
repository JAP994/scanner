class ServiceModel {
  final int id;
  final String documentId;
  final String name;
  final String description;
  final double price;
  final MediaFile icon;
  final MediaFile banner;
  final String urlSmall;

  ServiceModel({
    required this.id,
    required this.documentId,
    required this.name,
    required this.description,
    required this.price,
    required this.icon,
    required this.banner,
    required this.urlSmall,
  });

  factory ServiceModel.fromJson(Map<String, dynamic> json) {
    return ServiceModel(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      icon: MediaFile.fromJson(json['icon']),
      banner: MediaFile.fromJson(json['banner']),
      urlSmall: json["icon"]?["formats"]?["small"]?["url"] ?? ""
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "documentId": documentId,
      "name": name,
      "description": description,
      "price": price,
      "icon": icon.toJson(),
      "banner": banner.toJson(),
    };
  }
}

class MediaFile {
  final int id;
  final String documentId;
  final String name;
  final int width;
  final int height;
  final String url;
  final String mime;
  final double size;
  final MediaFormats? formats;

  MediaFile({
    required this.id,
    required this.documentId,
    required this.name,
    required this.width,
    required this.height,
    required this.url,
    required this.mime,
    required this.size,
    this.formats,
  });

  factory MediaFile.fromJson(Map<String, dynamic> json) {
    return MediaFile(
      id: json['id'],
      documentId: json['documentId'],
      name: json['name'],
      width: json['width'],
      height: json['height'],
      url: json['url'],
      mime: json['mime'],
      size: (json['size'] as num).toDouble(),
      formats: json['formats'] != null
          ? MediaFormats.fromJson(json['formats'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "documentId": documentId,
      "name": name,
      "width": width,
      "height": height,
      "url": url,
      "mime": mime,
      "size": size,
      "formats": formats?.toJson(),
    };
  }
}

class MediaFormats {
  final Map<String, MediaFormat> sizes;

  MediaFormats({required this.sizes});

  factory MediaFormats.fromJson(Map<String, dynamic> json) {
    final sizes = <String, MediaFormat>{};
    json.forEach((key, value) {
      sizes[key] = MediaFormat.fromJson(value);
    });
    return MediaFormats(sizes: sizes);
  }

  Map<String, dynamic> toJson() {
    return sizes.map((key, value) => MapEntry(key, value.toJson()));
  }
}


class MediaFormat {
  final String ext;
  final String url;
  final String hash;
  final String mime;
  final String name;
  final String? path;
  final double size;
  final int width;
  final int height;
  final int sizeInBytes;

  MediaFormat({
    required this.ext,
    required this.url,
    required this.hash,
    required this.mime,
    required this.name,
    this.path,
    required this.size,
    required this.width,
    required this.height,
    required this.sizeInBytes,
  });

  factory MediaFormat.fromJson(Map<String, dynamic> json) {
    return MediaFormat(
      ext: json['ext'],
      url: json['url'],
      hash: json['hash'],
      mime: json['mime'],
      name: json['name'],
      path: json['path'],
      size: (json['size'] as num).toDouble(),
      width: json['width'],
      height: json['height'],
      sizeInBytes: json['sizeInBytes'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ext': ext,
      'url': url,
      'hash': hash,
      'mime': mime,
      'name': name,
      'path': path,
      'size': size,
      'width': width,
      'height': height,
      'sizeInBytes': sizeInBytes,
    };
  }
}
