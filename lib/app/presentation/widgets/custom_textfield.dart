import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'helpers.dart';

class CustomTextFiledSection extends StatefulWidget {
  final String title;
  final TextEditingController textEditingController;
  final int maxLength;
  final String hintText;
  final String image;
  final int maxLines;
  final bool isPrefixIcon;
  final bool isSuffixIcon;
  const CustomTextFiledSection({super.key,
    required this.title,
    required this.textEditingController,
    required this.maxLength,
    required this.hintText,
    required this.image,
    required this.maxLines,
    required this.isPrefixIcon,
    required this.isSuffixIcon,
  });

  @override
  State<CustomTextFiledSection> createState() => _CustomTextFiledSectionState();
}

class _CustomTextFiledSectionState extends State<CustomTextFiledSection> {

  int textLength = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700,),),
            Text(widget.maxLength == 1 ? '' :'${Helpers().convertEnglishNumberToBengali(widget.maxLength - textLength)} শব্দ',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
            ),
          ],
        ),
        const SizedBox(height: 10,),
        TextFormField(
          controller: widget.textEditingController,
          cursorColor: Colors.grey,
          maxLength: widget.maxLength,
          maxLengthEnforcement: MaxLengthEnforcement.none,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            counter: const SizedBox(),
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400,),
            fillColor: Colors.black.withOpacity(0.05),
            filled: true,
            contentPadding: const EdgeInsets.only(top: 15, left: 5),
            isDense: true,
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.green.withOpacity(0.3),),
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3),),
              borderRadius: BorderRadius.circular(15),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3),),
              borderRadius: BorderRadius.circular(15),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.3),),
              borderRadius: BorderRadius.circular(15),
            ),
            prefixIconConstraints: const BoxConstraints(
              maxWidth: 60,
              maxHeight: 23,
              minWidth: 23,
            ),
            prefixIcon: widget.isPrefixIcon ? Padding(
              padding: const EdgeInsets.only(left: 22.0, right: 15.0,),
              child: Image.asset(widget.image, width: 16, height: 16,),
            ) : const SizedBox(),
            suffixIcon: widget.isPrefixIcon ? const Padding(
              padding: EdgeInsets.symmetric(horizontal: 22.0,),
              child: Icon(Icons.arrow_forward_ios, size: 15, weight: 1.0,),
            ) : const SizedBox(),
          ),
          onChanged: (value){
            setState(() {
              textLength = value.length;
            });
          },
        ),
      ],
    );
  }
}