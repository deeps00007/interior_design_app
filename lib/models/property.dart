import 'package:equatable/equatable.dart';

class DesignProject extends Equatable {
  final String id;
  final String title;
  final String description;
  final double price;
  final double lat;
  final double lng;
  final String imageUrl;
  final String type;
  final String? address; // Added
  final String? ownerId; // Added
  final String? ownerPhotoUrl; // Added

  final int roomCount;
  final String style;
  final double budget;
  final bool isCompleted;
  final String designerName;
  final String designerPhone;
  final List<String> gallery;

  const DesignProject({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.lat,
    required this.lng,
    required this.imageUrl,
    required this.type,
    this.ownerId,
    this.ownerPhotoUrl, // Added
    this.address,
    this.roomCount = 0,
    this.style = 'Modern',
    this.budget = 0.0,
    this.isCompleted = false,
    this.designerName = '',
    this.designerPhone = '',
    this.gallery = const [],
  });

  DesignProject copyWith({
    String? id,
    String? title,
    String? description,
    double? price,
    double? lat,
    double? lng,
    String? imageUrl,
    String? type,
    String? ownerId,
    String? ownerPhotoUrl, // Added
    String? address,
    int? roomCount,
    String? style,
    double? budget,
    bool? isCompleted,
    String? designerName,
    String? designerPhone,
    List<String>? gallery,
  }) => DesignProject(
    id: id ?? this.id,
    title: title ?? this.title,
    description: description ?? this.description,
    price: price ?? this.price,
    lat: lat ?? this.lat,
    lng: lng ?? this.lng,
    imageUrl: imageUrl ?? this.imageUrl,
    type: type ?? this.type,
    ownerId: ownerId ?? this.ownerId,
    ownerPhotoUrl: ownerPhotoUrl ?? this.ownerPhotoUrl, // Added
    address: address ?? this.address,
    roomCount: roomCount ?? this.roomCount,
    style: style ?? this.style,
    budget: budget ?? this.budget,
    isCompleted: isCompleted ?? this.isCompleted,
    designerName: designerName ?? this.designerName,
    designerPhone: designerPhone ?? this.designerPhone,
    gallery: gallery ?? this.gallery,
  );

  @override
  List<Object?> get props => [
    id,
    title,
    price,
    lat,
    lng,
    ownerId,
    ownerPhotoUrl, // Added
    address,
    roomCount,
    style,
    budget,
    isCompleted,
    designerName,
    designerPhone,
    gallery,
  ];

  String get formattedPrice {
    if (price >= 10000000) {
      return '₹${(price / 10000000).toStringAsFixed(1)}Cr';
    } else if (price >= 100000) {
      return '₹${(price / 100000).toStringAsFixed(1)}L';
    } else if (price >= 1000) {
      return '₹${(price / 1000).toStringAsFixed(0)}k';
    } else {
      return '₹${price.toStringAsFixed(0)}';
    }
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'description': description,
    'price': price,
    'lat': lat,
    'lng': lng,
    'imageUrl': imageUrl,
    'type': type,
    'ownerId': ownerId,
    'ownerPhotoUrl': ownerPhotoUrl, // Added
    'address': address,
    'roomCount': roomCount,
    'style': style,
    'budget': budget,
    'isCompleted': isCompleted,
    'designerName': designerName,
    'designerPhone': designerPhone,
    'gallery': gallery,
  };

  factory DesignProject.fromJson(Map<String, dynamic> json) => DesignProject(
    id: json['id'] ?? '',
    title: json['title'] ?? '',
    description: json['description'] ?? '',
    price: (json['price'] as num?)?.toDouble() ?? 0.0,
    lat: (json['lat'] as num?)?.toDouble() ?? 28.6692,
    lng: (json['lng'] as num?)?.toDouble() ?? 77.4549,
    imageUrl: json['imageUrl'] ?? '',
    type: json['type'] ?? '',
    ownerId: json['ownerId'],
    address: json['address'],
    roomCount: json['roomCount'] ?? json['beds'] ?? 0,
    style: json['style']?.toString() ?? json['baths']?.toString() ?? 'Modern',
    budget:
        (json['budget'] as num?)?.toDouble() ??
        (json['sqft'] as num?)?.toDouble() ??
        0.0,
    isCompleted: json['isCompleted'] ?? json['hasKitchen'] ?? false,
    designerName: json['designerName'] ?? json['agentName'] ?? '',
    designerPhone: json['designerPhone'] ?? json['agentPhone'] ?? '',
    gallery: List<String>.from(json['gallery'] ?? []),
    ownerPhotoUrl: json['ownerPhotoUrl'], // Added
  );
}
