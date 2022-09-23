//
//  RegistrosViewController.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 13/09/22.
//

import UIKit

class RegistrosViewController: UIViewController {

    var codigoSalinha: UILabel!
    var codigoSalinhaTextField: UITextField!
    var arrayCodigosSalinha: [String] = []
    var codigoSalinhaEmUso: String?
    var compartilhaCodigoButton: UIButton = UIButton()

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //self.view = primeiraView
        let primeiraView = PedeCodigoView()
        self.view = primeiraView
        view.backgroundColor = .systemPurple
        
        primeiraView.compartilharRoleButton.addTarget(self, action: #selector(didUserTapRegistrarRole), for: .touchUpInside)
        primeiraView.tenhoCodigoButton.addTarget(self, action: #selector(didUserTapTenhoCodigo), for: .touchUpInside)
        self.navigationController?.navigationBar.tintColor = .white


    }

    override func loadView() {
       // let primeiraView = definePrimeiraTela()
        //atribuicao da view que irá ser atribuida como view raiz no view controller
        // et view = UIView()
        
        //atribuicao da view inicializada no inicio da funcao
        //self.view = definePrimeiraTela()
        self.navigationItem.title = ""
        
        self.navigationItem.titleView?.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        
    }
    
    // - MARK: A PARTIR DAQUI É MAIS EXPERIMENTAL
    
//    func UItoString(codigoSalinha: UILabel, codigoSalinhaTextField: UITextField) -> String? {
//        // Transformando valores do tipo UILabel em valores do tipo String.
//
//        let codigoSalinha = codigoSalinha.text
//        let codigoSalinhaTextField = codigoSalinhaTextField.text
//
//        if codigoSalinha != "" {
//            self.codigoSalinhaEmUso = codigoSalinha
//            return codigoSalinhaEmUso
//        } else if codigoSalinhaTextField != "" {
//            self.codigoSalinhaEmUso = codigoSalinhaTextField
//            return codigoSalinhaEmUso
//        }
//        return ""
//    }
//
//    func doesCodeExist(code: String?) -> Bool {
//        let codigoAtual = code
//        if arrayCodigosSalinha.contains(codigoAtual ?? "") && codigoAtual != "" {
//            return true
//        }
//        return false
//    }

//    func definePrimeiraTela() -> UIView {
//        let code = UItoString(codigoSalinha: codigoSalinha, codigoSalinhaTextField: codigoSalinhaTextField)
//        let doesCodeExist = doesCodeExist(code: code)
//        if code != "" && doesCodeExist == true {
//            return ForumView()
//        } else {
//            return PedeCodigoView()
//        }
//
//    }
    
    @objc func didUserTapRegistrarRole() {
        print("chamou")
        let contaAnivView = ContaAniversarioViewController()
        contaAnivView.variavelzinha = "vitoria"
        navigationController?.pushViewController(contaAnivView, animated: true)
    }
    
    @objc func didUserTapTenhoCodigo() {
        print("chamou")
        navigationController?.pushViewController(DigitaCodigoViewController(), animated: true)
    }
}

// MARK: - Preview
#if DEBUG
import SwiftUI

@available(iOS 13, *)
struct RegistrosViewController_Preview: PreviewProvider {
    static var previews: some View {
        // view controller using programmatic UI
        Group {
            RegistrosViewController().showPreview().previewDevice("iPhone SE (3rd generation)")
            RegistrosViewController().showPreview().previewDevice("iPhone SE (3rd generation)").previewInterfaceOrientation(.landscapeLeft)
        }
    }
}
#endif

