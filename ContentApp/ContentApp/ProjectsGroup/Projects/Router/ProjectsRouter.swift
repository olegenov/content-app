//
//  ProjectsRouter.swift
//  ContentApp
//
//  Created by Никита Китаев on 13.03.2024.
//

import UIKit

protocol ProjectsRouterProtocol {
    func navigateToMenu()
    func navigateToProjectCreation()
    func navigateToProfile()
    func navigateToProject(id: Int)
}

class ProjectsRouter: ProjectsRouterProtocol {
    weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func navigateToProjectCreation() {
        let newProjectVC = NewProjectAssembly.build()
        viewController?.navigationController?.pushViewController(newProjectVC, animated: true)
    }
    
    func navigateToMenu() {
        viewController?.navigationController?.popViewController(animated: true)
    }
    
    func navigateToProfile() {
        let profileVC = ProfileAssembly.build()
        viewController?.navigationController?.pushViewController(profileVC, animated: true)
    }
    
    func navigateToProject(id: Int) {
        let projectVC = ProjectAssembly.build(projectId: id)
        viewController?.navigationController?.pushViewController(projectVC, animated: true)
    }
}
