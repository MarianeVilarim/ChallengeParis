//
//  RelatosViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit
import CloudKit


class RelatosViewController: UIViewController {

    var searchInput = ""
    var relatosExibir: [Relatos] = []
    var viewPrincipal = UIView()
    
    var salvos = false
    var local = ""
    var categoria = ""
    var preco = ""
    
//    let Identifier: = "RelatosViewController"
//    let cloud = CloudKitViewController()
//    var array: [CKRecord] = []
    
    var categoriaDescricoes = ["Restaurante","Praia","Bar","Parque","Cultural","Casa"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        let primeiraView = ExibeRelatosView()
        self.navigationItem.titleView?.tintColor = .white

        primeiraView.relatosCollectionView.delegate = self
        primeiraView.relatosCollectionView.dataSource = self
        self.view = primeiraView
        let labelHomeView = UILabel()

        viewPrincipal = primeiraView
        view.backgroundColor = .systemPurple
        if searchInput != ""{
            labelHomeView.text = " Pesquisa por \(searchInput)"
            setupRelatosSearch(search: searchInput)
            primeiraView.relatosCollectionView.reloadData()
            

        }
        
        if categoria != "" {
            labelHomeView.text = "\(categoria)"
            setupRelatosCategoria(categoria: categoria)
            primeiraView.relatosCollectionView.reloadData()

        }
        
        if categoria != "" {
            labelHomeView.text = "\(local)"
            relatosPorLocal(lugar: local)
            primeiraView.relatosCollectionView.reloadData()

        }
        
        if preco != ""{
            labelHomeView.text = "\(preco)"
            relatosPorPreco(valor: preco)
            primeiraView.relatosCollectionView.reloadData()
        }
        labelHomeView.backgroundColor = .clear
        labelHomeView.numberOfLines = 2
        labelHomeView.font = UIFont.customFont(type: .regular, size: 24)
        labelHomeView.textAlignment = .center
        labelHomeView.textColor = .white
        self.navigationItem.titleView = labelHomeView
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = false
        
        
    }

    
    
    func setupRelatosSearch(search: String) {
        
        let search = search.lowercased()
        let relatosMgmt = RelatosManager()
        let arrayRelatos = relatosMgmt.retornaRelatos()
        print("entrou aq")
        print(arrayRelatos.count)
        for i in 0...arrayRelatos.count-1 {
           let texto = arrayRelatos[i].relatoTexto
            
            if texto != nil{
                if texto!.contains(search) {
                    relatosExibir.append(arrayRelatos[i])

                }
            }
            
        }
       

    }
    
    func relatosPorPreco(valor: String) {
        let relatosMgmt = RelatosManager()
        let arrayRelatos = relatosMgmt.retornaRelatos()
        for i in 0...arrayRelatos.count-1 {
           let precoRelato = arrayRelatos[i].preco
            if valor == precoRelato {
                relatosExibir.append(arrayRelatos[i])
            }
        }
    }
    
    func relatosPorLocal(lugar: String) {
        let relatosMgmt = RelatosManager()
        let arrayRelatos = relatosMgmt.retornaRelatos()
        for i in 0...arrayRelatos.count-1 {
            let lugarRelato = arrayRelatos[i].local
            if lugar == lugarRelato {
                relatosExibir.append(arrayRelatos[i])
            }
        }
    }
    
    
    func setupRelatosCategoria(categoria: String) {
        let relatosMgmt = RelatosManager()
        let arrayRelatos = relatosMgmt.retornaRelatos()
        for i in 0...arrayRelatos.count-1 {
           let categoriaRelato = arrayRelatos[i].categoria
            if categoria == categoriaRelato {
                relatosExibir.append(arrayRelatos[i])

            }
        }
    }
    
    
        
    

    

}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            RelatosViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            RelatosViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

extension RelatosViewController : UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? RelatosCollectionViewCell {
            print("entrou aqui")
            
            let relatoExpandidoViewController = RelatoExpandidoViewController()
            relatoExpandidoViewController.local = cell.local
            relatoExpandidoViewController.preco = cell.preco
            relatoExpandidoViewController.nomeAutor = cell.autorLabel.text!
            relatoExpandidoViewController.relatoTexto = cell.relatoTexto
            relatoExpandidoViewController.idadeAutor = cell.idadeAutor
            relatoExpandidoViewController.categoria = cell.categoria
            relatoExpandidoViewController.local = cell.local
            
            
            
//            navigationController?.pushViewController(RelatoExpandidoViewController(), animated: true)
            navigationController?.showDetailViewController(relatoExpandidoViewController, sender: self)

        }
        
    }
    
}

extension RelatosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return relatosExibir.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RelatosCollectionViewCell.cellIdentifier, for: indexPath) as? RelatosCollectionViewCell {
            print("passou na cel for item at")
            let array = relatosExibir
        

//            let titulo = array[indexPath.row].tituloRelato
//            let texto = array[indexPath.row].relatoTexto
            let relatoCompleto = array[indexPath.row]
            cell.setup(relato: relatoCompleto)
            return cell
        }
        return UICollectionViewCell()
        
    }
    
    
}
