//
//  ViewController.swift
//  QuizApps
//
//  Created by Nguyễn Hữu Khánh on 19/03/2021.
//

import UIKit

class HomeVC: UIViewController {
    
    // Declare UI
    let container = UIStackView()
    let quizGraphic = UIImageView()
    let startButton = UIButton()

    override func loadView() {
        super.loadView()
        view.backgroundColor = .backgroundColor
        
        // Hide nav bar
        navigationController?.isNavigationBarHidden = true
        
        // setup UI
        configureUI()
        
        //Event
        startButton.addTarget(self, action: #selector(toQuestionVC(_:)), for: .touchUpInside)
        
    }
//MARK:- EVENT
    @objc func toQuestionVC(_ sender: UIButton){
        let questionVC = QuestionVC()
        navigationController?.pushViewController(questionVC, animated: false)
    }
    
    
//MARK:- User Interface
    func configureUI() {
        // Add Subviews
        view.addSubview(container)
        ([quizGraphic, startButton]).forEach{ container.addArrangedSubview($0)}
        
        // Turn off Autoresizing
        ([container, quizGraphic, startButton]).forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}
        
        // Container
        container.axis = .vertical
        container.alignment = .fill
        container.distribution = .fillProportionally
        container.spacing = 10
        
        NSLayoutConstraint.activate([
            container.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            container.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
        ])
        
        // Graphic
        quizGraphic.image = UIImage(named: "quizzGraphic")
        quizGraphic.contentMode = .scaleAspectFit
        
        NSLayoutConstraint.activate([
            quizGraphic.widthAnchor.constraint(equalToConstant: 300),
            quizGraphic.heightAnchor.constraint(equalTo: quizGraphic.widthAnchor, multiplier: 244/288),
        ])
        
        // Button
        startButton.setTitle("START", for: .normal)
        startButton.setTitleColor(.white, for: .normal)
        startButton.setTitleColor(.darkGray, for: .highlighted)
        startButton.titleLabel?.font = UIFont(name: "Roboto-bold", size: 20)
        startButton.backgroundColor = .lightBlueColor
        startButton.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
}

