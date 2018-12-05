import Foundation

class ObjectParser<T: Codable> {

    let jsonData: Data

    //MARK: Init
    init(jsonData data: Data) {
        jsonData = data
    }

    //MARK: Public Methods
    func parsedResponse() -> (response: T?, error: Swift.Error?) {
        do {

            let object = try JSONDecoder().decode(T.self, from: jsonData)
            return (object, error: nil)

        } catch (let error) {

            return (nil, error: error)
        }
    }
}
