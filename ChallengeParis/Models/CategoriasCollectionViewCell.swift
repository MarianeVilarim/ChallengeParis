//
//  CategoriasCollectionViewCell.swift
//  ChallengeParis
//
//  Created by Mariane Vilarim on 19/09/22.
//

import UIKit
//Classe criada para alterar as configurações das celulas da collection view cell categorias
class CategoriasCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CategoriasCollectionViewCell"
    
    //let logo criada para receber a UIImageView
    //let image recebe a UIImage "Praia"que está sendo citada na array(lista) da var categorias que está na ViewController
    //Ela retorna a UIImageView da let image
    let logo: UIImageView = {
        let image = UIImage (named: "Praia")
        return UIImageView(image: image)
    }()
    //A let descrição é da celula da collection
    let descricao: UILabel = {
        
       let label = UILabel ()
        label.font = UIFont.customFont(type: .bold, size: 14)
        label.textColor = .white
        label.text = "testinho"
        return label
    }()
    //inicializador para a collection
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(logo)
        self.addSubview(descricao)
        self.backgroundColor = UIColor(named: "roxo")
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 8
        setupConstraints()
    }
    
    
    //Eu não lembro, preciso perguntar a alex
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //constrains da imagem que está dentro da celula da collection
    func setupConstraints(){
        logo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logo.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            logo.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            logo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant:  -12),
            logo.widthAnchor.constraint(equalToConstant: 40)
        ])
    //constrains da descrição que está dentro da celula da collection
        descricao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descricao.leadingAnchor.constraint(equalTo: logo.trailingAnchor, constant:  8),
            descricao.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            descricao.heightAnchor.constraint(equalToConstant: 32),
            descricao.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    //função que desenha a imagem e a descricao dentro da collection
    func draw(_ categoria: Categoria){
        descricao.text = categoria.descricao
        logo.image = UIImage(named: categoria.image)
    }
    
    
    func didSelect(indexPath: NSIndexPath ) {
        // perform some actions here
      }
}
