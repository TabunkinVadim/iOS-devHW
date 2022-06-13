//
//  LoginInspector.swift
//  Vk
//
//  Created by Табункин Вадим on 07.06.2022.
//

import Foundation
class LoginInspector: LoginViewControllerDelegate {

    func chek(login: String, pswd: String) -> Bool {
        return Checker.shared.chek(verifiableLogin: login, verifiablePassword: pswd)
    }
}

    //        weak var delegate: LoginViewControllerDelegate?

//    private var loginChek: String = ""
//    private var passwordChek: String = ""
//    var log = ""
//    var psw = ""
//    let cheker = Checker()
//    var bool = false
    //    init(login: String, password: String) {
    //        loginChek = login
    //        passwordChek = password
    //        cheker.delegate = self
    //        cheker.chek()
    //    }

//    func setData(loginSet: String, passwordSet: String) {
//        loginChek = loginSet
//        passwordChek = passwordSet
//    }


//
//extension LoginInspector:LoginViewControllerDelegate{
//    func chek(login: String, pswd: String) -> Bool {
//        if login == loginChek && pswd == passwordChek{
//            return true
//        } else {
//            return false
//        }
//    }
//}
