enum HouseType {
  realEstate("Real Estate"),
  apartment("Apartment"),
  house("House"),
  condo("Condo"),
  townHouse("Town House");

  const HouseType(this.message);
  final String message;
}

class House {
  bool isRealEstate = true;
  bool isApartment = false;
  bool isHouse = false;
  bool isCondo = false;
  bool isTownHouse = false;

  House toggleHouseType(HouseType type) {
    switch (type) {
      case HouseType.realEstate:
        isRealEstate = !isRealEstate;
        break;
      case HouseType.apartment:
        isApartment = !isApartment;
        break;
      case HouseType.house:
        isHouse = !isHouse;
        break;
      case HouseType.condo:
        isCondo = !isCondo;
        break;
      case HouseType.townHouse:
        isTownHouse = !isTownHouse;
        break;
    }
    return clone();
  }

  House clone() {
    final house = House();
    house.isRealEstate = isRealEstate;
    house.isApartment = isApartment;
    house.isHouse = isHouse;
    house.isCondo = isCondo;
    house.isTownHouse = isTownHouse;
    return house;
  }
}
