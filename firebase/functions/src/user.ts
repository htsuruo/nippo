export interface User {
  readonly name?: string
  readonly email?: string
  readonly photoUrl?: string

  readonly updatedAt: FirebaseFirestore.Timestamp
  readonly createdAt: FirebaseFirestore.Timestamp
}

export const userConverter: FirebaseFirestore.FirestoreDataConverter<User> = {
  toFirestore(user) {
    return user
  },
  fromFirestore(snapshot) {
    return snapshot.data() as User
  },
}
