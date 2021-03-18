import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:places/mock.dart';
import 'package:places/text_string_const.dart';

///Фильтры для экрана фильтров
class FilterItem extends StatefulWidget {
  final Color checkRoundcolor;
  final Color checkMarkColor;
  final Color textColor;
  final int value;
  final String svgPath;
  final String description;
  bool isChecked;

  FilterItem({
    Key key,
    this.checkRoundcolor = Colors.black,
    this.checkMarkColor = Colors.white,
    this.textColor = Colors.black,
    @required this.value,
    @required this.svgPath,
    this.description = '',
    this.isChecked = false,
  }) : super(key: key);
  @override
  _FilterItemState createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          splashColor: const Color(0xFF4CAF50).withOpacity(0.5),
          borderRadius: BorderRadius.circular(32),
          onTap: () {
            setState(
              () {
                widget.isChecked = !widget.isChecked;
                switch (widget.value) {
                  case 1:
                    filters[filterTypeHotel] = !filters[filterTypeHotel];
                    break;
                  case 2:
                    filters[filterTypeRestaurant] =
                        !filters[filterTypeRestaurant];
                    break;
                  case 3:
                    filters[filterTypeSpecial] = !filters[filterTypeSpecial];
                    break;
                  case 4:
                    filters[filterTypePark] = !filters[filterTypePark];
                    break;
                  case 5:
                    filters[filterTypeMuseum] = !filters[filterTypeMuseum];
                    break;
                  case 6:
                    filters[filterTypeCafe] = !filters[filterTypeCafe];
                    break;
                }
              },
            );
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
                child: widget.isChecked
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
