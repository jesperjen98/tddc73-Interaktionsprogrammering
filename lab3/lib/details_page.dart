import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lab3/trending_page.dart';

class DetailsPage extends StatefulWidget {
  final Repository repo;

  const DetailsPage({Key? key, required this.repo}) : super(key: key);

  @override
  DetailsPageState createState() {
    return DetailsPageState();
  }
}

class DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.repo.name)),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Card(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.repo.name,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline2,
                ),
                Text(
                  widget.repo.description,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                ListTile(
                  title: const Text("Created By"),
                  subtitle: Text(widget.repo.ownerName),
                  leading: Image(
                    image: NetworkImage(widget.repo.ownerUrl),
                  ),
                ),
                ListTile(
                  title: const Text("Created On"),
                  subtitle: Text(widget.repo.createdAt.substring(0, 10)),
                  leading: const Icon(
                    Icons.date_range,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: const Text("Number of Forks"),
                  subtitle: Text(widget.repo.forkCount.toString()),
                  leading: const Icon(
                    Icons.call_split,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: const Text("Number of Stars"),
                  subtitle: Text(widget.repo.stargazerCount.toString()),
                  leading: const Icon(
                    Icons.star,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: const Text("Github URL"),
                  subtitle: Text(widget.repo.url),
                  leading: const Icon(
                    Icons.link,
                    size: 40,
                  ),
                ),
                ListTile(
                  title: const Text("Open Issues"),
                  subtitle: Text(widget.repo.openIssues.toString()),
                  leading: const Icon(
                    Icons.circle_outlined,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: const Text("Closed Issues"),
                  subtitle: Text(widget.repo.closedIssues.toString()),
                  leading: const Icon(
                    Icons.check,
                    size: 50,
                  ),
                ),
                ListTile(
                  title: Text("Last commit:"),
                  subtitle: Text(widget.repo.latestCommit),
                  leading: const Icon(
                    Icons.message,
                    size: 50,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
