workflow "New workflow" {
  on = "push"
  resolves = [
    "下载npm",
    "安装firebase cli",
    "部署到firebase",
  ]
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
  secrets = ["GITHUB_TOKEN"]
}

action "部署到firebase" {
  uses = "w9jds/firebase-action@7d6b2b058813e1224cdd4db255b2f163ae4084d3"
  needs = [
    "编译vuepress",
    "安装firebase cli",
  ]
  runs = "firebase deploy --token $FIREBASE_TOKEN"
  env = {
    FIREBASE_TOKEN = "1/Udok2g7rYvEHyDemCn37IX_w32sIc6KS1ttabaz7xoo9bw_D-0p379zhUVjTMX7r"
  }
  secrets = [
    "FIREBASE_TOKEN",
  ]
}

action "安装firebase cli" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["更新npm"]
  runs = "npm install firebase-tools"
  secrets = ["GITHUB_TOKEN"]
}
