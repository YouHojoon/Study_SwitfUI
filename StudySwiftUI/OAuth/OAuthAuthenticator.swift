//
//  OAuthAuthenticator.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire
import Combine

class OAuthAuthenticator: Authenticator{
    func isRequest(_ urlRequest: URLRequest, authenticatedWith credential: OAuthCredential) -> Bool {
        return true
    }
    
    
    func apply(_ credential: OAuthCredential, to urlRequest: inout URLRequest) {
        urlRequest.headers.add(.authorization(bearerToken: credential.accessToken))
    }
    
    func refresh(_ credential: OAuthCredential, for session: Session, completion: @escaping (Result<OAuthCredential, Error>) -> Void) {
        session.request(OAuthRouter.tokenRefresh).responseDecodable(of: TokenReponse.self){
            switch $0.result{
            case .success(let value):
                UserDefaultsManager.shared.setTokens(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken)
                let expiration = Date(timeIntervalSinceNow: TimeInterval(60 * 60))
                let newCrendential = OAuthCredential(accessToken: value.token.accessToken, refreshToken: value.token.refreshToken, expiration: expiration)
                completion(.success(newCrendential))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    //access token 관련 처리
    func didRequest(_ urlRequest: URLRequest, with response: HTTPURLResponse, failDueToAuthenticationError error: Error) -> Bool {
        switch response.statusCode{
        case 401:
            return true
        default:
            return false
        }
    }
}
