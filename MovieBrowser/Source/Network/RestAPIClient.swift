
import Foundation

/// This class is an interface to call the rest API.

class RestAPIClient {

    private static func requestData<T: Codable>(type: T.Type,
                                                route: APIRouter,
                                                completion:@escaping (Swift.Result < T,
                                                                                     APIError>)
                                                    -> Void) {

        do {
            let request = try route.asURLRequest()
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                DispatchQueue.main.async {
                    if error != nil {
                        completion(.failure(APIError.runtimeError(error?.localizedDescription ?? "")))
                    }  else {
                        do {
                            guard let data = data else {
                                completion(.failure(APIError.runtimeError("No Proper data recieved")))
                                return
                            }
                            let obj = try JSONDecoder().decode(T.self, from: data)
                            completion(.success(obj))
                        } catch {
                            completion(.failure(APIError.runtimeError("Decoding failed")))
                        }
                    }
                }
            }.resume()

        } catch let error {
            completion(.failure(APIError.runtimeError(error.localizedDescription)))
        }
    }

    static func getSearchData(searchText: String,
                              completion:@escaping (Swift.Result<MovieModel, APIError>) -> Void) {
        return requestData(type: MovieModel.self, route: APIRouter.getSearchData(searchText: searchText), completion: completion)

    }
}
