import 'package:flutter/material.dart';
import 'package:places/colors.dart';
import 'package:places/text_string_const.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: double.infinity,
      child: TextField(
        textCapitalization: TextCapitalization.sentences,
        style: Theme.of(context).textTheme.caption,
        cursorWidth: 1,
        cursorHeight: 24,
        decoration: InputDecoration(
          suffixIcon: IconButton(
            icon: const Icon(Icons.cancel),
            onPressed: () {},
            color: Theme.of(context).primaryColorDark,
          ),
          contentPadding:
              const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
          hintText: searchBarHint,
          hintStyle: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: lmInactiveBlackColor),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: lmBackgroundColor, width: 1.0),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
