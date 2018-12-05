import Moya

protocol GithubAPIConsumerProtocol {

    var provider: MoyaProvider<GithubAPI> { get }
    
    init(provider: MoyaProvider<GithubAPI>)
    func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void)
}

class GithubAPIConsumer: GithubAPIConsumerProtocol {

    var provider: MoyaProvider<GithubAPI>

    // MARK: Init
    required init(provider: MoyaProvider<GithubAPI>) {
        self.provider = provider
    }

    //MARK: Public Methods (GithubAPIConsumerProtocol)
    func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void) {

        let _ = APIConsumer(provider).consume(target: .repositories, success: { (list: ListRepositoriesModel) in

            completionHandler(list.items)

        }) { (error: Error) in

            completionHandler([])
        }
    }
}
