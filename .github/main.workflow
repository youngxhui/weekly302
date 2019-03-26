workflow "New workflow" {
  on = "push"
  resolves = ["下载npm", "GitHub Action for npm"]
}

action "下载npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm install"
}

action "更新npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["下载npm"]
  runs = "npm i npm@latest -g"
}

action "编译vuepress" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["更新npm"]
  runs = "npm run build"
}

action "GitHub Action for npm" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["编译vuepress"]
  runs = "firebase deploy --token $FIREBASE_TOKEN"
  secrets = ["FIREBASE_TOKEN"]
}
