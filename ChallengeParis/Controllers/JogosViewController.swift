//
//  CardsViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit

class JogosViewController: UIViewController {
 
    


    override func viewDidLoad() {
        super.viewDidLoad()
//        let primeiraView = CardsView()
        view.backgroundColor = .white

//        self.view = primeiraView
//        primeiraView.cardsCollectionView.dataSource = self
        // Do any additional setup after loading the view.
        //self.view = primeiraView
//        primeiraView.backgroundColor = .white
//        primeiraView.alpha = 1
       
    }

    override func loadView() {
        //atribuicao da view que irá ser atribuida como view raiz no view controller
        // et view = UIView()
        
        //atribuicao da view inicializada no inicio da funcao
        self.navigationItem.title = "Bora Entrosar?"
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
       

    }
    


}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct JogosViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            JogosViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            JogosViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif




