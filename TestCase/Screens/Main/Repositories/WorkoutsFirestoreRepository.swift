//
//  WorkoutsFirestoreRepository.swift
//  TestCase
//
//  Created by Douglas Hennrich on 17/04/23.
//

import Foundation
import FirebaseFirestore

class WorkoutsFirestoreRepository: WorkoutsRepositoryDelegate {
  // MARK: Properties
  let database = Firestore.firestore()

  // MARK: Actions
  func getWorkouts(
    from userId: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    database
      .collection("users")
      .whereField("userId", isEqualTo: userId)
      .getDocuments() { querySnapshot, error in

        if let error {
          print("Error getting documents: \(error)")
          completion(.failure(error))
          return
        }

        guard let documents = querySnapshot?.documents else {
          completion(
            .success("[]".data(using: .utf8) ?? Data())
          )
          return
        }

        let documentsArray = documents.map {
          let dictionary = $0.data()
          let name = dictionary["name"] as? String ?? ""
          let description = dictionary["description"] as? String ?? ""
          let date = dictionary["date"] as? TimeInterval ?? 0.0

          return Workout(name: name, description: description, date: date)
        }

        guard let payload = documentsArray.toData() else {
          completion(
            .success("[]".data(using: .utf8) ?? Data())
          )
          return
        }

        completion(.success(payload))
      }
  }
}
