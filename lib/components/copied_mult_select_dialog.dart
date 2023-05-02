// edited from https://pub.dev/packages/multi_select_flutter

import 'package:flutter/material.dart';
import 'package:let_tutor/components/class_schedule_status_widget.dart';
import 'package:multi_select_flutter/util/multi_select_actions.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

import '../flutter_flow/flutter_flow_theme.dart';

/// A dialog containing either a classic checkbox style list, or a chip style list.
class MultiSelectDialog<T> extends StatefulWidget with MultiSelectActions<T> {
  /// List of items to select from.
  final List<MultiSelectItem<T>> items;
  final List<MultiSelectItem<T>> items2;

  /// The list of selected values before interaction.
  final List<T> initialValue;

  /// The text at the top of the dialog.
  final Widget? title;

  /// Fires when the an item is selected / unselected.
  final void Function(List<T>)? onSelectionChanged;

  /// Fires when confirm is tapped.
  final void Function(List<T>)? onConfirm;

  /// Toggles search functionality. Default is false.
  final bool searchable;

  /// Text on the confirm button.
  final Text? confirmText;

  /// Text on the cancel button.
  final Text? cancelText;

  /// An enum that determines which type of list to render.
  final MultiSelectListType? listType;

  /// Sets the color of the checkbox or chip when it's selected.
  final Color? selectedColor;

  /// Sets a fixed height on the dialog.
  final double? height;

  /// Sets a fixed width on the dialog.
  final double? width;

  /// Set the placeholder text of the search field.
  final String? searchHint;

  /// A function that sets the color of selected items based on their value.
  /// It will either set the chip color, or the checkbox color depending on the list type.
  final Color? Function(T)? colorator;

  /// The background color of the dialog.
  final Color? backgroundColor;

  /// The color of the chip body or checkbox border while not selected.
  final Color? unselectedColor;

  /// Icon button that shows the search field.
  final Icon? searchIcon;

  /// Icon button that hides the search field
  final Icon? closeSearchIcon;

  /// Style the text on the chips or list tiles.
  final TextStyle? itemsTextStyle;

  /// Style the text on the selected chips or list tiles.
  final TextStyle? selectedItemsTextStyle;

  /// Style the search text.
  final TextStyle? searchTextStyle;

  /// Style the search hint.
  final TextStyle? searchHintStyle;

  /// Moves the selected items to the top of the list.
  final bool separateSelectedItems;

  /// Set the color of the check in the checkbox
  final Color? checkColor;

  MultiSelectDialog({
    required this.items,
    required this.items2,
    required this.initialValue,
    this.title,
    this.onSelectionChanged,
    this.onConfirm,
    this.listType,
    this.searchable = false,
    this.confirmText,
    this.cancelText,
    this.selectedColor,
    this.searchHint,
    this.height,
    this.width,
    this.colorator,
    this.backgroundColor,
    this.unselectedColor,
    this.searchIcon,
    this.closeSearchIcon,
    this.itemsTextStyle,
    this.searchHintStyle,
    this.searchTextStyle,
    this.selectedItemsTextStyle,
    this.separateSelectedItems = false,
    this.checkColor,
  });

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<T>(items, items2);
}

class _MultiSelectDialogState<T> extends State<MultiSelectDialog<T>> {
  List<T> _selectedValues = [];
  bool _showSearch = false;
  List<MultiSelectItem<T>> _items;
  List<MultiSelectItem<T>> _items2;

  _MultiSelectDialogState(this._items, this._items2);

  @override
  void initState() {
    super.initState();
    _selectedValues.addAll(widget.initialValue);

    for (int i = 0; i < _items.length; i++) {
      _items[i].selected = false;
      if (_selectedValues.contains(_items[i].value)) {
        _items[i].selected = true;
      }
    }

    for (int i = 0; i < _items2.length; i++) {
      _items2[i].selected = false;
      if (_selectedValues.contains(_items2[i].value)) {
        _items2[i].selected = true;
      }
    }

    if (widget.separateSelectedItems) {
      _items = widget.separateSelected(_items);
    }
  }

  /// Returns a CheckboxListTile
  Widget _buildListItem(MultiSelectItem<T> item) {
    return CheckboxListTile(
      checkColor: widget.checkColor,
      value: item.selected,
      activeColor: widget.colorator != null
          ? widget.colorator!(item.value) ?? widget.selectedColor
          : widget.selectedColor,
      title: Text(
        item.label,
        style: item.selected
            ? widget.selectedItemsTextStyle
            : widget.itemsTextStyle,
      ),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) {
        setState(() {
          _selectedValues =
              widget.onItemCheckedChange(_selectedValues, item.value, checked!);

          if (checked) {
            item.selected = true;
          } else {
            item.selected = false;
          }
          if (widget.separateSelectedItems) {
            _items = widget.separateSelected(_items);
          }
        });
        if (widget.onSelectionChanged != null) {
          widget.onSelectionChanged!(_selectedValues);
        }
      },
    );
  }

  /// Returns a ChoiceChip
  Widget _buildChipItem(MultiSelectItem<T> item) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 0, 5, 5),
      child: RawChip(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(200),
        ),
        side: BorderSide(color: Colors.transparent),
        visualDensity: VisualDensity(horizontal: 0.0, vertical: -4),
        backgroundColor: Colors.grey.shade200,
        selectedColor: Color(0xFFBCE8FF),
        label: Text(
          item.label,
          style: TextStyle(fontSize: 15),
        ),
        labelStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: FlutterFlowTheme.of(context).bodyText1Family,
              color: Color(0xFF2767FF),
            ),
        showCheckmark: false,
        selected: item.selected,
        onSelected: (checked) {
          if (checked) {
            item.selected = true;
          } else {
            item.selected = false;
          }
          setState(() {
            _selectedValues = widget.onItemCheckedChange(
                _selectedValues, item.value, checked);
          });
          if (widget.onSelectionChanged != null) {
            widget.onSelectionChanged!(_selectedValues);
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black54,
      child: AlertDialog(
        elevation: 0,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(15.0)),
            side: BorderSide(color: Colors.grey.shade300)),
        // title: widget.title,
        contentPadding: widget.listType == null ||
                widget.listType == MultiSelectListType.LIST
            ? EdgeInsets.only(top: 12.0)
            : EdgeInsets.all(20),
        content: Container(
          height: widget.height,
          width: widget.width ?? MediaQuery.of(context).size.width * 0.73,
          child: widget.listType == null ||
                  widget.listType == MultiSelectListType.LIST
              ? ListView.builder(
                  itemCount: _items.length,
                  itemBuilder: (context, index) {
                    return _buildListItem(_items[index]);
                  },
                )
              : SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Subjects',
                        style: FlutterFlowTheme.of(context)
                            .title1
                            .override(
                            fontFamily: FlutterFlowTheme.of(context)
                                .title2Family,
                            fontSize: 22),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: _items2.map(_buildChipItem).toList(),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Test Preparation',
                        style: FlutterFlowTheme.of(context).title2,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Wrap(
                        children: _items.map(_buildChipItem).toList(),
                      ),
                    ],
                  ),
                ),
        ),
        actions: <Widget>[
          SizedBox(
            width: 85,
            child: NegativeButton(
              title: 'Cancel',
              onPressed: () {
                widget.onCancelTap(context, widget.initialValue);
              },
            ),
          ),
          SizedBox(
            width: 85,
            child: PositiveButton(
              title: 'Save',
              onPressed: () {
                widget.onConfirmTap(context, _selectedValues, widget.onConfirm);
              },
            ),
          )
        ],
      ),
    );
  }
}
