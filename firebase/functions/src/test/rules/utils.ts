import {
  initializeTestEnvironment,
  RulesTestEnvironment,
  TokenOptions,
} from '@firebase/rules-unit-testing'
import { readFileSync } from 'fs'
import firebase from 'firebase/compat/app'

export class Tester {
  #env!: RulesTestEnvironment
  static async init(projectId?: string): Promise<Tester> {
    const tester = new Tester()
    process.env.FIRESTORE_EMULATOR_HOST = '127.0.0.1:8080'
    tester.#env = await initializeTestEnvironment({
      // テスト用で利用するなら"demo-*"が推奨
      projectId: projectId ?? 'demo-project',
      firestore: {
        rules: readFileSync('../firestore.rules', 'utf8'),
      },
    })
    return tester
  }

  // How to Use:
  // await tester.withSecurityRulesDisabled(async (db) => {
  //   await db.doc(_documentRef().path).set({})
  // })
  async withSecurityRulesDisabled<T>(
    f: (db: firebase.firestore.Firestore) => Promise<T>
  ): Promise<T> {
    let result!: T
    await this.#env.withSecurityRulesDisabled(async (context) => {
      result = await f(context.firestore())
    })
    return result
  }

  db(auth?: Auth): firebase.firestore.Firestore {
    if (!auth?.userId) {
      return this.#env.unauthenticatedContext().firestore()
    }
    return this.#env.authenticatedContext(auth.userId, { ...auth }).firestore()
  }

  async afterEach(): Promise<void> {
    await this.#env.clearFirestore()
  }

  async afterAll(): Promise<void> {
    await this.#env.cleanup()
  }
}

// ToeknOptionsにneverのuid指定が存在し衝突するため、`userId`として定義
export type Auth = TokenOptions & { readonly userId: string }
