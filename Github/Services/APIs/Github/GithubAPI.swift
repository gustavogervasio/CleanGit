import Moya

enum GithubAPI {
    case repositories
}

extension GithubAPI: TargetType {

    var baseURL: URL {
        return ServiceConfiguration.sharedInstance.environment.mobileURL
    }

    var path: String {
        switch self {
        case .repositories:
            return "/search/repositories"
        }
    }

    var method: Moya.Method {
        return .get
    }

    var task: Task {
        switch self {
        case .repositories:
            return .requestParameters(parameters: ["q": "swift"], encoding: URLEncoding.default)
        }
    }

    var validationType: ValidationType {
        return .none
    }

    var headers: [String: String]? {
        return nil
    }

    // MARK: To test
    var sampleData: Data {
        switch self {
        case .repositories:
            return  """
                    {
                        "items": [
                            {
                                "id": 44838949,
                                "name": "swift",
                                "full_name": "apple/swift",
                                "private": false,
                                "url": "https://api.github.com/repos/apple/swift",
                                "forks_url": "https://api.github.com/repos/apple/swift/forks",
                                "created_at": "2015-10-23T21:15:07Z",
                                "updated_at": "2018-12-04T16:30:48Z",
                                "git_url": "git://github.com/apple/swift.git",
                                "ssh_url": "git@github.com:apple/swift.git",
                                "clone_url": "https://github.com/apple/swift.git",
                                "homepage": "https://swift.org",
                                "watchers_count": 45925,
                                "has_issues": false,
                                "has_projects": false,
                                "has_downloads": true,
                                "has_wiki": false,
                                "has_pages": false,
                                "forks_count": 7298,
                                "mirror_url": null,
                                "archived": false,
                                "open_issues_count": 460,
                                "forks": 7298,
                                "open_issues": 460,
                                "watchers": 45925,
                                "default_branch": "master",
                                "score": 155.90111
                            }
                        ]
                    }
                    """.data(using: .utf8)!
        }
    }
}
