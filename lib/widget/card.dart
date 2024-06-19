import 'package:flutter/material.dart';

class AlgoCard extends StatelessWidget {
  final String algoname;
  final dynamic pagename;
  const AlgoCard({super.key, required this.algoname,required this.pagename});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      height: 200,
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => pagename,
          ));
        },
        child: Card(
            elevation: 10,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.bubble_chart,
                    size: 70,
                  ),
                  Text(
                    algoname,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
