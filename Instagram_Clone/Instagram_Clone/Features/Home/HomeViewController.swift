//
//  HomeViewController.swift
//  Instagram_Clone
//
//  Created by Dang Trung Hieu on 9/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit
import Firebase

class HomeViewController: UIViewController {

    // MARK: - Variables
    
    // MARK: - UI Elements
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuthenticated()
    }
    
    // MARK:- Helper Method
    
    private func handleNotAuthenticated() {
        if Auth.auth().currentUser == nil {
            let vc = SignInViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: false)
        }
        
    }
    
    // MARK: - UI Actions
    
    // MARK: - Public Method
    
    // MARK: - Layouts

}
