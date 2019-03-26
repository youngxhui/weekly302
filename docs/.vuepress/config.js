module.exports = {
  title: '302周报计划',
  head: [],
  dest: './docs/.vuepress/dist',
  base: '/',
  themeConfig: {
    repo: 'youngxhui/weekly302',
    editLinkText: '编辑本页',
    editLinks: true,
    docsDir: 'docs',
    nav: [{ text: '主页', link: '/' }, { text: '2019周报', link: '/2019/' }],
    sidebar: 'auto',
    sidebar: ['/', ['/2019/0325', '0325周报']],
    sidebarDepth: 1,
    displayAllHeaders: true,
    lastUpdated: '最近更新',
  },
  markdown: {
    lineNumbers: true,
  },
};
