import firebase from 'firebase/compat/app'
import { Auth, Tester } from './utils'
import { Collection } from '../../collection'
import { assertUnauthenticatedAccessFails } from './common'

const auth = {
  userId: 'alice',
  email: 'alice@example.com',
} as Auth

describe('users security rule', () => {
  let tester: Tester
  let db: firebase.firestore.Firestore

  const collectionRef = () => db.collection(Collection.users)
  const documentRef = () => collectionRef().doc(auth.userId)
  assertUnauthenticatedAccessFails(collectionRef, documentRef)

  afterEach(async () => await tester.afterEach())
  afterAll(async () => await tester.afterAll())
})
