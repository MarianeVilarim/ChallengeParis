//
//  RelatosViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit
import CloudKit


class RelatosViewController: UIViewController {

    let primeiraView: UIView! = ExibeRelatosView()
//    let Identifier: = "RelatosViewController"
    let cloud = CloudKitViewController()
    var array: [CKRecord] = []
    
    var categoriaDescricoes = ["Restaurante","Praia","Bar","Parque","Cultural","Casa"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let primeiraView = ExibeRelatosView()

        self.view = primeiraView
        primeiraView.relatosCollectionView.delegate = self
         view.backgroundColor = .systemPurple
        
    }

    override func loadView() {
        //atribuicao da view que irá ser atribuida como view raiz no view controller
        // et view = UIView()
        
        //atribuicao da view inicializada no inicio da funcao
//        self.view = primeiraView
        self.navigationItem.title = "Search/Praia"
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true

    }
    
    
    func configuraArrayRelatos(parametro: String) {
        if categoriaDescricoes.contains(parametro) {
            let arrayCK = cloud.relatosPorCategoria(categoria: parametro)
            transformaEmModel(array: arrayCK)

        }
        else {
            let arrayCK = cloud.searchRelatosLocal(search: parametro)
            transformaEmModel(array: arrayCK)


        }
        
    }
    
    func transformaEmModel(array: [CKRecord]) {
        self.array = array
        
        for i in 1...array.count {
            array[i].value(forKey: "Titulo")
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
            let label = cell
//            navigationController?.pushViewController(RelatoExpandidoViewController(), animated: true)
            navigationController?.showDetailViewController(RelatoExpandidoViewController(), sender: label)

        }
        
    }
    
}
