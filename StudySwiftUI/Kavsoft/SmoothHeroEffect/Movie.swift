//
//  Moview.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/31.
//

import Foundation
import SwiftUI
struct Movie:Identifiable{
    let id = UUID().uuidString
    let movieTitle: String
    let artwork: String
    
    static func getDummyList() -> [Movie]{
        return [Movie(movieTitle: "Movie 1", artwork: "bol1"),
                Movie(movieTitle: "Movie 2", artwork: "bol2"),
                Movie(movieTitle: "Movie 3", artwork: "bol3"),
                Movie(movieTitle: "Movie 4", artwork: "bol4"),
                Movie(movieTitle: "Movie 5", artwork: "bol5")]
    }
}
