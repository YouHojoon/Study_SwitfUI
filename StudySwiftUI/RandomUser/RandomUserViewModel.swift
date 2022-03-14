//
//  RandomUserViewModel.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/01/03.
//

import Foundation
import Combine
import Alamofire

class RandomUserViewModel: ObservableObject{
    private init(){
        fetchMoreActionSubject.sink{
            self.fetchMore()
        }.store(in: &subscription)
    }
    
    public static let shared = RandomUserViewModel()
    
    var subscription = Set<AnyCancellable>()
    
    @Published var randomUsers = [RandomUser]()
    @Published var info : Info!
    @Published var isLoading : Bool = false
    
    var fetchMoreActionSubject = PassthroughSubject<(),Never>()
    var baseUrl = "https://randomuser.me/api/?results=100"
    
    func fetchMore(){
        guard let currentPage = self.info?.page else{
            return
        }
        self.isLoading = true
        let pageToLoad = currentPage + 1
        
        AF.request(RandomUserRouter.getUsers(page:pageToLoad)).publishDecodable(type: RandomUserResponse.self).compactMap{$0.value}
        .sink(receiveCompletion: {_ in
            print("데이터 스트림 완료")
            self.isLoading = false
        }, receiveValue: {
            print("받은 값 : \($0)")
            self.randomUsers += $0.results
            self.info = $0.info
        }).store(in: &subscription)
        
    }
    
    
    func fetchRandomUsers(){
        AF.request(RandomUserRouter.getUsers()).publishDecodable(type: RandomUserResponse.self).compactMap{$0.value}
        .sink(receiveCompletion: {_ in
            print("데이터 스트림 완료")
        }, receiveValue: {
            print("받은 값 : \($0)")
            self.randomUsers = $0.results
            self.info = $0.info
        }).store(in: &subscription)
    }
}
