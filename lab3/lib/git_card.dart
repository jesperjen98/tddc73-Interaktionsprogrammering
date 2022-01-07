import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab3/details_page.dart';
import 'package:lab3/trending_page.dart';

class GitCard extends StatefulWidget {
  final Repository repo;
  const GitCard({
    Key? key,
    required this.repo,
  }) : super(key: key);

  @override
  GitCardState createState() {
    return GitCardState();
  }
}

class GitCardState extends State<GitCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        splashColor: Colors.lightBlue,
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => DetailsPage(repo: widget.repo)),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.repo.name,
                style: Theme.of(context).textTheme.headline1,
              ),
              Text(widget.repo.description,
                  style: Theme.of(context).textTheme.subtitle1),
              RichText(
                  text: TextSpan(children: [
                WidgetSpan(
                  child: const Icon(Icons.call_split, size: 14),
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                TextSpan(
                    text: widget.repo.forkCount.toString(),
                    style: Theme.of(context).textTheme.bodyText1),
                WidgetSpan(
                    child: const Icon(Icons.star, size: 14),
                    style: Theme.of(context).textTheme.bodyText1),
                TextSpan(
                    text: widget.repo.stargazerCount.toString(),
                    style: Theme.of(context).textTheme.bodyText1)
              ])),
            ],
          ),
        ),
      ),
    );
  }
}
