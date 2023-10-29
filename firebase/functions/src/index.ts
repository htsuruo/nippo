import * as logger from 'firebase-functions/logger'
import { auth } from 'firebase-functions'

import * as admin from 'firebase-admin'
import { FieldValue } from 'firebase-admin/firestore'
import { userConverter } from './model/user'
import { Collection } from './collection'

admin.initializeApp()
admin.firestore().settings({ ignoreUndefinedProperties: true })

const firestore = admin.firestore()

// Firebase Authユーザーが新規で作成された際に、そのユーザーのuidのドキュメントを作成し、
// publicなプロフィール情報を同期します。
export const onAuthUserCreate = auth.user().onCreate((user) => {
  logger.info(`New user created: ${user.uid}`)
  firestore
    .collection(Collection.users)
    .doc(user.uid)
    .withConverter(userConverter)
    .set({
      email: user.email,
      name: user.displayName,
      photoUrl: user.photoURL,
      createdAt: FieldValue.serverTimestamp(),
      updatedAt: FieldValue.serverTimestamp(),
    })
})
