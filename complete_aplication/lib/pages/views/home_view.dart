import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CardItem {
  final String urlImage;
  final String title;
  final String subtitle;

  const CardItem({
    required this.urlImage,
    required this.title,
    required this.subtitle,
  });
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<CardItem> items = [
    CardItem(
      urlImage:
          'https://images.unsplash.com/photo-1654876203651-64761cbcc5cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'Nome Item',
      subtitle: 'R\$ 100',
    ),
    CardItem(
      urlImage:
          'https://images.unsplash.com/photo-1654876203651-64761cbcc5cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'Nome Item',
      subtitle: 'R\$ 100',
    ),
    CardItem(
      urlImage:
          'https://images.unsplash.com/photo-1654876203651-64761cbcc5cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'Nome Item',
      subtitle: 'R\$ 100',
    ),
    CardItem(
      urlImage:
          'https://images.unsplash.com/photo-1654876203651-64761cbcc5cc?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
      title: 'Nome Item',
      subtitle: 'R\$ 100',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(),
        Container(
          height: 200,
          child: ListView.separated(
            padding: EdgeInsets.all(16),
            scrollDirection: Axis.horizontal,
            itemCount: 6,
            separatorBuilder: (context, _) => SizedBox(width: 10),
            itemBuilder: (context, index) => buildCard(item: items[0]),
          ),
        ),
      ],
    );
  }

  Widget buildCard({
    required CardItem item,
  }) =>
      Container(
        width: 160,
        child: Column(
          children: [
            Expanded(
              child: AspectRatio(
                aspectRatio: 4 / 3,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    item.urlImage,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(
              item.title,
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 4),
            Text(
              item.subtitle,
              style: TextStyle(fontSize: 15),
            )
          ],
        ),
      );
}
