//
//  CoreDataManager.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager()

    func addFavorite(model: GamesResult) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}

        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<GamesEntity>(entityName: "GamesEntity")
        
        do {
          let result = try context.fetch(request)
          print("\(result.count)")
            for i in result {
                if i.id == model.id ?? 0 { return }
            }
            if let entity = NSEntityDescription.entity(forEntityName: "GamesEntity", in: context) {
              let game = NSManagedObject(entity: entity, insertInto: context)
                game.setValue(model.id ?? 0, forKey: "id")
                game.setValue(model.name ?? "", forKey: "name")
              do {
                try context.save()
                  NotificationManager.shared.createNotfications(name: model.name ?? "")
              } catch {
                print("ERROR while saving data to CoreData")
              }
            }
        } catch {
        }
    }

    func retrieveFromCoreData(completion: @escaping (Result<[GamesEntity], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<GamesEntity>(entityName: "GamesEntity")
      
      do {
        let result = try context.fetch(request)
          completion(.success(result))
        print("\(result.count)")
      } catch {
          completion(.failure(DatabaseError.failedToFetchData))
      }
    }
    
    func deleteFavorites(game: GamesResult) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<GamesEntity>(entityName: "GamesEntity")
        
        do {
          let result = try context.fetch(request)
            for i in result {
                if game.id ?? 0 == i.id {
                    context.delete(i)
                    do {
                        try context.save()
                    } catch {
                    }
                }
            }
        } catch {
        }
    }
    
    func addNote(id: String, comment: String, star: Int64) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}

        let context = appDelegate.persistentContainer.viewContext
        do {
            if let entity = NSEntityDescription.entity(forEntityName: "NoteEntity", in: context) {
              let game = NSManagedObject(entity: entity, insertInto: context)
                game.setValue(id, forKey: "id")
                game.setValue(comment, forKey: "comment")
                game.setValue(star, forKey: "star")
              do {
                try context.save()
                  debugPrint("Kayded'ld'")
//                  NotificationManager.shared.createNotfications(name: model.name ?? "")
              } catch {
                print("ERROR while saving data to CoreData")
              }
            }
        } catch {
        }
    }
    
    func getNotes(completion: @escaping (Result<[NoteEntity], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
      let context = appDelegate.persistentContainer.viewContext
      
      let request = NSFetchRequest<NoteEntity>(entityName: "NoteEntity")
      
      do {
        let result = try context.fetch(request)
          completion(.success(result))
        print("\(result.count)")
      } catch {
          completion(.failure(DatabaseError.failedToFetchData))
      }
    }
}
