import 'package:flutter/material.dart';
import 'package:pixel_game/widget/colors_in_pallete.dart';
import 'package:pixel_game/widget/pixel_widget.dart';

const totalRows = 24;
const totalColumns = 24;

class PixelArtScreen extends StatefulWidget {
  const PixelArtScreen({super.key});

  @override
  State<PixelArtScreen> createState() => _PixelArtScreenState();
}

class _PixelArtScreenState extends State<PixelArtScreen> {
  late List<Color?> pixels;
  late List<Color> palette;
  late Color selectedColor;

  @override
  void initState() {
    super.initState();
    pixels = List.filled(
      totalRows * totalColumns,
      null,
    );
    palette = [
      const Color(0xFFC6C6C6),
      const Color(0xFFFE0652),
      const Color(0xFF080101),
      const Color(0xFFF9A332),
      const Color(0xFFFF6D34),
      const Color(0xFFD04D5D),
    ];
    selectedColor = palette[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pixel Art'),
      ),
      body: Stack(
        children: [
          GridView.builder(
            physics: const ClampingScrollPhysics(),
            itemCount: pixels.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: totalRows,
            ),
            itemBuilder: (context, index) {
              return PixelWidget(
                index: index,
                color: pixels[index],
                onTap: () {
                  setState(() {
                    pixels[index] = selectedColor;
                  });
                },
              );
            },
          ),
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: SizedBox(
              height: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: palette.map((color) {
                  bool isSelected = color == selectedColor;
                  return ColorInPallete(onTap: () { 
                    setState(() {
                        selectedColor = color;
                      });
                   }, isSelected: isSelected, color: color,);
                }).toList(),
              ),
            ),
          ),
        ],
      ),
    );
  }

}