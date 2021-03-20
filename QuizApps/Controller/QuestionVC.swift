//
//  QuestionVC.swift
//  QuizApps
//
//  Created by Nguyễn Hữu Khánh on 19/03/2021.
//

import UIKit

class QuestionVC: UIViewController {
    
    // Declare logic
    var quizBrain = QuizBrain()
    var score = 0
    
    //MARK:-  DECLARE UI
    
    let container = UIView()
    let topBg = UIImageView()
    let topContainer = UIView()
    
    let progressView = UIProgressView()
    
    let imageContainer = UIStackView()
    let imageView = UIImageView()
    
    let questionText = UILabel()
    
    let buttonContainer = UIStackView()
    let buttonAswer1 = UIButton()
    let buttonAswer2 = UIButton()
    let buttonAswer3 = UIButton()
    let buttonAswer4 = UIButton()
    var arrayButton = [UIButton]()


    //MARK:- Load View
    override func loadView() {
        super.loadView()
        view.backgroundColor = .backgroundColor
        
        // configure UI
        arrayButton = [buttonAswer1, buttonAswer2, buttonAswer3, buttonAswer4]
        configureUI()
        updateUI()
        
        // Even
        buttonAswer1.addTarget(self, action: #selector(toResults(_:)), for: .touchUpInside)
        buttonAswer2.addTarget(self, action: #selector(toResults(_:)), for: .touchUpInside)
        buttonAswer3.addTarget(self, action: #selector(toResults(_:)), for: .touchUpInside)
        buttonAswer4.addTarget(self, action: #selector(toResults(_:)), for: .touchUpInside)
    }
    
    //MARK:-EVENT
    @objc func toResults(_ sender: UIButton) {
        
        let userAnser = sender.currentTitle!
        
        let userGotItRight = quizBrain.checkAnswer(userAnswer: userAnser)
        
        if userGotItRight {
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.lightGreenColor.cgColor
            sender.setTitleColor(.lightGreenColor, for: .highlighted)
            sender.setTitleColor(.lightGreenColor, for: .normal)
        } else {
            sender.layer.borderWidth = 2
            sender.layer.borderColor = UIColor.red.cgColor
            sender.setTitleColor(.red, for: .highlighted)
            sender.setTitleColor(.red, for: .normal)
        }
        quizBrain.nextQuestion()
        
        
        Timer.scheduledTimer(timeInterval: 0.3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        let done = quizBrain.getDone()
        if done {
            score = quizBrain.getScore()
            let resultVC = ResultsVC()
            resultVC.receiveData = "\(score)"
            navigationController?.pushViewController(resultVC, animated: true)
        }
    }
    
    @objc func updateUI() {
        questionText.text = quizBrain.getQuestionText()
        imageView.image = UIImage(named: quizBrain.getPhoto())
        
        let answerChoices = quizBrain.getAnswer()
        buttonAswer1.setTitle(answerChoices[0], for: .normal)
        buttonAswer2.setTitle(answerChoices[1], for: .normal)
        buttonAswer3.setTitle(answerChoices[2], for: .normal)
        buttonAswer4.setTitle(answerChoices[3], for: .normal)
        
        progressView.progress = quizBrain.getProgress()
        
        score = quizBrain.getScore()
        
        arrayButton.forEach {
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightBlueColor.cgColor
            $0.setTitleColor(.lightBlueColor, for: .highlighted)
            $0.setTitleColor(.white, for: .normal)
        }
        
    }
    
    
    //MARK:- User Interface
    func configureUI() {
        
        //===========================================================================
        // TURN ON AUTO LAYOUT
        //===========================================================================
        
        // Add Subviews
        ([topBg, container, progressView, imageContainer, questionText, buttonContainer]).forEach {
            view.addSubview($0)
        }
        imageContainer.addArrangedSubview(imageView)
//        let arrayButton = [buttonAswer1, buttonAswer2, buttonAswer3, buttonAswer4]
        arrayButton.forEach{
            buttonContainer.addArrangedSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }

        // turn of autoresizing
        ([topBg, container, progressView, imageContainer, imageView, questionText, buttonContainer]).forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        //===========================================================================
        // CONSTRAINTS AND CONFIGURE UI
        //===========================================================================
        
        /*---------------------------------
        background */
        topBg.image = UIImage(named: "confettiBackground")
        topBg.contentMode = .scaleToFill
        topBg.layer.opacity = 0.2
        NSLayoutConstraint.activate([
            topBg.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topBg.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            topBg.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 1.2),
            topBg.heightAnchor.constraint(equalTo: topBg.widthAnchor, multiplier: 6/7)
        ])
        
        /*---------------------------------
        container */
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            container.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            container.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            container.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
        ])
        
        /*---------------------------------
        progressView */
        progressView.progressViewStyle = .bar
        progressView.setProgress(0.5, animated: true)
        progressView.progressTintColor = .lightGreenColor
        progressView.trackTintColor = .lightGray
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: container.topAnchor),
            progressView.leadingAnchor.constraint(equalTo: container.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: container.trailingAnchor),
        ])
        
        /*---------------------------------
        image container and image */
        imageContainer.layer.cornerRadius = 20
        imageContainer.clipsToBounds = true
        imageContainer.layer.borderWidth = 1
        imageContainer.layer.borderColor = UIColor.lightBlueColor.cgColor
        NSLayoutConstraint.activate([
            imageContainer.topAnchor.constraint(equalTo: progressView.bottomAnchor, constant: 20),
            imageContainer.leadingAnchor.constraint(equalTo: progressView.leadingAnchor),
            imageContainer.trailingAnchor.constraint(equalTo: progressView.trailingAnchor),
        ])
        
        let imgHeight = imageView.heightAnchor.constraint(equalToConstant: 200)
        imgHeight.priority = UILayoutPriority.defaultLow
        imgHeight.isActive = true
        
        imageView.image = #imageLiteral(resourceName: "puppy2")
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .whiteTransparency
        
        /*---------------------------------
        question text */
        questionText.text = "If alternatively, you would be willing to avoid wrapping the UILabel with a UIView, you could use UITextView to enable the use of UIEdgeInsets (padding) or subclass UILabel to support UIEdgeInsets.If alternatively, you would be willing to avoid wrapping the UILabel with a UIView"
        questionText.textColor = .white
        questionText.font = UIFont(name: "Roboto-black", size: 24)
        questionText.textAlignment = .center
        questionText.numberOfLines = 0
        NSLayoutConstraint.activate([
            questionText.topAnchor.constraint(equalTo: imageContainer.bottomAnchor, constant: 20),
            questionText.leadingAnchor.constraint(equalTo: imageContainer.leadingAnchor),
            questionText.trailingAnchor.constraint(equalTo: imageContainer.trailingAnchor),
        ])
        
        /*---------------------------------
        button answer */
        
        buttonContainer.axis = .vertical
        buttonContainer.alignment = .fill
        buttonContainer.distribution = .fillEqually
        buttonContainer.spacing = 10
        NSLayoutConstraint.activate([
            buttonContainer.topAnchor.constraint(equalTo: questionText.bottomAnchor, constant: 20),
            buttonContainer.leadingAnchor.constraint(equalTo: questionText.leadingAnchor),
            buttonContainer.trailingAnchor.constraint(equalTo: questionText.trailingAnchor),
            buttonContainer.bottomAnchor.constraint(equalTo: container.bottomAnchor),
            buttonContainer.heightAnchor.constraint(greaterThanOrEqualToConstant: 300)
        ])
        
        
        arrayButton.forEach{
            $0.layer.cornerRadius = 10
            $0.layer.borderWidth = 1
            $0.layer.borderColor = UIColor.lightBlueColor.cgColor
            $0.backgroundColor = .whiteTransparency
            $0.setTitleColor( .white, for: .normal)
            $0.titleLabel?.font = UIFont(name: "Roboto-thin", size: 20)
            $0.titleLabel?.lineBreakMode = .byWordWrapping
            $0.titleLabel?.textAlignment = .center
            $0.contentEdgeInsets = UIEdgeInsets(top: CGFloat(10), left: CGFloat(10), bottom: CGFloat(10), right: CGFloat(10))
        }

        buttonAswer1.setTitle("yes", for: .normal)
        buttonAswer2.setTitle("Lorem ", for: .normal)
        buttonAswer3.setTitle("Lorem Ipsum is simply dummy textLorem Ipsum is simply dummy text", for: .normal)
        buttonAswer4.setTitle("Khi đọc ", for: .normal)
        
        
    }
}
