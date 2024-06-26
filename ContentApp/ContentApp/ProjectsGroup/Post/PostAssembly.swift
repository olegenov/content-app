//
//  PostAssembly.swift
//  ContentApp
//
//  Created by Никита Китаев on 31.03.2024.
//

import UIKit

enum PostAssembly {
    static func build(projectId: Int, postId: Int) -> BaseViewController {
        let presenter = PostPresenter()
        let interactor = PostInteractor(presenter: presenter, apiService: APIService())
        let viewController = PostViewController(interactor: interactor, projectId: projectId, postId: postId)

        viewController.router = PostRouter(viewController: viewController)
        
        presenter.viewController = viewController
        
        return viewController
    }
}

enum NewPostAssembly {
    static func build(projectId: Int, postId: Int) -> BaseViewController {
        let presenter = PostPresenter()
        let interactor = PostInteractor(presenter: presenter, apiService: APIService())
        let viewController = NewPostViewController(interactor: interactor, projectId: projectId, postId: postId)

        viewController.router = PostRouter(viewController: viewController)
        
        presenter.viewController = viewController
        
        return viewController
    }
}
