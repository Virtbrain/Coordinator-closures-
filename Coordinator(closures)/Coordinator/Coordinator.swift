//
//  Coordinator.swift
//  Coordinator(closures)
//
//  Created by Alexey Manankov on 31.08.2023.
//

import UIKit

protocol UpdatableWithUser: AnyObject {
    var user: User? {get set}
}

final class Coordinator {
    
    //MARK: - Properties
    private var user: User {didSet { updateInterfaces() }}
    private weak var navigationController: UINavigationController?
    
    //MARK: - Init
    init(user: User, navigationController: UINavigationController) {
        self.user = user
        self.navigationController = navigationController
    }
    
    func start() {
        showMainScreen()
    }
    
    //MARK: - Private implementation
    private func showMainScreen() {
        let controller = ViewController()
        controller.user = user
        controller.onSelectCity = {[weak self] in
            self?.showCitiesScreen()
        }
        navigationController?.pushViewController(controller, animated: false)
    }
    
    private func showCitiesScreen() {
        let controller = CitiesViewController()
        controller.onCitySelected = { [weak self] city in
            self?.user.city = city
            _ = self?.navigationController?.popViewController(animated: true)
        }
        navigationController?.pushViewController(controller, animated: true)
    }
    
    private func updateInterfaces() {
        navigationController?.viewControllers.forEach {
            ($0 as? UpdatableWithUser)?.user = user
        }
    }
}
