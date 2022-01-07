String getRepos = """
query GetRepos(\$m: String!) {
	search(type:REPOSITORY, query:\$m ,first:10) {
    nodes{
      ... on Repository {
        createdAt
        description
        forkCount
        name
        url
        stargazerCount
        owner{
          id
          login
          avatarUrl(size:100)
        }
        openIssues: issues(states:OPEN){
          totalCount 
        }
        closedIssues: issues(states:CLOSED){
          totalCount
        }
        refs(refPrefix:"refs/heads/",first:100){
          edges{
            node{
              name
            }
          }
        }
        defaultBranchRef{
          target{
            ... on Commit{
              message
            }
          }
        }
      }
    }
  }
}
""";

const readPls = """
query readPls(\$query: String!){
	search(query: \$query, type:REPOSITORY, first:10) {
    nodes{
      ... on Repository {
        name
      }
    }
  }
}
""";
