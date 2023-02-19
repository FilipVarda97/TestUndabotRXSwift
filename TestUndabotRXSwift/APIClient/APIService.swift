//
//  APIService.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import Foundation
import Alamofire

final class APIService {
    static let shared = APIService()
    // MARK: The enpoint is hardcoded. This is th url of request:
    private let reposUrl = "https://api.github.com/search/repositories?q=Repo"
    
    public func fetchRepositories(completion: @escaping (TURepositoriesResponse) -> Void) {
        AF.request(reposUrl, method: .get).response { response in
            switch response.result {
            case .success(let data):
                do {
                    guard let data = data else { return }
                    let response = try JSONDecoder().decode(TURepositoriesResponse.self, from: data)
                    completion(response)
                } catch let error {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
