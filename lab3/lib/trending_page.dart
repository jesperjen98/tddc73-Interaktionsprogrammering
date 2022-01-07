import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:lab3/git_card.dart';
import 'package:lab3/queries.dart';

class Repository {
  final String createdAt;
  final String description;
  final int forkCount;
  final String name;
  final String url;
  final int stargazerCount;
  final String ownerId;
  final String ownerName;
  final String ownerUrl;
  final int openIssues;
  final int closedIssues;
  final List<Object?> branches;
  final String latestCommit;

  Repository({
    required this.createdAt,
    required this.description,
    required this.forkCount,
    required this.name,
    required this.url,
    required this.stargazerCount,
    required this.ownerId,
    required this.ownerName,
    required this.ownerUrl,
    required this.openIssues,
    required this.closedIssues,
    required this.branches,
    required this.latestCommit,
  });
}

class TrendingPage extends StatefulWidget {
  const TrendingPage({Key? key}) : super(key: key);

  @override
  TrendingPageState createState() {
    return TrendingPageState();
  }
}

class TrendingPageState extends State<TrendingPage> {
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Github trending page")),
      body: Container(
        color: Colors.grey[200],
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                      controller: searchController,
                    )),
                    SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: () => setState(() {}),
                      child: Text("Search"),
                    ),
                  ],
                ),
              ),
            ),
            Query(
              options: QueryOptions(
                document: gql(getRepos),
                variables: {
                  'm': searchController.text +
                      " in:name,description,readme,owner language:javascript sort:stars-desc pushed:>2021-12-01",
                },
              ),
              builder: (result, {fetchMore, refetch}) {
                if (result.hasException) {
                  debugPrint(result.exception.toString());
                  return Text(result.exception.toString());
                }
                if (result.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                final repos = result.data?['search']['nodes'];
                return Expanded(
                  child: ListView.builder(
                    itemCount: repos.length,
                    itemBuilder: (_, index) {
                      var currentRepo = repos[index];
                      Repository r = Repository(
                          branches: currentRepo?["refs"]["edges"],
                          closedIssues: currentRepo["closedIssues"]
                              ["totalCount"],
                          createdAt: currentRepo['createdAt'],
                          description: currentRepo['description'],
                          forkCount: currentRepo['forkCount'],
                          latestCommit: currentRepo['defaultBranchRef']
                              ['target']['message'],
                          name: currentRepo['name'],
                          openIssues: currentRepo['openIssues']['totalCount'],
                          ownerId: currentRepo['owner']['id'],
                          ownerName: currentRepo['owner']['login'],
                          ownerUrl: currentRepo['owner']['avatarUrl'],
                          stargazerCount: currentRepo['stargazerCount'],
                          url: currentRepo['url']);

                      return GitCard(
                        repo: r,
                      );

                      return Text(currentRepo["name"]);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
