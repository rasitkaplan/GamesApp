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

    // MARK: - Add Favorite To Cache
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
                  NotificationManager.shared.createNotfications(name: model.name ?? "", title: "Added Favorites")
              } catch {
                print("ERROR while saving data to CoreData")
              }
            }
        } catch {
        }
    }
    // MARK: - Get Favorite From Cache
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
    // MARK: - Delete Favorite From Cache
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
    // MARK: - Add Note To Cache
    func addNote(id: Int, comment: String, star: Int64, gameName: String) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}

        let context = appDelegate.persistentContainer.viewContext
        do {
            if let entity = NSEntityDescription.entity(forEntityName: "NoteEntity", in: context) {
              let game = NSManagedObject(entity: entity, insertInto: context)
                game.setValue(Int64(id), forKey: "id")
                game.setValue(comment, forKey: "comment")
                game.setValue(star, forKey: "star")
                game.setValue(gameName, forKey: "gameName")
              do {
                try context.save()
                  NotificationManager.shared.createNotfications(name: gameName, title: "Note Added")
              } catch {
                print("ERROR while saving data to CoreData")
              }
            }
        } catch {
        }
    }

    // MARK: - Get Notes From Cache
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
