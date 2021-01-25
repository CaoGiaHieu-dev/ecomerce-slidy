import 'package:flutter/material.dart';

class ProfileHeaderWidget extends StatelessWidget {
  final ImageProvider<dynamic> coverImage;
  final ImageProvider<dynamic> avatar;
  final String title;
  final String subtitle;
  final List<Widget> actions;

  const ProfileHeaderWidget
  (
      {
        Key key,
        @required this.coverImage,
        @required this.avatar,
        @required this.title,
        this.subtitle,
        this.actions
      }
    ): super(key: key);
  @override
  Widget build(BuildContext context) 
  {
    return Stack
    (
      children: <Widget>
      [
        Ink
        (
          height: 200,
          decoration: BoxDecoration
          (
            image: DecorationImage(image: coverImage, fit: BoxFit.cover),
          ),
        ),
        Ink
        (
          height: 200,
          decoration: BoxDecoration
          (
            color: Colors.black38,
          ),
        ),
        if (actions != null)
          Container
          (
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.only(bottom: 0.0, right: 0.0),
            alignment: Alignment.bottomRight,
            child: Row
            (
              mainAxisSize: MainAxisSize.min,
              children: actions,
            ),
          ),
        Container
        (
          width: double.infinity,
          margin: const EdgeInsets.only(top: 160),
          child: Column(
            children: <Widget>
            [
              Avatar
              (
                image: avatar,
                radius: 40,
                backgroundColor: Colors.white,
                borderColor: Colors.grey.shade300,
                borderWidth: 4.0,
              ),
              Text
              (
                title,
                style: Theme.of(context).textTheme.headline5,
              ),
              if (subtitle != null) ...
              [
                const SizedBox(height: 5.0),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ]
            ],
          ),
        )
      ],
    );
  }
}

class Avatar extends StatelessWidget 
{
  final ImageProvider<dynamic> image;
  final Color borderColor;
  final Color backgroundColor;
  final double radius;
  final double borderWidth;

  const Avatar
  (
    {
      Key key,
      @required this.image,
      this.borderColor = Colors.grey,
      this.backgroundColor,
      this.radius = 30,
      this.borderWidth = 5
    }
  ): super(key: key);

  @override
  Widget build(BuildContext context) 
  {
    return CircleAvatar
    (
      radius: radius + borderWidth,
      backgroundColor: borderColor,
      child: CircleAvatar
      (
        radius: radius,
        backgroundColor: backgroundColor != null
            ? backgroundColor
            : Theme.of(context).primaryColor,
        child: CircleAvatar
        (
          radius: radius - borderWidth,
          backgroundImage: image,
        ),
      ),
    );
  }
}