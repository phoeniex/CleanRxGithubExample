//
// Created by Arnon Keereena on 23/12/2018 AD.
// Copyright (c) 2018 Arnon Keereena. All rights reserved.
//

import Foundation
import GithubDomain

protocol LoginNavigator {
  func toHome()
}

class DefaultLoginNavigator: LoginNavigator {
  private let storyboard: UIStoryboard
  private let sourceViewController: UIViewController
  private let provider: UseCaseProvider
  
  init(provider: UseCaseProvider,
       sourceViewController: UIViewController,
       storyboard: UIStoryboard) {
    self.provider = provider
    self.sourceViewController = sourceViewController
    self.storyboard = storyboard
  }
  
  func toHome() {
    let viewController = storyboard.instantiateViewController(ofType: HomeTabsController.self)
//    let useCase = ??
//    let navigator = ??
//    viewController.viewModel = HomeViewController.ViewModel(useCase: useCase, navigator: navigator)
    if let navController = sourceViewController.navigationController {
//      navController.viewControllers = [viewController]
      sourceViewController.present(viewController, animated: true)
    } else {
      sourceViewController.present(viewController, animated: true)
      sourceViewController.removeFromParent()
    }
  }
}