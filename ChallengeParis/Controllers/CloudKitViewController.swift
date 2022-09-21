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
    let privateDatabase = CKContainer(identifier: "br.ufpe.cin.academy.mvpc.VouComerSeuBolo").privateCloudDatabase
    var codigoSalinha: String = ""
    
    var arrayRelatos: [CKRecord] = []
    var arrayMemorias: [CKRecord] = []
    
    
    
    func AddRelato(relato: Relatos){
        
        //tentando verificar se existe um relato igual no sistema
        let predicate = NSPredicate(format: "Relato == ", relato.relatoTexto)
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
                                //                                                           let alert
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
        self.arrayRelatos.removeAll()
        
        let search = search
        let predicate = NSPredicate(format: "Relato contains[cd]", search)
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                self.arrayRelatos.append(record)
                self.searchRelatosLocal(search: search)
            }
        }
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                self.searchRelatosLocal(search: search)
                
            }
            
        }
        
        //quero que o texto dos relatos OU o local do relato contenham a palavra procurada
        // MARK: Mais importante
    }
    
    func searchRelatosLocal(search: String) {
        let predicate = NSPredicate(format: "Lugar contains[cd]", search)
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                self.arrayRelatos.append(record)
                
                //mandar o array pra compor as celulas
                
            }
        }
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                //mensagem de que nada foi encontrado
            }
            
        }
        
    }
    
    func relatosPorCategoria(categoria: String) {
        self.arrayRelatos.removeAll()
        
        // MARK: Mais importante
        
        let predicate = NSPredicate(format: "Categoria == ", categoria)
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                self.arrayRelatos.append(record)
                
                //mandar o array pra compor as celulas
                
            }
        }
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                //mensagem de que nada foi encontrado
            }
            
        }
        
    }
    
    func relatosPorMaisCurtidos() {
        arrayRelatos.removeAll()
        
        let predicate = NSPredicate(value: true)
        
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "curtidas", ascending: false)]
        
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                self.arrayRelatos.append(record)
                
                //mandar o array pra compor as celulas
                
            }
        }
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                //mensagem de que nada foi encontrado
            }
            
        }
        
        
        
    }
    
    func relatosPorPreço(preco: String) {
        
        arrayRelatos.removeAll()
        
        self.arrayRelatos.removeAll()
        
        // MARK: Mais importante
        
        let predicate = NSPredicate(format: "Preco == ", preco)
        let query = CKQuery(recordType: "Relato", predicate: predicate)
        query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
        
        let operation = CKQueryOperation(query: query)
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                self.arrayRelatos.append(record)
                
                //mandar o array pra compor as celulas
                
            }
        }
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                //mensagem de que nada foi encontrado
            }
            
        }
        
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
                self.arrayMemorias.removeAll()
                
                let predicate = NSPredicate(format: "codigo ==", codigo)
                let query = CKQuery(recordType: "Memoria", predicate: predicate)
                query.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: false)]
                
                let operation = CKQueryOperation(query: query)
                
                operation.recordFetchedBlock = { record in
                    DispatchQueue.main.async {
                        self.arrayMemorias.append(record)
                    }
                    
                    
                }
                
                operation.queryCompletionBlock = { cursor, error in
                    
                    DispatchQueue.main.async {
                        //mensagem de que nada foi encontrado
                    }
                    
                }
            }
            
            
            
        }
        
        
        
    }
    
}
