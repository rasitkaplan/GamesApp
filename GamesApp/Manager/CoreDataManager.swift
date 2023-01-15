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
        
        if let entity = NSEntityDescription.entity(forEntityName: "GamesEntity", in: context) {
          let game = NSManagedObject(entity: entity, insertInto: context)
            game.setValue(model.id ?? 0, forKey: "id")
            game.setValue(model.name ?? "", forKey: "name")
          do {
            try context.save()
          } catch {
            print("ERROR while saving data to CoreData")
          }
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
}
