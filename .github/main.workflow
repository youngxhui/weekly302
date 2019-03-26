workflow "自动化集成部署" {
  on = "push"
  resolves = ["GitHub Action for Firebase"]
}

action "安装依赖" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "进行编译" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["安装依赖"]
  runs = "npm run build"
}

action "GitHub Action for Firebase" {
  uses = "w9jds/firebase-action@7d6b2b058813e1224cdd4db255b2f163ae4084d3"
  needs = ["进行编译"]
  secrets = ["FIREBASE_TOKEN"]
  args = "deploy --only hosting"
}
