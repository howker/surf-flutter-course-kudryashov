import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FilterItem extends StatefulWidget {
  final Color checkRoundcolor;
  final Color checkMarkColor;
  final Color textColor;
  final int value;
  final String svgPath;
  final String description;

  const FilterItem({
    Key key,
    this.checkRoundcolor = Colors.black,
    this.checkMarkColor = Colors.white,
    this.textColor = Colors.black,
    @required this.value,
    @required this.svgPath,
    this.description = '',
  }) : super(key: key);
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  bool _isChecked = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: const Color(0xFF4CAF50).withOpacity(0.5),
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            setState(() {
              _isChecked = !_isChecked;
            });
          },
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              SvgPicture.asset(
                widget.svgPath,
                width: 64,
                height: 64,
              ),
              Container(
                height: 16,
                width: 16,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.checkRoundcolor,
                ),
                child: _isChecked
                    ? Icon(
                        Icons.check,
                        size: 9,
                        color: widget.checkMarkColor,
                      )
                    : const SizedBox(),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          widget.description,
          style: TextStyle(
              color: Theme.of(context).primaryColorDark,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
