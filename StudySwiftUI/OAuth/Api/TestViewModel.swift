//
//  TestViewModel.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/15.
//

import Foundation
import Combine
import SwiftUI
class TestViewModel: ObservableObject{
    var subscription = Set<AnyCancellable>()
    @Published var isLoading: Bool = false
    init(){
        listenRequestTimeOutError()
    }
    func requsetTimeOutTest(){
        isLoading = true
        TestApi.shared.requestTimeoutTest().sink(receiveCompletion: {_ in
        }, receiveValue: {_ in
            self.isLoading = false
        }).store(in: &subscription)
    }
}

extension TestViewModel{
    func listenRequestTimeOutError(){
        NotificationCenter.default.publisher(for: .requestTimeOut, object: nil).receive(on: DispatchQueue.main).sink(receiveCompletion: {_ in
            
        }, receiveValue: {_ in
            self.isLoading = false
        }).store(in: &subscription)
    }
}
