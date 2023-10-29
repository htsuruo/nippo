import firebase from 'firebase/compat/app'
import { Auth, Tester } from './utils'
import { Collection } from '../../collection'
import { assertUnauthenticatedAccessFails } from './common'
import { assertFails, assertSucceeds } from '@firebase/rules-unit-testing'

const auth = {
  userId: 'alice',
  email: 'alice@example.com',
} as Auth

describe('users security rule', () => {
  let tester: Tester
  let db: firebase.firestore.Firestore

  beforeEach(async () => {
    tester = await Tester.init()
    db = tester.db()
  })
  afterEach(async () => await tester.afterEach())
  afterAll(async () => await tester.afterAll())

  const collectionRef = () => db.collection(Collection.users)
  const documentRef = () => collectionRef().doc(auth.userId)
  assertUnauthenticatedAccessFails(collectionRef, documentRef)

  describe('認証済みの時', () => {
    beforeEach(async () => {
      db = tester.db(auth)
    })
    test('list: できない', async () => {
      await assertFails(collectionRef().get())
    })
    test('get: できる', async () => {
      await assertSucceeds(documentRef().get())
    })
    test('create: できない', async () => {
      await assertFails(collectionRef().add({}))
      await assertFails(documentRef().set({}))
    })
    test('update: できる', async () => {
      await tester.withSecurityRulesDisabled(async (db) => {
        // authenticatedContextを通したdbでsetする必要があるので、`documentRef().set()`ではNG
        await db.doc(documentRef().path).set({})
      })
      await assertSucceeds(documentRef().update({}))
    })
    test('delete: できない', async () => {
      await assertFails(documentRef().delete())
    })

    describe('自分以外のユーザーに対して', () => {
      beforeEach(() => {
        db = tester.db({ userId: 'bob' })
      })

      test('get: できる', async () => {
        // 他ユーザーのプロフィール表示などを想定
        await assertSucceeds(documentRef().get())
      })
      test('update: できない', async () => {
        await tester.withSecurityRulesDisabled(async (db) => {
          await db.doc(documentRef().path).set({})
        })
        await assertFails(documentRef().update({}))
      })
    })
  })
})
