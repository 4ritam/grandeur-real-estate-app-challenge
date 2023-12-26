import 'house.dart';

class Post {
  final int id;
  final String title;
  final String description;
  final int price;
  final String address;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final double? lotSize;
  final int? floor;
  final HouseType houseType;
  final List<String> amenities;
  final List<String> images;
  final bool forSale;

  const Post({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.address,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.houseType,
    required this.amenities,
    required this.images,
    required this.forSale,
    this.lotSize,
    this.floor,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    HouseType houseType;

    switch (map['houseType']) {
      case 'apartment':
        houseType = HouseType.apartment;
        break;
      case 'house':
        houseType = HouseType.house;
        break;
      case 'condo':
        houseType = HouseType.condo;
        break;
      case 'town':
        houseType = HouseType.townHouse;
        break;
      default:
        houseType = HouseType.realEstate;
    }

    final Post post = Post(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      price: map['price'],
      address: map['address'],
      bedrooms: map['bedroom'],
      bathrooms: map['bathroom'],
      area: map['area'],
      lotSize: map['lotSize'],
      floor: map['floor'],
      houseType: houseType,
      amenities: List<String>.from(map['amenities']),
      images: List<String>.from(map['images']),
      forSale: map['forSale'],
    );

    return post;
  }

  @override
  String toString() {
    return '''
      id: ${id.runtimeType},
      title: ${title.runtimeType},
      description: ${description.runtimeType},
      price: ${price.runtimeType},
      address: ${address.runtimeType},
      bedrooms: ${bedrooms.runtimeType},
      bathrooms: ${bathrooms.runtimeType},
      area: ${area.runtimeType},
      lotSize: ${lotSize.runtimeType},
      floor: ${floor.runtimeType},
      houseType: ${houseType.runtimeType},
      amenities: ${amenities.runtimeType},
      images: ${images.runtimeType},
      forSale: ${forSale.runtimeType},
    ''';
  }
}
