//
//  EmAltaCollectionViewCell.swift
//  ChallengeParis
//
//  Created by Mariane Vilarim on 20/09/22.
//

import UIKit

class EmAltaCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "EmAltaCollectionViewCell"
    
    let imagemEmAlta: UIImageView = {
       let image = UIImage (named: "Caldinho")

        return UIImageView(image: image)
    }()

    let descricao: UILabel = {

        let label = UILabel()
        label.font = UIFont.customFont(type: .regular, size: 12)
        label.textColor = .white
        label.text = "testando"

        return label
    }()

    let usuario: UILabel = {

        let label = UILabel()
        label.font = UIFont.customFont(type: .regular, size: 10)
        label.textColor = .white
        label.text = "testinho"

        return label
    }()
    
    let stackViewLabels: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
//        stack.alignment = .top
        stack.spacing = -30
        return stack
    }()
    
    let containerLabels = UIView()
    
    let stackViewImage: UIStackView = {
        
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
       
                
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        stackViewLabels.addArrangedSubview(descricao)
        stackViewLabels.addArrangedSubview(usuario)
        
        containerLabels.addSubview(stackViewLabels)
        
        stackViewImage.addArrangedSubview(containerLabels)
        stackViewImage.addArrangedSubview(imagemEmAlta)
        
        self.addSubview(stackViewImage)
        
//        backgroundColor = .blue
//        self.addSubview(descricao)
//        self.addSubview(usuario)
//        self.addSubview(logo)
        
        setupConstraints()
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 10
        self.backgroundColor = UIColor(named: "roxo")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        
      
        stackViewImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewImage.topAnchor.constraint(equalTo: self.topAnchor),
            stackViewImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackViewImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackViewImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
        ])
        
        stackViewLabels.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackViewLabels.topAnchor.constraint(equalTo: self.containerLabels.topAnchor),
            stackViewLabels.bottomAnchor.constraint(equalTo: self.containerLabels.bottomAnchor, constant: 8),
            stackViewLabels.trailingAnchor.constraint(equalTo: self.containerLabels.trailingAnchor, constant: -8),
            stackViewLabels.leadingAnchor.constraint(equalTo: self.containerLabels.leadingAnchor, constant: 8),
        ])
        
    }
    
    func draw(_ emAlta: EmAlta){
        usuario.text = emAlta.usuario
        descricao.text = emAlta.descricao
        imagemEmAlta.image = UIImage(named: emAlta.imagemEmAlta)
    }
        
        
//        logo.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            logo.topAnchor
//
//
//        ])
        
        
    
    
    
}
