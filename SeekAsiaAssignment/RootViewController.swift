//
//  RootViewController.swift
//  SeekAsiaAssignment
//
//  Created by Chuen Wai Liew on 24/04/2023.
//

import Foundation
import UIKit

enum MainViewControllerType {
    case landing
    case tabbar
}

class RootViewController: UIViewController {
    static let share = RootViewController()
    
    var tabbarVC: UITabBarController? = nil
    var currentShowViewController: UIViewController? = nil
    
    func show(childViewController type: MainViewControllerType) {
        switch type {
        case .landing:
//            if currentShowViewController == nil {
//
//            }
            break
        case .tabbar:
            break
        }
    }
}
