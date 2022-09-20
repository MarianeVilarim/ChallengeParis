//
//  Relatos+iCloudData.swift
//  ChallengeParis
//
//  Created by mvitoriapereirac on 20/09/22.
//

import Foundation
import UIKit
import CloudKit

class CloudKitViewController: UIViewController {
    
    let privateDatabase = CKContainer(identifier: "br.ufpe.cin.academy.mvpc.VouComerSeuBolo ").privateCloudDatabase
    var codigoSalinha: String = ""
    
    
    func AddRelato(relato: Relatos){
        
        //tentando verificar se existe um relato igual no sistema
        let predicate = NSPredicate(format: "name == %@", relato.relatoTexto)
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        let operation = CKQueryOperation(query: query)
        
        var existed = false
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                existed = true
                
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            DispatchQueue.main.async {
                
                if existed{
                    //quero que exiba a tela de popup com mensagem de erro
                }
                else{
                    
                    let record = CKRecord(recordType: "Relato")
                    record.setValue(relato.relatoTexto, forKey: "Relato")
                    record.setValue(relato.tituloRelato, forKey: "Titulo")
                    record.setValue(relato.preco, forKey: "Preco")
                    record.setValue(relato.idadeAutor, forKey: "Idade")
                    record.setValue(relato.curtidas, forKey: "Curtidas")
                    record.setValue(relato.categoria, forKey: "Categoria")
                    record.setValue(relato.codigo, forKey: "Codigo")
                    
                    self.privateDatabase.save(record) { (savedRecord, error) in
                        DispatchQueue.main.async {
                            
                            if error == nil {
                                //quero redirecionar pra tela de exibir codigo
                                self.codigoSalinha = relato.codigo
                                
                            } else {
                                //                                                           let alert = UIAlertController(title: "Eita", message: "Deu erro em alguma coisa...\n" + error!.localizedDescription, preferredStyle: .alert)
                                
                                //                                                           alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                                //                                                           self.present(alert,animated: true, completion: nil)
                            }
                        }
                        
                    }
                    
                }
            }
        }
    }
    
    //    func addGeneratedNumber() {
    //        //quero que os numeros gerados possam ser adicionados em um array futura consulta
    //    }
    //
    //    func returnGeneratedNumbersArray() {
    //        //quero ver se o numero gerado já existe no array
    //    }
    
    func searchRelatos(search: String) {
        //quero que o texto dos relatos OU o local do relato contenham a palavra procurada
        // MARK: Mais importante
    }
    
    func relatosPorCategoria() {
        // MARK: Mais importante

    }
    
    func relatosPorMaisCurtidos() {
        
        
    }
    
    func relatosPorPreço() {
        
    }
    
    func addMemoria(memoria: Memoria){
        // quero chamar essa funcao quando o usuario clicar na opcao de add memoria
        let record = CKRecord(recordType: "Memoria")
        
        record.setValue(memoria.nomePessoa, forKey: "nomePessoa")
        record.setValue(memoria.textoMemoria, forKey: "textoMemoria")
        record.setValue(memoria.curtidas, forKey: "curtidas")
        record.setValue(memoria.codigo, forKey: "código")
        
        self.privateDatabase.save(record) { (savedRecord, error) in
            DispatchQueue.main.async {
                if error == nil {
                    //quero dar reload na funcao que configura os relatos da collectionview do forumzinho
                    
                } else {
                    //quero chamar o popup e indicar mensagem de erro
                }
                
                
            }
            
            // - MARK: Duvidas: como mandar informacoes a partir das respostas daqui pra interface?
            
            func filtraMemoriasPorCodigo(codigo: String){
                //quero que as memorias mostradas na collectionview do forum sejam sempre do mesmo tipo de codigo (transportado pelas telinhas
                //se nao houver nenhuma com o codigo, quero mostrar uma imagem padrao de que nao ha nenhuma mensagem
            }
            
            
        }
    }
}
