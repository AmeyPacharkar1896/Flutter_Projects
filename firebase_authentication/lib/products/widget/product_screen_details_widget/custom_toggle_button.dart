import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jkb_firebase_chat/products/bloc/product_bloc.dart';

class CustomToggleButton extends StatelessWidget {
  const CustomToggleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        context
            .read<ProductBloc>()
            .add(ProductEventChangeState());
        if (state is ProductStateLoaded) {
          return Center(
            child: ToggleButtons(
              selectedColor: Colors.orange,
              isSelected: [
                state.selectedSegment == 0,
                state.selectedSegment == 1,
                state.selectedSegment == 2,
              ],
              onPressed: (int index) {
                context
                    .read<ProductBloc>()
                    .add(ProductEventSelectSegment(index));
              },
              children: const [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('Description'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('Details'),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text('Reviews'),
                ),
              ],
            ),
          );
        }
        return Container();
      },
    );
  }
}
