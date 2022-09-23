//
//  OnboardingViewController.swift
//  dor
//
//  Created by MLaura on 15/09/22.
//
import UIKit

class OnboardingPagingViewController: UIViewController{
    
    let stackView = UIStackView()
    let startButton = UIButton()
    
    let imageView = UIImageView()
    let backgroundImage = UIImageView()
    
    
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    init(imageName: UIImage, titleText: String, subtitleText: String, backgroundImage: UIImage
    ){
        super.init(nibName: nil, bundle: nil)

        imageView.image = imageName
        titleLabel.text = titleText
        subtitleLabel.text = subtitleText
 
     
        self.backgroundImage.image = backgroundImage
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
}
 


extension OnboardingPagingViewController{
    func style(){
    
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 0
     
        
        backgroundImage.translatesAutoresizingMaskIntoConstraints = false
        backgroundImage.contentMode = .scaleAspectFill
            
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        
    
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .left

        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .body)
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
    
            
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.setTitleColor(UIColor(named: "white"), for: .normal)
        startButton.backgroundColor = UIColor(named: "onboardingPurple")
        startButton.setTitle("Bora!", for: .normal)
        startButton.titleLabel?.font = UIFont(name: "Sora-Regular", size: 24)
        startButton.layer.cornerRadius = 16
        
        //MARK: -  AQUI PRA IR PRA HOME Ó
        startButton.addTarget(self, action: #selector(startTapped), for: .touchUpInside)
    
    }
    
    
    func layout(){
        // posicionamento da stack na tela

        view.addSubview(stackView)
        stackView.addSubview(backgroundImage)
        
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(startButton)
    
    
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            imageView.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -178),
            
            
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            
            subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            
            startButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            startButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            startButton.heightAnchor.constraint(equalToConstant: 40),
            startButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
           
        ])
        
        NSLayoutConstraint.activate([backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor), backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor), backgroundImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 152), backgroundImage.heightAnchor.constraint(equalToConstant: 539)])
    
    }
    // MARK: - PARA CLICAR NO BORA E IR PRA HOME
    //botao de bora esta como startButton
    // seria pra abertar e ir pra tela de home
    @objc func startTapped(sender: UIButton){

        let tabBarController = TabBarController()
        let homeNavigation = UINavigationController (rootViewController: HomeViewController())
        let jogosNavigation = UINavigationController (rootViewController: JogosViewController())
        let registrosNavigation = UINavigationController (rootViewController: RegistrosViewController())
        let salvosNavigation = UINavigationController (rootViewController: SalvosViewController())
        tabBarController.viewControllers = [homeNavigation, jogosNavigation, registrosNavigation, salvosNavigation]


        tabBarController.modalPresentationStyle = .fullScreen
//
        self.view.window?.rootViewController = tabBarController
//    //    present(tabBarController, animated: true, completion: nil)
    }
}

