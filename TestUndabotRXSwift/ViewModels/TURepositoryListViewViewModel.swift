//
//  TURepositoryListViewViewModel.swift
//  TestUndabotRXSwift
//
//  Created by Filip Varda on 19.02.2023..
//

import Foundation
import RxSwift
import RxCocoa

final class TURepositroyListViewViewModel {
    private var isLoadingSearchRepositories = false
    private var shouldInitialScreenPresent = true
    public var repositories = BehaviorSubject(value: [TURepository]())
    
    // MARK: - Implementation
    public func fetchRepositories() {
        APIService.shared.fetchRepositories() { [weak self] response in
            if response.totalCount > 0 {
                DispatchQueue.main.async {
                    self?.repositories.onNext(response.items)
                    self?.repositories.onCompleted()
                }
            } else {
                print("Something went wrong")
            }
        }
    }
}
