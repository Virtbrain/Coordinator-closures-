//
//  ViewController.swift
//  Coordinator(closures)
//
//  Created by Alexey Manankov on 31.08.2023.
//

import UIKit

final class ViewController: UIViewController {
    
    //MARK: - Input -
    var user: User? {didSet { updateView() }}
    
    //MARK: - Output -
    var onSelectCity: (() -> Void)?
    
    var userLabel = UILabel()
    var selectCityButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        userLabel.font = UIFont.systemFont(ofSize: 25)
        userLabel.textColor = .black
        
        selectCityButton.backgroundColor = .orange
        selectCityButton.setTitleColor(.black, for: .normal)
        selectCityButton.setTitleColor(UIColor(white: 1, alpha: 0.3), for: .highlighted)
        selectCityButton.layer.cornerRadius = 10
        
        [userLabel, selectCityButton].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        NSLayoutConstraint.activate([
            userLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            userLabel.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
            userLabel.heightAnchor.constraint(equalToConstant: 50),
            
            selectCityButton.topAnchor.constraint(equalTo: userLabel.bottomAnchor, constant: 50),
            selectCityButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            selectCityButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
            selectCityButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        selectCityButton.addTarget(self, action: #selector(didSelectCityTap), for: .touchUpInside)
        
    }

    private func updateView() {
        userLabel.text = "User: \(user?.name ?? ""), \n"
                        + "City: \(user?.city?.name ?? "")"
    }
    
    @objc private func didSelectCityTap() {
        onSelectCity?()
    }

}

