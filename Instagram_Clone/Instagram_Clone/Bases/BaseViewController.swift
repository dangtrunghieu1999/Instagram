
//
//  BaseViewController.swift
//  Instagram_Clone
//
//  Created by Dang Trung Hieu on 9/5/20.
//  Copyright © 2020 Dang Trung Hieu. All rights reserved.
//

import UIKit

enum BarButtonItemType {
    case left
    case right
}

typealias Target = (target: Any?, selector: Selector)

struct BarButtonItemModel {
    var image: UIImage?
    var title: String?
    var target: Target
    
    init(_ image: UIImage?, _ target: Target) {
        self.image = image
        self.target = target
    }
    
    init(_ image: UIImage? = nil, _ title: String? = nil, _ target: Target) {
        self.image = image
        self.title = title
        self.target = target
    }
}

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUIComponents()
    }
    
    func setupUIComponents() {
        self.addBackButtonIfNeeded()
    }

    func addBackButtonIfNeeded() {
        let target: Target = (target: self, #selector(touchUpInBackButton))
        let barbuttonItemModel = BarButtonItemModel(ImageManager.close, target)
        navigationItem.rightBarButtonItem = buildBarButton(from: barbuttonItemModel)
    }

    func buildBarButton(from itemModel: BarButtonItemModel) -> UIBarButtonItem {
        let target = itemModel.target
        let customButton = UIButton(type: .custom)
        customButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        if itemModel.image != nil {
            let image = itemModel.image?.withRenderingMode(.alwaysTemplate)
            customButton.setImage(image, for: .normal)
            customButton.tintColor = UIColor.black
        } else if itemModel.title != nil {
            customButton.setTitle(itemModel.title!, for: .normal)
            customButton.setTitleColor(UIColor.black, for: .normal)
        }

        customButton.addTarget(target.target, action: target.selector, for: .touchUpInside)
        return UIBarButtonItem(customView: customButton)
    }
    
    @objc func touchUpInBackButton() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func addBarItems(with itemModels: [BarButtonItemModel], type: BarButtonItemType = .right) {
        var barButtonItems: [UIBarButtonItem] = []
        itemModels.forEach {
            barButtonItems.append(buildBarButton(from: $0))
        }
        if type == .right {
            navigationItem.rightBarButtonItems = barButtonItems
        } else {
            navigationItem.leftBarButtonItems = barButtonItems
        }
    }
    
    func setRightNavigationBar(_ image: UIImage? = nil) {
        if image != nil {
            let rightBarItemTarget: Target = (target: self, selector: #selector(touchUpInRightBarButtonItem))
            let rightBarButtonModel = BarButtonItemModel(image, rightBarItemTarget)
            addBarItems(with: [rightBarButtonModel], type: .right)
        }
    }
    
     @objc func touchUpInRightBarButtonItem() {}

}
