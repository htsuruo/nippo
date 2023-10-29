import firebase from 'firebase/compat/app'
import { Auth, Tester } from './utils'
import { Collection } from '../../collection'
import { assertUnauthenticatedAccessFails } from './common'
import { assertFails, assertSucceeds } from '@firebase/rules-unit-testing'
import { Post } from '../../post'

const auth = {
  userId: 'alice',
  email: 'alice@example.com',
} as Auth

const post = {
  postId: 'postId',
  title: 'title',
  description: 'description',
  updatedAt: firebase.firestore.FieldValue.serverTimestamp(),
  createdAt: firebase.firestore.FieldValue.serverTimestamp(),
} as Post

describe('posts security rule', () => {
  let tester: Tester
  let db: firebase.firestore.Firestore

  beforeEach(async () => {
    tester = await Tester.init()
    db = tester.db()
  })
  afterEach(async () => await tester.afterEach())
  afterAll(async () => await tester.afterAll())

  const userRef = () => db.collection(Collection.users).doc(auth.userId)
  const postsCollectionRef = () => userRef().collection(Collection.posts)
  const postRef = () => postsCollectionRef().doc()
  const postsQuery = () =>
    db.collectionGroup(Collection.posts).where('postId', '==', post.postId)

  assertUnauthenticatedAccessFails(postsCollectionRef, postRef)

  describe('認証済みの時', () => {
    beforeEach(async () => {
      db = tester.db(auth)
    })

    test('read: できる', async () => {
      await assertSucceeds(postsCollectionRef().get())
      await assertSucceeds(postRef().get())
    })
    test('create: できる', async () => {
      await assertSucceeds(postsCollectionRef().add(post))
      await assertSucceeds(postRef().set(post))
    })
    test('update: できる', async () => {
      await tester.withSecurityRulesDisabled(async (db) => {
        await db.doc(postRef().path).set(post)
      })
      await assertFails(postRef().update({ title: 'updatedTitle' } as Post))
    })
    test('delete: できる', async () => {
      await assertSucceeds(postRef().delete())
    })

    test('collectionGroup: できる', async () => {
      await assertSucceeds(postsQuery().get())
    })

    describe('タイトルが20文字を超える時', () => {
      const overCharactersTitle = '日報の件名が20文字を超える場合の文章です'
      const postWithOverCharacters = { ...post }
      postWithOverCharacters.title = overCharactersTitle

      test('create: できない', async () => {
        await assertFails(postsCollectionRef().add(postWithOverCharacters))
        await assertFails(postRef().set(postWithOverCharacters))
      })
      test('update: できない', async () => {
        await tester.withSecurityRulesDisabled(async (db) => {
          await db.doc(postRef().path).set(post)
        })
        await assertFails(postRef().update({ title: overCharactersTitle }))
      })
    })

    describe('他人のデータに対して', () => {
      let otherCollectionRef: firebase.firestore.CollectionReference
      let otherDocumentRef: firebase.firestore.DocumentReference
      beforeEach(() => {
        otherCollectionRef = db
          .collection(Collection.users)
          .doc('bob')
          .collection(Collection.posts)
        otherDocumentRef = otherCollectionRef.doc('otherPostId')
      })

      test('read: できる', async () => {
        await assertSucceeds(otherCollectionRef.get())
        await assertSucceeds(otherDocumentRef.get())
      })
      test('create: できない', async () => {
        await assertFails(otherCollectionRef.add(post))
        await assertFails(otherDocumentRef.set(post))
      })
      test('update: できない', async () => {
        await tester.withSecurityRulesDisabled(async (db) => {
          await db.doc(postRef().path).set(post)
        })
        await assertFails(
          otherDocumentRef.update({ title: 'updatedTitle' } as Post)
        )
      })
    })
  })
})
