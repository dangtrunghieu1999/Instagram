//
//  RegistrantionViewController.swift
//  Instagram_Clone
//
//  Created by Dang Trung Hieu on 9/4/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

class RegistrantionViewController: BaseViewController {
    
    
    // MARK: - Varibales
    
    // MARK: - Properties
    
    // MARK: - UI Elements
    
    private let logoTitleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = ImageManager.titleLogo
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = TextManager.username
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        textField.backgroundColor = UIColor(white: 0, alpha: 0.01)
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        textField.placeholder = TextManager.email
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        textField.backgroundColor = UIColor(white: 0, alpha: 0.01)
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.isSecureTextEntry = true
        textField.placeholder = TextManager.password
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        textField.backgroundColor = UIColor(white: 0, alpha: 0.01)
        textField.delegate = self
        textField.addTarget(self, action: #selector(handleTextInputChange), for: .editingChanged)
        return textField
    }()
    

    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(TextManager.signOutButton, for: .normal)
        button.backgroundColor = UIColor.disableColor
        button.layer.masksToBounds = true
        button.setTitleColor(UIColor.white, for: .normal)
        button.isEnabled = false
        button.layer.cornerRadius = 5
        button.titleLabel?.font = UIFont.systemFont(ofSize: FontSize.h1.rawValue)
        button.addTarget(self, action: #selector(tapOnSignUp), for: .touchUpInside)
        return button
    }()
    
    // MARK: - View LifeCycles
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setRightNavigationBar(ImageManager.close)
        endEditingKeyBoard()
        setupNavigationBar()
        layoutLogoTitleImageView()
        layoutUsernameTextField()
        layoutEmailTextField()
        layoutPasswordTextField()
        layoutSignOutButton()
    }
    
    
    // MARK: - Method Helper
    
    override func touchUpInRightBarButtonItem() {
        self.dismiss(animated: true, completion: nil)
    }
    
    private func setupNavigationBar() {
        let navigationBar = navigationController?.navigationBar
        navigationBar?.setBackgroundImage(UIImage(), for: .default)
        navigationBar?.shadowImage = UIImage()
    }
    
    @objc private func handleTextInputChange() {
        let isFormValid = usernameTextField.text?.isEmpty == false
            && passwordTextField.text?.isEmpty == false
            && emailTextField.text?.isEmpty == false
           
        if isFormValid {
            registerButton.isEnabled = true
            registerButton.backgroundColor = UIColor.enableColor
        } else {
            registerButton.isEnabled = false
            registerButton.backgroundColor = UIColor.disableColor
        }
    }
    
    @objc private func handleTapOnView() {
        usernameTextField.resignFirstResponder()
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()        
    }
    
    @objc private func tapOnSignUp() {
        let vc = RegistrantionViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func endEditingKeyBoard() {
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapOnView)))
    }
    
    // MARK: - Public Method
    
    // MARK: - Layout
    
    private func layoutLogoTitleImageView() {
        view.addSubview(logoTitleImageView)
        logoTitleImageView.snp.makeConstraints { (make) in
            if #available(iOS 11, *) {
                make.top.equalTo(view.safeAreaLayoutGuide).offset(Dimension.shared.largeMargin_120)
            } else {
                make.top.equalTo(topLayoutGuide.snp.bottom).offset(Dimension.shared.largeMargin_120)
            }
            make.centerX.equalToSuperview()
            make.width.equalTo(350)
            make.height.equalTo(50)
        }
    }
    
    private func layoutUsernameTextField() {
        view.addSubview(usernameTextField)
        usernameTextField.snp.makeConstraints { (make) in
            make.top.equalTo(logoTitleImageView.snp.bottom).offset(Dimension.shared.largeMargin_32)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin_12)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin_12)
            make.height.equalTo(40)
            
        }
    }
    
    private func layoutEmailTextField() {
        view.addSubview(emailTextField)
        emailTextField.snp.makeConstraints { (make) in
            make.top.equalTo(usernameTextField.snp.bottom).offset(Dimension.shared.mediumMargin)
            make.left.equalToSuperview().offset(Dimension.shared.mediumMargin_12)
            make.right.equalToSuperview().offset(-Dimension.shared.mediumMargin_12)
            make.height.equalTo(40)
            
        }
    }
    
    private func layoutPasswordTextField() {
        view.addSubview(passwordTextField)
        passwordTextField.snp.makeConstraints { (make) in
            make.top.equalTo(emailTextField.snp.bottom).offset(Dimension.shared.mediumMargin)
            make.left.right.equalTo(usernameTextField)
            make.height.equalTo(40)
            
        }
    }
    
    private func layoutSignOutButton() {
        view.addSubview(registerButton)
        registerButton.snp.makeConstraints { (make) in
            make.top.equalTo(passwordTextField.snp.bottom).offset(Dimension.shared.largeMargin)
            make.left.right.equalTo(usernameTextField)
            make.height.equalTo(40)
        }
    }
}


// MARK: - UITextFieldDelegate
extension RegistrantionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

