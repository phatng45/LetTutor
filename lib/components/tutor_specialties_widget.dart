import 'package:flutter/material.dart';

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
    return Align(
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
    );
  }

  List<MyChip> _getSpecialties(String specialties) {
    var list = <MyChip>[];
    var parsedSpecialties = specialties.split(',');
    for (var specialties in parsedSpecialties) {
      list.add(MyChip(data: specialties));
    }
    return list;
  }
}
