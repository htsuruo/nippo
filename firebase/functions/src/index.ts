import * as functions from "firebase-functions";
import * as admin from "firebase-admin";

admin.initializeApp(functions.config().firebase);
const firestore = admin.firestore();

interface Post {
  readonly title: string;
  readonly description: string;
}
interface RootPost extends Post {
  userRef?: FirebaseFirestore.DocumentReference;
}

export const onUsersPostCreate = functions.firestore
  .document("/users/{userId}/posts/{postId}")
  .onCreate(async (snapshot, context) => {
    await copyToRootWithUsersPostSnapshot(snapshot, context);
  });
export const onUsersPostUpdate = functions.firestore
  .document("/users/{userId}/posts/{postId}")
  .onUpdate(async (change, context) => {
    await copyToRootWithUsersPostSnapshot(change.after, context);
  });

async function copyToRootWithUsersPostSnapshot(
  snapshot: FirebaseFirestore.DocumentSnapshot,
  context: functions.EventContext
) {
  const postId = snapshot.id;
  const userId = context.params.userId;
  const post = snapshot.data() as RootPost;
  post.userRef = firestore.collection("users").doc(userId);
  await firestore.collection("posts").doc(postId).set(post, { merge: true });
}
