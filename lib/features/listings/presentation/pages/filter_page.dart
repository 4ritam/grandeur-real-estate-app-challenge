import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:grandeur/core/widgets/back_button.dart';
import 'package:grandeur/core/widgets/circular_action_button.dart';
import 'package:grandeur/features/listings/domain/model/house_type.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterPage extends HookConsumerWidget {
  const FilterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final forSale = useState(true);
    final houseType = useState(House());
    final option1 = useState(false);
    final option2 = useState(false);
    final option3 = useState(false);

    return Scaffold(
      appBar: AppBar(
        leading: const BackCircularButton(),
        title: const Text('Filter Property'),
        actions: [
          FittedBox(
            fit: BoxFit.fitWidth,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: CircularActionButton(
                child: const Icon(Icons.restart_alt_outlined, size: 32),
                onPressed: () {
                  houseType.value = House();
                  forSale.value = true;
                  option1.value = false;
                  option2.value = false;
                  option3.value = false;
                },
              ),
            ),
          ),
        ],
        centerTitle: true,
        toolbarHeight: MediaQuery.of(context).size.height * 0.125,
        leadingWidth: MediaQuery.of(context).size.width * 0.20,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.width * 0.3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: MediaQuery.of(context).platformBrightness ==
                        Brightness.light
                    ? Colors.grey[300]
                    : Colors.grey[900],
              ),
              child: Row(children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 4, top: 8, bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize:
                            Size(0, MediaQuery.of(context).size.width * 0.28),
                        elevation: forSale.value ? 0 : 5,
                        backgroundColor: !forSale.value
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        foregroundColor: forSale.value
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () {
                        forSale.value = false;
                      },
                      child: const Text(
                        'For Rent',
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 4, right: 8, top: 8, bottom: 8),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize:
                            Size(0, MediaQuery.of(context).size.width * 0.28),
                        elevation: forSale.value ? 5 : 0,
                        backgroundColor: forSale.value
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        foregroundColor: forSale.value
                            ? Theme.of(context).colorScheme.onPrimary
                            : Theme.of(context).colorScheme.primary,
                      ),
                      onPressed: () {
                        forSale.value = true;
                      },
                      child: const Text(
                        'For Sale',
                      ),
                    ),
                  ),
                ),
              ]),
            ),
            const Spacer(
              flex: 2,
            ),
            Text(
              "House Type",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 1,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        houseType.value = houseType.value
                            .toggleHouseType(HouseType.realEstate);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Real Estate"),
                        backgroundColor: houseType.value.isRealEstate
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        labelStyle: TextStyle(
                          color: houseType.value.isRealEstate
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        houseType.value = houseType.value
                            .toggleHouseType(HouseType.apartment);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Apartment"),
                        backgroundColor: houseType.value.isApartment
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        labelStyle: TextStyle(
                          color: houseType.value.isApartment
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        houseType.value =
                            houseType.value.toggleHouseType(HouseType.house);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("House"),
                        backgroundColor: houseType.value.isHouse
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        labelStyle: TextStyle(
                          color: houseType.value.isHouse
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        houseType.value =
                            houseType.value.toggleHouseType(HouseType.condo);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Condo"),
                        backgroundColor: houseType.value.isCondo
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        labelStyle: TextStyle(
                          color: houseType.value.isCondo
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: GestureDetector(
                      onTap: () {
                        houseType.value = houseType.value
                            .toggleHouseType(HouseType.townHouse);
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        label: const Text("Town House"),
                        backgroundColor: houseType.value.isTownHouse
                            ? Theme.of(context).colorScheme.primary
                            : MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.grey[300]
                                : Colors.grey[900],
                        labelStyle: TextStyle(
                          color: houseType.value.isTownHouse
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Filter option 1
            CheckboxListTile(
              title: const Text('Option 1'),
              value: option1.value,
              onChanged: (value) {
                option1.value = !option1.value;
              },
            ),
            // Filter option 2
            CheckboxListTile(
              title: const Text('Option 2'),
              value: option2.value,
              onChanged: (value) {
                option2.value = !option2.value;
              },
            ),
            // Filter option 3
            CheckboxListTile(
              title: const Text('Option 3'),
              value: option3.value,
              onChanged: (value) {
                option3.value = !option3.value;
              },
            ),
            // Apply button
            ElevatedButton(
              onPressed: () {},
              child: const Text('Apply'),
            ),
          ],
        ),
      ),
    );
  }
}
