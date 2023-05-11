import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/major.dart';
import 'my_chip.dart';

export 'tutor_specialties_model.dart';

class TutorSpecialtiesWidget extends StatelessWidget {
  const TutorSpecialtiesWidget({
    Key? key,
    required this.specialties,
  }) : super(key: key);

  final String? specialties;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Align(
        alignment: AlignmentDirectional(-1.0, 0.0),
        child: Wrap(
          spacing: 0.0,
          runSpacing: 0.0,
          alignment: WrapAlignment.start,
          crossAxisAlignment: WrapCrossAlignment.start,
          direction: Axis.horizontal,
          runAlignment: WrapAlignment.start,
          verticalDirection: VerticalDirection.down,
          clipBehavior: Clip.none,
          children: _getSpecialties(specialties!),
        ),
      ),
    );
  }

  static Map<String, String> mappedString = {
    'english-for-kids': 'English for Kids'.tr,
    'business-english': 'Business English'.tr,
    'conversational-english': 'Conversational English'.tr,
    'starters': 'STARTERS',
    'movers': 'MOVERS',
    'flyers': 'FLYERS',
    'ket': 'KET',
    'pet': 'PET',
    'ielts': 'IELTS',
    'toefl': 'TOEFL',
    'toeic': 'TOEIC',
  };

  List<MyChip> _getSpecialties(String specialties) {
    var list = <MyChip>[];
    var parsedSpecialties = specialties.split(',').map((e) {
      if (mappedString.containsKey(e))
        return mappedString[e];
      else if (Major.Majors![e] != null) return Major.Majors![e]!.englishName;
    }).toList();

    parsedSpecialties
        .forEach((element) => list.add(MyChip(data: element ?? '')));

    return list;
  }
}
