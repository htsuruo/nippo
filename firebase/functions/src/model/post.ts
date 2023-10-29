export interface Post {
  readonly postId: string
  readonly title: string
  readonly description: string

  readonly updatedAt: FirebaseFirestore.Timestamp
  readonly createdAt: FirebaseFirestore.Timestamp
}

export const postConverter: FirebaseFirestore.FirestoreDataConverter<Post> = {
  toFirestore(post) {
    return post
  },
  fromFirestore(snapshot) {
    return snapshot.data() as Post
  },
}
