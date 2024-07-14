import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:product_api_app/bloc/product_bloc.dart';
import 'package:product_api_app/bloc/product_event.dart';
import 'package:product_api_app/bloc/product_state.dart';

class CustomFilterChipWidget extends StatelessWidget {
  const CustomFilterChipWidget({
    super.key,
    required this.state,
    required this.tagsList,
  });

  final ProductStateLoaded state;
  final List<String> tagsList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: tagsList.length,
          itemBuilder: (context, index) {
            final tag = tagsList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4.0),
              child: FilterChip(
                selectedColor: Colors.orange,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                label: Text(
                  tag,
                  style: TextStyle(
                    color: state.selectedTags.contains(tag)
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
                selected: state.selectedTags.contains(tag),
                onSelected: (selected) {
                  context.read<ProductBloc>().add(
                        ProductEventSelectTag(state.selectedTags, tag, selected),
                      );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
