import UIKit
import Moya

enum APIError: Error {
    case unknownError
    case codableError
}

class APIConsumer<Target: TargetType>: NSObject {

    let provider: MoyaProvider<Target>

    init(_ aProvider: MoyaProvider<Target>) {
        provider = aProvider
        super.init()
    }

    func consume<T: Codable>(target: Target, success: @escaping ((T) -> Void) = { _ in }, failure: @escaping ((Error) -> Void)) {

        provider.request(target) { (result) -> () in

            func handleError(error: Error) {
                failure(error)
            }

            switch result {
            case let .success(moyaResponse):
                let data = moyaResponse.data
                let statusCode = moyaResponse.statusCode

                guard statusCode == 200 else {
                    return handleError(error: APIError.unknownError)
                }

                let parser = ObjectParser<T>(jsonData: data)
                let parsedResponse = parser.parsedResponse()

                if let validResponse = parsedResponse.response {
                    success(validResponse)
                } else if let error = parsedResponse.error {
                    handleError(error: error)
                } else {
                    handleError(error: APIError.codableError)
                }

            case let .failure(error):
                handleError(error: error)
            }
        }
    }
}

