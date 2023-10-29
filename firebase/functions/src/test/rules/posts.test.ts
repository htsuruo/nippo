import firebase from 'firebase/compat/app'
import { Auth, Tester } from './utils'
import { Collection } from '../../collection'
import { assertUnauthenticatedAccessFails } from './common'

const auth = {
  userId: 'alice',
  email: 'alice@example.com',
} as Auth

describe('posts security rule', () => {
  let tester: Tester
  let db: firebase.firestore.Firestore

  beforeEach(async () => {
    tester = await Tester.init()
    db = tester.db()
  })
  afterEach(async () => await tester.afterEach())
  afterAll(async () => await tester.afterAll())

  const collectionRef = () => db.collection(Collection.posts)
  const documentRef = () => collectionRef().doc(auth.userId)
  assertUnauthenticatedAccessFails(collectionRef, documentRef)
})
