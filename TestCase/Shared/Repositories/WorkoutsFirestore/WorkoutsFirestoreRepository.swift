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
  let collectionName = "workouts"

  // MARK: Actions
  func getWorkouts(
    from userId: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    database
      .collection(collectionName)
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
          let uid = $0.documentID
          let name = dictionary["name"] as? String ?? ""
          let description = dictionary["description"] as? String ?? ""
          let dateFirestore = dictionary["date"] as? Timestamp ?? nil
          let timeInterval = TimeInterval(dateFirestore?.seconds ?? 0)

          let exercisesDictionary = dictionary["exercises"] as? [[String: Any]] ?? []
          let exercises: Exercises = exercisesDictionary.map { Exercise(fromDictionary: $0) }

          return Workout(
            uid: uid,
            name: name,
            description: description,
            date: timeInterval,
            exercises: exercises
          )
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

  func deleteWorkout(
    _ workout: Workout,
    onCompletion completion: @escaping (Result<(), Error>) -> Void
  ) {
    database
      .collection(collectionName)
      .document(workout.uid)
      .delete { error in
        if let error {
          completion(.failure(error))
          return
        }

        completion(.success(()))
      }
  }

  func editWorkout(
    _ workout: Workout,
    userId: String,
    onCompletion completion: @escaping (Result<(), Error>) -> Void
  ) {
    guard var payload = workout.toJson() else {
      completion(.failure(NSError(domain: "Can't encode payload", code: -1)))
      return
    }

    payload["uid"] = nil
    payload["date"] = Timestamp(date: workout.date)
    payload["userId"] = userId

    database
      .collection(collectionName)
      .document(workout.uid)
      .setData(payload, merge: true) { error in
        if let error {
          completion(.failure(error))
          return
        }

        completion(.success(()))
      }
  }

  func createWorkout(
    _ workout: Workout,
    userId: String,
    onCompletion completion: @escaping (Result<Data, Error>) -> Void
  ) {
    guard var payload = workout.toJson() else {
      completion(.failure(NSError(domain: "Can't encode payload", code: -1)))
      return
    }

    payload["uid"] = nil
    payload["date"] = Timestamp(date: workout.date)
    payload["userId"] = userId

    var ref: DocumentReference? = nil

    ref = database
      .collection(collectionName)
      .addDocument(data: payload) { error in
        if let error {
          completion(.failure(error))
          return
        }

        payload["uid"] = ref?.documentID ?? ""
        payload["date"] = TimeInterval((payload["date"] as? Timestamp)?.seconds ?? 0)

        guard let data = payload.toData() else {
          completion(.failure(NSError(domain: "Can't encode data", code: -1)))
          return
        }

        completion(.success(data))
      }
  }
}
