action "安装依赖" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "进行编译" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  needs = ["安装依赖"]
  runs = "npm run build"
}

workflow "自动化集成|部署" {
  resolves = [
    "编译 vuepress",
    "部署 Firebase",
  ]
  on = "push"
}

action "安装依赖库" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  args = "install"
}

action "编译 vuepress" {
  uses = "actions/npm@59b64a598378f31e49cb76f27d6f3312b582f680"
  runs = "npm run build"
  needs = ["安装依赖库"]
}

action "分支监测" {
  uses = "actions/bin/filter@d820d56839906464fb7a57d1b4e1741cf5183efa"
  args = "branch master"
  needs = ["编译 vuepress"]
}

action "部署 Firebase" {
  uses = "w9jds/firebase-action@7d6b2b058813e1224cdd4db255b2f163ae4084d3"
  args = "deploy --only hosting"
  secrets = ["FIREBASE_TOKEN"]
  needs = ["分支监测"]
}
