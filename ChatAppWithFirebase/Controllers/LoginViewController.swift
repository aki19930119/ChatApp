//
//  LoginViewController.swift
//  ChatAppWithFirebase
//
//  Created by 柿沼儀揚 on 2020/04/21.
//  Copyright © 2020 柿沼儀揚. All rights reserved.
//

import UIKit
import Firebase
import PKHUD

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var dontHaveAccountButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.cornerRadius = 8
        //ターゲットオブジェクトとアクションメソッドをコントロールに関連付け
        dontHaveAccountButton.addTarget(self, action: #selector(tappedDontHaveAccountButton), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(tappedLoginButton), for: .touchUpInside)

    }
    //ボタンがタップされたときの処理
    @objc private func tappedDontHaveAccountButton(){
        //1つ前のViewControllerに戻る
        self.navigationController?.popViewController(animated: true)
    }
    //ログイン処理
    @objc private func tappedLoginButton(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        HUD.show(.progress)
        
        Auth.auth().signIn(withEmail: email, password: password){ (res, err) in
            if let err = err {
                print("ログインに失敗しました\(err)")
                HUD.hide()
                return
            }
            HUD.hide()
            print("ログインに成功しました")
            let nav = self.presentingViewController as! UINavigationController
            let chatListViewContrller = nav.viewControllers[nav.viewControllers.count-1] as? ChatListViewController
            chatListViewContrller?.fetchChatroomsInfoFromFirestore()
            self.dismiss(animated: true, completion: nil)
        }
    }
    //ファーストレスポンダーを呼び出し
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
