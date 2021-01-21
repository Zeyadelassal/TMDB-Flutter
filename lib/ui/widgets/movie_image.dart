import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  final double size;
  final String url;

  const MovieImage({
    Key key, this.size, this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image(
              image: NetworkImage(url),
              fit: BoxFit.cover
          ),
        ),
    );
  }
}