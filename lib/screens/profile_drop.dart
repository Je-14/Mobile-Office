import 'package:flutter/material.dart';

class DropList extends StatefulWidget {
  const DropList({Key? key}) : super(key: key);

  @override
  _DropListState createState() => _DropListState();
}

class _DropListState extends State<DropList> {
  static const menuItems = <String>[
    'logout',
    'Settings',
  ];
  // final List<DropdownMenuItem<String>> _dropDownMenuItems = menuItems
  //     .map(
  //       (String value) => DropdownMenuItem<String>(
  //         value: value,
  //         child: Text(value),
  //       ),
  //     )
  //     .toList();
  final List<PopupMenuItem<String>> _popUpMenuItems = menuItems
      .map(
        (String value) => PopupMenuItem<String>(
          value: value,
          child: Text(value),
        ),
      )
      .toList();

  late String _btnSelectedVal;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color.fromARGB(255, 122, 247, 170),
      child: ListTile(
        title: const Text('Profile '),
        trailing: PopupMenuButton<String>(
          onSelected: (String newValue) {
            _btnSelectedVal = newValue;
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(_btnSelectedVal),
              ),
            );
          },
          itemBuilder: (BuildContext context) => _popUpMenuItems,
        ),
      ),
    );
  }
}
