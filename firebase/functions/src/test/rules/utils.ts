import {
  initializeTestEnvironment,
  RulesTestEnvironment,
} from '@firebase/rules-unit-testing'
import { readFileSync } from 'fs'

export class Tester {
  #env!: RulesTestEnvironment
  static async init(projectId?: string): Promise<Tester> {
    const tester = new Tester()
    process.env.FIRESTORE_EMULATOR_HOST = 'localhost:8080'
    tester.#env = await initializeTestEnvironment({
      // テスト用で利用するなら"demo-*"が推奨
      projectId: projectId ?? 'demo-project',
      firestore: {
        rules: readFileSync('../firestore.rules', 'utf8'),
      },
    })
    return tester
  }

  async afterEach(): Promise<void> {
    await this.#env.clearFirestore()
  }

  async afterAll(): Promise<void> {
    await this.#env.cleanup()
  }
}
