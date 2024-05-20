import 'package:flutter/material.dart';
import 'package:travel_app/core/constants/dismesion_constant.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class ItemAddGuestAndRoom extends StatefulWidget {
  const ItemAddGuestAndRoom(
      {super.key,
      required this.title,
      required this.icon,
      required this.initData,
      required this.updateCounts});

  final String title;
  final String icon;
  final int initData;
  final Function(int) updateCounts;
  @override
  State<ItemAddGuestAndRoom> createState() => _ItemAddGuestAndRoomState();
}

class _ItemAddGuestAndRoomState extends State<ItemAddGuestAndRoom> {
  late final TextEditingController _textEditingController;

  final FocusNode _focusNode = FocusNode();

  late int number;
  @override
  void initState() {
    super.initState();
    _textEditingController =
        TextEditingController(text: widget.initData.toString())
          ..addListener(() {
            number = int.parse(_textEditingController.text);
          });
    number = widget.initData;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: kMediumPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kTopPadding),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Row(
        children: [
          Image.asset(
            widget.icon,
            width: 36,
            height: 36,
          ),
          const SizedBox(
            width: kMediumPadding,
          ),
          Text(widget.title),
          const Spacer(),
          GestureDetector(
            onTap: () {
              if (number > 1) {
                setState(() {
                  number--;
                  _textEditingController.text = number.toString();
                  if (_focusNode.hasFocus) {
                    _focusNode.unfocus();
                  }
                  widget.updateCounts(number);
                });
              }
            },
            child: ImageHelper.loadFromAsset(
              AssetHelper.icoDecre,
            ),
          ),
          Container(
            width: 60,
            height: 35,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(left: 3),
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.center,
              focusNode: _focusNode,
              enabled: true,
              autocorrect: false,
              minLines: 1,
              maxLines: 1,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                contentPadding: EdgeInsets.only(bottom: 18),
              ),
              onChanged: (value) {
                widget.updateCounts(int.parse(value));
              },
              onSubmitted: (value) {},
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                number++;
                _textEditingController.text = number.toString();
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
                }
                widget.updateCounts(number);
              });
            },
            child: ImageHelper.loadFromAsset(AssetHelper.icoIncre),
          ),
        ],
      ),
    );
  }
}
