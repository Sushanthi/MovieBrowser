
import Foundation
public protocol URLConvertible {
    func asURL() throws -> URL
}

extension String: URLConvertible {
    public func asURL() throws -> URL {
        guard let str = self.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: str) else { throw AFError.invalidURL(url: self) }

        return url
    }
}

extension URL: URLConvertible {
    public func asURL() throws -> URL { self }
}

public enum AFError: Error {
    case invalidURL(url: URLConvertible)
}
