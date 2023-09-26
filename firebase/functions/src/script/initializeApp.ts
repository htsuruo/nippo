import * as admin from 'firebase-admin'

// admin.initializeAppの引数に統一的に何かを与えたい場合を想定した
// 初期化処理をラップしたメソッド
// script実行時には必ず最初に呼ぶ
export function initializeApp(params?: { useEmulator?: boolean }) {
  process.env.GCLOUD_PROJECT = 'nippo-e8922'
  if (params?.useEmulator) {
    // 向き先をエミュレータにする
    // ref. https://firebase.google.com/docs/emulator-suite/connect_firestore?hl=ja#admin_sdks
    process.env.FIRESTORE_EMULATOR_HOST = 'localhost:8080'
  } else {
    delete process.env.FIRESTORE_EMULATOR_HOST
  }
  admin.initializeApp()
  admin.firestore().settings({ ignoreUndefinedProperties: true })
}
