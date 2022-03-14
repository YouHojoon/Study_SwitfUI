//
//  MyTextAlertView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/10.
//

import Foundation
import UIKit
import SwiftUI

struct MyTextAlertView: UIViewControllerRepresentable{
    func makeUIViewController(context: Context) -> UIViewController {
        return UIViewController()
    }
    
    typealias UIViewControllerType = UIViewController
    
    var title: String
    var message: String?
    
    @EnvironmentObject var viewModel: WebViewModel
    @Binding var textString : String
    @Binding var showAlert : Bool
    
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<MyTextAlertView>) {
        guard context.coordinator.alert == nil else {return}
        
        
        if self.showAlert {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alert.addTextField{
                $0.placeholder = "전달할 값을 입력하세요."
                $0.text = self.textString
            }
            alert.addAction(UIAlertAction(title: "취소", style: .destructive){_ in
                self.textString = ""
            })
            alert.addAction(UIAlertAction(title: "보내기", style: .default){_ in
                if let textField = alert.textFields?.first, let inputText = textField.text{
                    self.textString = inputText
                    self.viewModel.nativeToJsEvent.send(inputText)
                }
                
                alert.dismiss(animated: true){
//                    self.textString = ""
                    self.showAlert = false
                }
            })
            
            DispatchQueue.main.async {
                uiViewController.present(alert, animated: true){
                    self.showAlert = false
                    context.coordinator.alert = nil
                }
            }
        }
        
        
    }
    
    
    func makeCoordinator() -> MyTextAlertView.Coordinator {
        MyTextAlertView.Coordinator(self)
    }
    
    //매개체
    class Coordinator : NSObject{
        var alert: UIAlertController?
        var myTextAlertView: MyTextAlertView
        
        init(_ myTextAlertView: MyTextAlertView){
            self.myTextAlertView = myTextAlertView
        }
    }
}

//SwiftUI에서 delgate받기 위함
extension MyTextAlertView.Coordinator : UITextFieldDelegate{
    //글자 입력 시
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text as NSString? {
            self.myTextAlertView.textString = text.replacingCharacters(in: range, with: string)
        }
        else{
            self.myTextAlertView.textString = ""
        }
        
        return true
    }
}
