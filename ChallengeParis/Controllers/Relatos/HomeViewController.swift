//
//  ViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 12/09/22.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()
    var userInput: String = ""
    //array que lista todos os itens que existe na collection view categorias, os itens são as imagens que são puxadas dos assets como string e o nome das categorias que também são strings, porém é inserida manualmente.
    var categorias: [Categoria] = [
        Categoria(image: "Bar", descricao: "Restaurante"),
        Categoria(image: "Praia", descricao: "Praia"),
        Categoria(image: "Bar", descricao: "Bar"),
        Categoria(image: "Parque", descricao: "Parque"),
        Categoria(image: "Cultural", descricao: "Cultural"),
        Categoria(image: "Casa", descricao: "Casa")
    ]
    
    var emAlta: [EmAlta] = [
        EmAlta(usuario: "Juca Juliano", descricao: "Open de Caldinho", imagemEmAlta: "Caldinho"),
        EmAlta(usuario: "Thaynara Neves", descricao: "Bloco Flutuante", imagemEmAlta: "Bloco"),
        EmAlta(usuario: "Luana Vieira", descricao: "Frevo na Areia", imagemEmAlta: "Frevo"),
    ]
    
    
    
        
    
    //    let primeiraView: UIView! = UIView()
    //label "descubra" que já está sendo configurada já na variavél anonima.
    //Variavel anonima é necessária fechar as chaves com o parenteses no final
    //ex.: lazy var variavelAnonima {   }()
    var primeiraView = HomeView()
    
    lazy var descubraLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.customFont(type: .regular, size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
    
//        for name in UIFont.familyNames{
//        }
//
        return label
    }()
    
    
    lazy var aniversariosLabel: UILabel = {
        let label = UILabel()
        //        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Descubra histórias \n de aniversários"
        label.font = UIFont.customFont(type: .regular, size: 24)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 0
        label.sizeToFit()
        
        return label
    }()
    
    // creating search
    
    //   lazy var searchController = UISearchController(searchResultsController: nil)
    //Search bar também criada com uma variavel anonima e já configurada
    lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        //background sem fundo
        searchBar.backgroundColor = .none
        //alteração das bordas da search
        searchBar.layer.masksToBounds = true
        //valor do arredondamento das bordas
        searchBar.layer.cornerRadius = 10
        //        searchBar.barTintColor = .systemPurple
        //        searchBar.setTextFieldColor(UIColor.white)
        
        
        return searchBar
        
    }()
    
    var viewBranca: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 20
        
        return view
    }()
    
    lazy var categoriasLabel: UILabel = {
        let label = UILabel()
        
        label.text = "Categorias"
        label.font = UIFont.customFont(type: .regular, size: 22)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    
    //MARK: - PRIMEIRO PASSO PARA CRIAR A COLLECTION VIEW
    //Collection criada com uma váriavel anonima sem o "lazy"para poder ter o processamento na tela mais rápido.
    var collectionCategorias: UICollectionView = {
        //editando o layout da collection
        var layout = UICollectionViewFlowLayout()
        //editando tamanho da collection
        layout.itemSize = CGSize(width: 164, height: 64)
        //editando os espaços entre as celulas da collection
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        //editando o scroll da collection
        layout.scrollDirection = .horizontal
        
        
        //editando
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        //aqui fica o identificador para a collection.
        //Inicialmente colocamos no register o UICollectionViewCell.self pq ainda não criamos o model(arquivo que contém as alterações mais especificas das celulas) para atribuir a collection. E colocamos no identifier "teste", apenas para visualizar
        collection.register(CategoriasCollectionViewCell.self, forCellWithReuseIdentifier: CategoriasCollectionViewCell.identifier)
        //editando a barra de scroll que aparece na collection
        collection.showsHorizontalScrollIndicator = false
        //editando o fundo da collection
        collection.backgroundColor = .clear
        
        return collection
    }()
    
    lazy var emAltaLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Em Alta"
        label.font = UIFont.customFont(type: .regular, size: 22)
        label.textColor = .systemGray
        label.textAlignment = .left
        label.numberOfLines = 0
        
        return label
    }()
    
    var collectionViewEmAlta: UICollectionView = {
        
        var layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 184, height: 120)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 8)
        layout.scrollDirection = .horizontal
        
        
        var collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(EmAltaCollectionViewCell.self, forCellWithReuseIdentifier: EmAltaCollectionViewCell.identifier)
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        
        return collection
        
    }()
    
    let stackViewPresente: UIStackView = {

        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.alignment = .top
        stack.spacing = -30
        return stack
    }()
    
    let containerPresente = UIView()
    
    
    let imagemPresente: UIImageView = {
        let image = UIImage (named: "Desenho")
        
        return UIImageView (image: image)
    }()
    
    let stackViewBotao: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.contentMode = .scaleAspectFill
        stack.distribution = .fillEqually
//        stack.spacing = 6
        
        return stack
    }()
    
    lazy var botao: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tenho um código", for: .normal)
        button.titleLabel?.font = UIFont.customFont(type: .regular, size: 16)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "roxo")
//        button.layer.borderWidth = 1
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(self.botaoTenhoCodigo(sender:)), for: .touchUpInside)
        
        return button
    }()
    
    @objc func botaoTenhoCodigo(sender:UIButton){
        redirectToView()
        print ("Eu tenho um código")
    }
    
    var background: UIImageView = {
        
        let back = UIImageView()
        back.image = UIImage (named: "background")
        
        return back
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Adicionar as atribuições da homeview depois
        //        self.view = homeView
        //chamando os controles da collection
        collectionCategorias.dataSource = self
        collectionCategorias.delegate = self
        searchBar.delegate = self
        self.navigationItem.titleView?.tintColor = .white
        self.navigationController?.navigationBar.tintColor = .white

        containerPresente.contentMode = .center
        
        collectionViewEmAlta.dataSource = self
        collectionViewEmAlta.delegate = self
        
        let labelHomeView = UILabel()
        labelHomeView.backgroundColor = .clear
        labelHomeView.numberOfLines = 2
        labelHomeView.font = UIFont.customFont(type: .regular, size: 24)
        labelHomeView.textAlignment = .center
        labelHomeView.textColor = .white
        self.navigationItem.titleView = labelHomeView
        
        self.setupHierarquia()
        self.configConstraints()
        
        
        // MARK: AQUI
        
        //        self.view.addSubview(searchController.searchBar)
        
        
        //        searchController.searchResultsUpdater = self
        //        searchController.searchBar.placeholder = "Comida tailandesa"
        //        searchController.searchBar.frame = CGRect(x: 0, y: 250 , width: self.searchController.searchBar.frame.size.width, height: 44.0);
        
    }
    
    func redirectToView() {
        navigationController?.pushViewController(DigitaCodigoViewController(), animated: true)
    }
    
    
    func setupHierarquia(){
        //Adicionando as view criadas em uma ordem de camadas, ou seja, qual deve aparecer primeiro
        self.view.addSubview(self.background)
        self.view.addSubview(self.descubraLabel)
        self.view.addSubview(self.aniversariosLabel)
        self.view.addSubview(self.searchBar)
        self.view.addSubview(self.viewBranca)
        self.view.addSubview(self.categoriasLabel)
        self.view.addSubview(self.collectionCategorias)
        self.view.addSubview(self.emAltaLabel)
        
        //MARK: - TERCEIRO PASSO PARA FAZER A COLLECTION VIEW (AGORA VAI CRIAR UMA COCOA TOUCH CLASS)
        self.view.addSubview(self.collectionViewEmAlta)
        
        
        stackViewPresente.addArrangedSubview(imagemPresente)
        containerPresente.addSubview(stackViewPresente)
        stackViewBotao.addArrangedSubview(containerPresente)
        stackViewBotao.addArrangedSubview(botao)
        
        self.view.addSubview(stackViewBotao)
        
    }
    //configurando as constrains dos componentes adicionados a home
    private func configConstraints(){
        
        background.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.background.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.background.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.background.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.background.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
        
        
        //Label descubra histórias
        descubraLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.descubraLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            // self.descubraLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -509),
            self.descubraLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 23),
            self.descubraLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23)
            
        ])
        
        
        aniversariosLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.aniversariosLabel.topAnchor.constraint(equalTo: descubraLabel.bottomAnchor, constant: 5),
            //            self.aniversariosLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
            self.aniversariosLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 23),
            self.aniversariosLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23)
            
        ])
        
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            searchBar.topAnchor.constraint(equalTo: aniversariosLabel.bottomAnchor, constant: 20),
            searchBar.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchBar.heightAnchor.constraint(equalToConstant: 48)
            
        ])
        
        categoriasLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
            self.categoriasLabel.topAnchor.constraint(equalTo: viewBranca.topAnchor, constant: 24),
            //            self.aniversariosLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -500),
            self.categoriasLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 23),
            self.categoriasLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23)
            
        ])
        //MARK: - SEGUNDO PASSO PARA CRIAR A COLLECTION VIEW
        collectionCategorias.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.collectionCategorias.topAnchor.constraint(equalTo: categoriasLabel.bottomAnchor, constant: 8),
            self.collectionCategorias.leadingAnchor.constraint(equalTo: categoriasLabel.leadingAnchor),
            self.collectionCategorias.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionCategorias.heightAnchor.constraint(equalToConstant: 64)
        ])
        
        
        emAltaLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.emAltaLabel.topAnchor.constraint(equalTo: collectionCategorias.bottomAnchor, constant: 24),
            self.emAltaLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 23),
            self.emAltaLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -23)
            
        ])
        
        collectionViewEmAlta.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.collectionViewEmAlta.topAnchor.constraint(equalTo: emAltaLabel.bottomAnchor, constant: 8),
            self.collectionViewEmAlta.leadingAnchor.constraint(equalTo: emAltaLabel.leadingAnchor),
            self.collectionViewEmAlta.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionViewEmAlta.heightAnchor.constraint(equalToConstant: 120)
        ])
        
        
        viewBranca.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            self.viewBranca.topAnchor.constraint(equalTo: searchBar.bottomAnchor,constant: 37),
            self.viewBranca.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.viewBranca.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.viewBranca.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        
        ])
        
        stackViewPresente.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackViewPresente.topAnchor.constraint(equalTo: containerPresente.topAnchor),
            self.stackViewPresente.leadingAnchor.constraint(equalTo: containerPresente.leadingAnchor, constant: 116),
            self.stackViewPresente.trailingAnchor.constraint(equalTo: containerPresente.trailingAnchor, constant: -116),
            self.containerPresente.bottomAnchor.constraint(equalTo: containerPresente.bottomAnchor, constant: -44)

        ])
//
        stackViewBotao.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.stackViewBotao.topAnchor.constraint(equalTo: collectionViewEmAlta.bottomAnchor, constant: 15),
            self.stackViewBotao.heightAnchor.constraint(equalToConstant: 100),
            self.stackViewBotao.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 42),
            self.stackViewBotao.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -42),
            self.stackViewBotao.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -90)
//
        ])

    }
    
    
    
//    func updateSearchResults(for searchController: UISearchController) {
//
//    }
    
    // MARK: - Inicializar as views
    
    
    
}

extension UISearchBar {
    func setTextFieldColor(_ color: UIColor) {
        for subView in self.subviews {
            for subSubView in subView.subviews {
                let view = subSubView as? UITextInputTraits
                if view != nil {
                    let textField = view as? UITextField
                    textField?.backgroundColor = color
                    break
                }
            }
        }
    }
}

//Criando uma extensão do view controller para adicionar os controles da collection view categorias
extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionCategorias {
            return categorias.count
        } else if collectionView == collectionViewEmAlta{
            return emAlta.count
        } else {
            return 1
        }
        
    }
    //Chamando o model(edições feitas nas celulas da collection) para aparecer no home
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionCategorias {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoriasCollectionViewCell.identifier, for: indexPath) as! CategoriasCollectionViewCell
            let model = categorias[indexPath.row]
            cell.draw(model)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EmAltaCollectionViewCell.identifier, for: indexPath) as! EmAltaCollectionViewCell
            let model = emAlta[indexPath.row]
            cell.draw(model)
            
            return cell
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}


extension HomeViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? CategoriasCollectionViewCell {
            let categoria = cell.descricao.text
            let relatosViewController = RelatosViewController()
            relatosViewController.categoria = categoria!
            navigationController?.pushViewController(relatosViewController, animated: true)
//            navigationController?.showDetailViewController(RelatosViewController(), sender: label)

        }
        
    }
    
}

extension HomeViewController: UITextFieldDelegate {
    
        func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            return textField.resignFirstResponder()

        }
    


}

extension HomeViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            if let text = searchBar.text {
                // here is text from the search bar
                print(text)
                let relatosViewController = RelatosViewController()

                userInput = text
                relatosViewController.searchInput = userInput
                navigationController?.pushViewController(relatosViewController, animated: true)


                // now you can call 'performSegue'
//                performSegue(withIdentifier: relatosViewController.Identifier, sender: self)
            }
        }
    
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct HomeViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            HomeViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            HomeViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

