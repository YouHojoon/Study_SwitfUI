//
//  MyWebView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/24.
//

import Foundation
import SwiftUI
import WebKit
import Combine
//UIKit UIView사용
struct MyWebView: UIViewRepresentable {
    
    @EnvironmentObject var viewModel: WebViewModel
    
    var urlToLoad : String
    //UIView 만들기
    func makeUIView(context: Context) -> WKWebView {
        guard let url = URL(string: urlToLoad) else{
            return WKWebView()
        }
        
        let webView = WKWebView(frame: .zero, configuration: self.createWKWebConfig())
        webView.uiDelegate = context.coordinator as! WKUIDelegate
        webView.navigationDelegate = context.coordinator as! WKNavigationDelegate
        webView.allowsBackForwardNavigationGestures = true
        webView.load(URLRequest(url:url))
        
        return webView
    }
    //업데이트 UI View
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<MyWebView>) {
        
    }
    typealias UIViewType = WKWebView
    
    func makeCoordinator() -> Coordinator {
        return MyWebView.Coordinator(self)
    }
    func createWKWebConfig() -> WKWebViewConfiguration{
        //웹 뷰 설정
        let preferences = WKPreferences()
        preferences.javaScriptCanOpenWindowsAutomatically = true
        let wkWebConfig = WKWebViewConfiguration()
        
        let userContentController = WKUserContentController()
        userContentController.add(self.makeCoordinator(), name: "callbackHandler")
        wkWebConfig.userContentController = userContentController
        wkWebConfig.preferences = preferences
        wkWebConfig.defaultWebpagePreferences.allowsContentJavaScript = true
        return wkWebConfig
    }
    
    class Coordinator: NSObject{
        var myWebView: MyWebView
        var subscriptions = Set<AnyCancellable>()
        
        init(_ myWebView: MyWebView){
            self.myWebView = myWebView
        }
    }
}

extension MyWebView.Coordinator: WKUIDelegate{
    func webView(_ webView: WKWebView, runJavaScriptAlertPanelWithMessage message: String, initiatedByFrame frame: WKFrameInfo, completionHandler: @escaping () -> Void) {
        self.myWebView.viewModel.jsAlertEvent.send(JsAlert(message, .JS_ALERT))
        completionHandler()
    }
}

//링크 이동 관련
extension MyWebView.Coordinator: WKNavigationDelegate{
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        myWebView.viewModel.shouldShowIndicator.send(true)
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        myWebView.viewModel.shouldShowIndicator.send(true)
        myWebView.viewModel.webNavigationSubject.sink{
            switch $0{
            case .BACK:
                if webView.canGoBack{
                    webView.goBack()
                }
            case .FORWARD:
                if webView.canGoForward{
                    webView.goForward()
                }
            case .REFRESH:
                webView.reload()
            }
        }.store(in: &self.subscriptions)
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        myWebView.viewModel.shouldShowIndicator.send(false)
        myWebView.viewModel.changedUrlSubject.compactMap{$0.url}.sink{
            print("변경된 url : \($0)")
            webView.load(URLRequest(url: $0))
        }.store(in: &self.subscriptions)
        
        myWebView.viewModel.nativeToJsEvent.sink{
            print("js envent message : \($0)")
            webView.evaluateJavaScript("nativeToJsEventCall('\($0)')", completionHandler: {
                if let _ = $1{
                    print($1?.localizedDescription)
                }
                
                if let _ = $0{
                    print("성공")
                }
            })
        }.store(in: &self.subscriptions)
        
        webView.evaluateJavaScript("document.title"){
            if let error = $1{
                print("타이틀 에러때문에 못가져옴")
            }
            if let title = $0 as? String{
                self.myWebView.viewModel.webSiteTitleSubject.send(title)
            }
        }
    }
    
    func webViewWebContentProcessDidTerminate(_ webView: WKWebView) {
        myWebView.viewModel.shouldShowIndicator.send(false)
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        myWebView.viewModel.shouldShowIndicator.send(false)
    }
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        myWebView.viewModel.shouldShowIndicator.send(false)
    }
}

//script 관련
extension MyWebView.Coordinator: WKScriptMessageHandler{
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        print("message : \(message)")
        if message.name == "callbackHandler"{
            print("\(message.body)")
            if let receivedData : [String: String] = message.body as? Dictionary{
                print("receivedData: \(receivedData)")
                myWebView.viewModel.jsAlertEvent.send(JsAlert(receivedData["message"],.JS_BRIDGE))
            }
        }
    }
    
    
}
struct MyWebView_Previews: PreviewProvider{
    static var previews: some View{
        MyWebView(urlToLoad: "https://www.naver.com")
    }
}
