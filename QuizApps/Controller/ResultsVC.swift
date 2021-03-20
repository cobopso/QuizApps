//
//  ResultsVC.swift
//  QuizApps
//
//  Created by Nguyễn Hữu Khánh on 19/03/2021.
//

import UIKit

class ResultsVC: UIViewController {
    
    // receive score from quiz
    var receiveData = ""
    
    // Declare UI
    let container = UIView()
    let imageView = UIImageView()
    let score = UILabel()
    let scoreLabel = UILabel()
    let advise = UILabel()
    let playAgain = UIButton()

    override func loadView() {
        super.loadView()
        
        view.backgroundColor = .backgroundColor
        
        // configure UI
        configureUI()
        
        //connect score
        updateUI()
        
//        if let score = Int(receiveData) {
//            getAdvise(score: score)
//        }
        
        // Even
        playAgain.addTarget(self, action: #selector(backToRoot), for: .touchUpInside)
        
    }
    
    
    
    //MARK:- update UI
    
    func updateUI() {
        score.text = receiveData
        let scoreValue = Int(receiveData) ?? 0
        let status = getStatus(scoreValue)
        getAdvise(status)
    }
    
    typealias MethodHandle = (_ statusValue: Advise) -> Advise
    
    func getStatus(_ scoreValue: Int) -> Advise {
        switch scoreValue {
        case 0...4:
            return Advise.low
        case 5...7:
            return Advise.normal
        default:
            return Advise.good
        }
    }
    
    func getAdvise(_ status: Advise) {
        if status == Advise.low {
            advise.text = "Về nhà học lại điiii"
            advise.textColor = .red
            imageView.image = UIImage(named: "sadDog")
        } else if status == .normal {
            advise.text = "Cố gắng thêm chút nữa!!!"
            advise.textColor = .lightGray
            imageView.image = UIImage(named: "hardworkDog")
            score.textColor = .lightBlueColor
        } else {
            advise.text = "Khá tốt, thử lại vài lần cho chắc ăn!"
            advise.textColor = .lightBlueColor
            imageView.image = UIImage(named: "smileDog")
            score.textColor = .lightGreenColor
        }
    }
    
//    func getAdvise(scoreValue: Int, status: MethodHandle) {
//        if status(scoreValue) == Advise.low {
//            advise.text = "Về nhà học lại điiii"
//            advise.textColor = .red
//        } else if status(scoreValue) == .normal {
//            advise.text = "Cố gắng thêm chút nữa!!!"
//            advise.textColor = .lightGray
//        } else {
//            advise.text = "Khá tốt, thử lại vài lần cho chắc ăn!"
//            advise.textColor = .lightBlueColor
//        }
//    }
    
    @objc func backToRoot() {
        navigationController?.popToRootViewController(animated: false)
    }
    
    //MARK:- ConfigureUI
    func configureUI() {
        
        // Turn on AutoLayout
        view.addSubview(container)
        ([imageView, score, scoreLabel, advise, playAgain]).forEach { container.addSubview($0) }
        
        ([container, imageView, score, scoreLabel, advise, playAgain]).forEach{ $0.translatesAutoresizingMaskIntoConstraints = false}
        
        // Setup and Constraints
        
        /*---------------------------------
        container */
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
        
        /*---------------------------------
        score*/
        score.text = "08"
        score.font = UIFont(name: "Roboto-Bold", size: 120)
        score.textColor = .lightGray
        score.textAlignment = .center
        NSLayoutConstraint.activate([
            score.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            score.centerYAnchor.constraint(equalTo: container.centerYAnchor),
        ])
        
        scoreLabel.text = "điểm"
        scoreLabel.font = UIFont(name: "Roboto-Thin", size: 24)
        scoreLabel.textColor = .lightGray
        NSLayoutConstraint.activate([
            scoreLabel.centerYAnchor.constraint(equalTo: score.centerYAnchor),
            scoreLabel.leadingAnchor.constraint(equalTo: score.trailingAnchor, constant: 10),
        ])
        
        /*---------------------------------
        image view */
        imageView.image = UIImage(named: "smileDog")
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: container.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: score.topAnchor, constant: -20),
        ])
        
        /*---------------------------------
        advise */
        advise.text = "default"
        advise.font = UIFont(name: "Roboto-Thin", size: 30)
        advise.textColor = .lightGray
        advise.textAlignment = .center
        advise.numberOfLines = 0
        NSLayoutConstraint.activate([
            advise.topAnchor.constraint(equalTo: score.bottomAnchor, constant: 20),
            advise.leadingAnchor.constraint(equalTo: container.leadingAnchor, constant: 20),
            advise.trailingAnchor.constraint(equalTo: container.trailingAnchor, constant: -20),
        ])
        
        /*---------------------------------
        button */
        playAgain.setTitle("PLAY AGAIN", for: .normal)
        playAgain.backgroundColor = .lightBlueColor
        playAgain.setTitleColor(.white, for: .normal)
        playAgain.setTitleColor(.darkGray, for: .highlighted)
        playAgain.layer.cornerRadius = 10
        
        NSLayoutConstraint.activate([
            playAgain.widthAnchor.constraint(equalToConstant: 200),
            playAgain.heightAnchor.constraint(equalToConstant: 50),
            playAgain.topAnchor.constraint(equalTo: advise.bottomAnchor, constant: 20),
            playAgain.centerXAnchor.constraint(equalTo: advise.centerXAnchor),
        ])
        
    }
}
