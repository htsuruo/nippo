import * as admin from 'firebase-admin'
import { initializeApp } from './initializeApp'

initializeApp()

// How to run:
// $ npm run build
// $ node -e 'require("./lib/script/deleteAllAuthUsers").deleteAllAuthUsers()'
export const deleteAllAuthUsers = async () => {
  const listUsersResult = await admin.auth().listUsers()
  for (const user of listUsersResult.users) {
    await admin.auth().deleteUser(user.uid)
  }
}
