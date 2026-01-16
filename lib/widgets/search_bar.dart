import 'dart:async';
import 'package:flutter/material.dart';
import '../theme/colors.dart';

class SearchBar extends StatefulWidget {
  final String hintText;
  final FocusNode? focusNode;
  final Function(String)? onSearchChange;
  final Function(String)? onSubmitted;
  final Widget? prefixWidget;

  const SearchBar({Key? key, required this.hintText, this.focusNode, this.onSearchChange, this.onSubmitted, this.prefixWidget}) : super(key: key);

  @override
  _SearchBarState createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late FocusNode _focusNode;
  TextEditingController textEditingController = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();
    textEditingController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      widget.onSearchChange?.call(query);
    });
  }

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        color: AppColors.textGrayColor[50]
      ),
      // padding: EdgeInsets.fromLTRB(widget.prefixWidget != null? 8 : 16, 0, 12, 0),
      height: 40,
      child: Row(
        children: [
          widget.prefixWidget ?? SizedBox(),
          if (widget.prefixWidget != null)
            SizedBox(
              width: 8,
            ),
          Expanded(
            child: TextField(
              textCapitalization: TextCapitalization.sentences,
              focusNode: _focusNode,
              controller: textEditingController,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textDefault, fontWeight: FontWeight.w400),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 12),
                focusedBorder: OutlineInputBorder(borderSide: BorderSide.none),
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                isCollapsed: true,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: AppColors.textGrayColor[400],
                  size: 16,
                ),
                suffixIcon: GestureDetector(
                  onTap: () {
                    textEditingController.clear();
                    _onSearchChanged('');
                  },
                  child: (textEditingController.text.isEmpty)
                      ? SizedBox()
                      : Icon(
                        Icons.clear,
                        color: AppColors.textGrayColor[400],
                        size: 16,
                      ),
                ),
                hintText: widget.hintText,
                hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(color: AppColors.textGrayColor[500], fontWeight: FontWeight.w400),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
              onChanged: _onSearchChanged,
              onSubmitted: widget.onSubmitted,
            ),
          ),
        ],
      ),
    );
  }
}
