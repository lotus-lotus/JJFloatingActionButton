//
//  FirstViewController.swift
//  JJFloatingActionButton
//
//  Created by Jochen on 06.11.17.
//  Copyright © 2017 Jochen Pfeiffer. All rights reserved.
//

import UIKit
import JJFloatingActionButton

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let actionButton = JJFloatingActionButton()

        actionButton.buttonColor = UIColor.red
        actionButton.defaultButtonImage = UIImage(named: "Plus")?.withRenderingMode(.alwaysTemplate)
        actionButton.buttonImageColor = UIColor.white
        actionButton.shadowColor = UIColor.black
        actionButton.shadowOffset = CGSize(width: 0, height: 1)
        actionButton.shadowOpacity = Float(0.5)
        actionButton.shadowRadius = CGFloat(2)
        actionButton.overlayColor = UIColor(white: 0, alpha: 0.5)
        actionButton.itemTitleFont = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        actionButton.itemButtonColor = UIColor.white
        actionButton.itemImageColor = UIColor.red
        actionButton.itemTitleColor = UIColor.white
        actionButton.itemShadowColor = UIColor.black
        actionButton.itemShadowOffset = CGSize(width: 0, height: 1)
        actionButton.itemShadowOpacity = Float(0.4)
        actionButton.itemShadowRadius = CGFloat(2)
        actionButton.itemSizeRatio = CGFloat(0.75)
        actionButton.interItemSpacing = CGFloat(12)
        actionButton.rotationAngle = -CGFloat.pi / 4

        actionButton.addItem(title: "item 1", image: UIImage(named: "First")?.withRenderingMode(.alwaysTemplate)) { item in
            self.showMessage(for: item)
        }

        actionButton.addItem(title: "item 2", image: UIImage(named: "Second")?.withRenderingMode(.alwaysTemplate)) { item in
            self.showMessage(for: item)
        }

        actionButton.addItem(title: "item 3") { item in
            self.showMessage(for: item)
        }

        view.addSubview(actionButton)
        actionButton.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            actionButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -16).isActive = true
            actionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
        } else {
            actionButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16).isActive = true
            actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16).isActive = true
        }
    }
}

fileprivate extension FirstViewController {
    func showMessage(for item: JJActionItem) {
        let alertController = UIAlertController(title: item.title, message: "button tapped!", preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alertController, animated: true, completion: nil)
    }
}