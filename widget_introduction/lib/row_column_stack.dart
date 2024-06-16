import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class RowColumnStackWidget extends StatelessWidget {
  const RowColumnStackWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(
              Icons.menu_sharp,
              size: 30,
            ),
            SizedBox(
              width: 250,
            ),
            Icon(
              Icons.add,
              size: 30,
            ),
            Icon(
              Icons.payment,
              size: 30,
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          const Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                'Current Value',
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const Row(
            children: [
              SizedBox(
                width: 12,
              ),
              Text(
                '\u{20B9}20000',
                style: TextStyle(fontSize: 35),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              const SizedBox(
                width: 14,
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(color: Colors.grey, borderRadius: BorderRadius.circular(20),),
                  child: const Row(
                children: [
                  SizedBox(width: 14,),
                  Icon(Icons.transfer_within_a_station_outlined),
                  Text('Transfer')
                ],
              ))
            ],
          ),
        ],
      ),
    );
  }
}
