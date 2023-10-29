import firebase from 'firebase/compat/app'
import { assertFails } from '@firebase/rules-unit-testing'
import { Tester } from './utils'

export function assertUnauthenticatedAccessFails<T>(
  collectionRef: () => firebase.firestore.CollectionReference<T>,
  documentRef: () => firebase.firestore.DocumentReference<T>,
  query?: () => firebase.firestore.Query<T>
): void {
  beforeEach(async () => {
    const tester = await Tester.init()
    tester.db()
  })

  describe('未認証の時', () => {
    test('list: できない', async () => {
      await assertFails(collectionRef().get())
    })
    test('get: できない', async () => {
      await assertFails(documentRef().get())
    })
    test('create: できない', async () => {
      await assertFails(documentRef().set({} as T))
    })
    test('update: できない', async () => {
      await assertFails(documentRef().update({}))
    })
    test('delete: できない', async () => {
      await assertFails(documentRef().delete())
    })
    if (query != null) {
      test('list: CollectionGroupで取得できない', async () => {
        await assertFails(documentRef().delete())
      })
    }
  })
}
