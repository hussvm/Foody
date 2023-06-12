//
//  NetworkService.swift
//  Foody
//
//  Created by HUSSAM on 6/10/23.
//

import Foundation

struct NetworkService {
    
    private func request<T: Codable> (route: Route,
                                      method: Method,
                                      paramters: [String: Any]? = nil,
                                      compeltion: @escaping (Result<T, Error>) -> Void) {
        guard let request = createRequest(route: route, method: method, paramters: paramters)
        else { compeltion(.failure(AppError.unkownError))
            return }
        
        URLSession.shared.dataTask(with: request) { data,response,error in
            var result: Result<Data, Error>?
            if let data = data {
                result = .success(data)
//                let responseString = String(data: data, encoding: .utf8)
                
            } else if let error = error {
                result = .failure(error)
                print("The Error is :\n\(error.localizedDescription)")
            }
            
            DispatchQueue.main.async {
                self.handleResponse(result: result, compeltion: compeltion)
            }
        } .resume()
    }
    
    
    private func handleResponse<T: Decodable>(result: Result<Data, Error>?,
                                              compeltion: (Result<T, Error>)-> Void ) {
        guard let result = result else {
            compeltion(.failure(AppError.unkownError))
            return
        }
        
        switch result {
        case .success(let data):
            let decoder = JSONDecoder()
            guard let response = try?
                    decoder.decode(ApiResponse<T>.self, from: data) else { compeltion(.failure(AppError.errorDecoding))
                return
            }
            
            if let error = response.error {
                compeltion(.failure(AppError.serverError(error)))
                return
            }
            
            if let decodedData = response.data {
                compeltion(.success(decodedData))
            } else {
                compeltion(.failure(AppError.errorDecoding))
            }
            
        case .failure(let error):
            compeltion(.failure(error))
        }
    }
    
    /// This Func help to Genrate a urlRequest
    /// - Parameters:
    ///   - route: The path to the Backend Resources
    ///   - method: The type of Request to be Made
    ///   - paramters: Whatever extra info you need to send it to the backend
    /// - Returns: Your urlRequest
    
    private func createRequest(route: Route,
                               method: Method,
                               paramters: [String: Any]? = nil) -> URLRequest? {
        
        let urlString = Route.baseUrl + route.description
        guard let url = urlString.asURL else { return nil }
        var urlRequest = URLRequest(url: url)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpMethod = method.rawValue
        
        if let params = paramters {
            switch method {
                
            case .get:
                var urlComponent = URLComponents(string: urlString)
                urlComponent?.queryItems = params.map { URLQueryItem(name: $0, value: "\($1)") }
                urlRequest.url = urlComponent?.url
                
            case .post, .patch, .delete:
                let bodyData = try?
                JSONSerialization.data(withJSONObject: paramters!)
                urlRequest.httpBody = bodyData
            }
        }
        return urlRequest
    }
}
