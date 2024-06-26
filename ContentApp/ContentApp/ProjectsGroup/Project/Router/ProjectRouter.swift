//
//  ProjectRouter.swift
//  ContentApp
//
//  Created by Никита Китаев on 29.03.2024.
//

import UIKit

protocol ProjectRouterProtocol {
    func navigateToMenu()
    func navigateToPostCreation(projectId: Int, onClose: @escaping (() -> Void))
    func navigateToProjects()
    func navigateToPost(projectId: Int, postId: Int, onClose: @escaping (() -> Void))
}

class ProjectRouter: ProjectRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToPostCreation(projectId: Int, onClose: @escaping (() -> Void)) {
        let postVC = NewPostAssembly.build(projectId: projectId, postId: 0)
        postVC.onClose = onClose
        viewController?.present(postVC, animated: true)
    }
    
    func navigateToMenu() {
        let menuVC = MenuAssembly.build()
        viewController?.navigationController?.pushViewController(menuVC, animated: true)
    }
    
    func navigateToProjects() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToPost(projectId: Int, postId: Int, onClose: @escaping (() -> Void)) {
        let postVC = PostAssembly.build(projectId: projectId, postId: postId)
        postVC.onClose = onClose
        viewController?.present(postVC, animated: true)
    }
}
