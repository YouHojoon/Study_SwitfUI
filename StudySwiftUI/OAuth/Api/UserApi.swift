import Alamofire
import Foundation
import Combine

final class UserApi: BaseApi{
    static let shared = UserApi()
    
    func fetchCurrentUserInfo() -> AnyPublisher<UserData, AFError>{
        let credential = OAuthCredential(accessToken: UserDefaultsManager.shared.getToken(key: .accessToken) ?? "", refreshToken: UserDefaultsManager.shared.getToken(key: .refreshToken) ?? "", expiration: Date(timeIntervalSinceNow: 30))
        let authenticator = OAuthAuthenticator()
        let interceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential)
        
        return session.request(UserRouter.fetchCurrentUserInfo,interceptor: interceptor).publishDecodable(type:UserInfoResponse.self).value()
            .map{$0.user}.eraseToAnyPublisher()
    }
    
    func fetchUsers() -> AnyPublisher<[UserData], AFError>{
        print("?")
        let credential = OAuthCredential(accessToken: UserDefaultsManager.shared.getToken(key: .accessToken) ?? "", refreshToken: UserDefaultsManager.shared.getToken(key: .refreshToken) ?? "", expiration: Date(timeIntervalSinceNow: 30))
        let authenticator = OAuthAuthenticator()
        let interceptor = AuthenticationInterceptor(authenticator: authenticator, credential: credential) 
        
        return session.request(UserRouter.fetchUsers,interceptor: interceptor).publishDecodable(type:UserListResponse.self).value()
            .map{$0.data}.eraseToAnyPublisher()
    }
    
}
