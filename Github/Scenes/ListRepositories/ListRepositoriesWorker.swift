import UIKit
import Moya

protocol ListRepositoriesWorkerProtocol {
    
    func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void)
}

class ListRepositoriesWorker: ListRepositoriesWorkerProtocol {
    
    var consumer: GithubAPIConsumerProtocol = GithubAPIConsumer(provider: MoyaProvider<GithubAPI>())

    func fetch(completionHandler: @escaping ([RepositorieModel]) -> Void) {

        consumer.fetch { (repositories) in
            completionHandler(repositories)
        }
    }
}
