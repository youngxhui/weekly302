module.exports = {
  title: '302周报计划',
  head: [],
  dest: './docs/.vuepress/dist',
  base: '/',
  themeConfig: {
    serviceWorker: {
      updatePopup: true,
      updatePopup: {
        message: '内容有更新，请刷新',
        buttonText: '刷新',
      },
    },
    repo: 'youngxhui/weekly302',
    editLinkText: '编辑本页',
    editLinks: true,
    docsDir: 'docs',
    nav: [{ text: '主页', link: '/' }, { text: '2019周报', link: '/2019/' }],
    sidebar: 'auto',
    sidebar: ['/', 
              ['/2019/0325', '0325周报'], 
              ['/2019/0401', '0401周报'], 
              ['/2019/0408', '0408周报'],
              ['/2019/0415', '0415周报'],
              ['/2019/0422', '0422周报'],
              ['/2019/0429', '0429周报'],
              ['/2019/0506', '0506周报']
             ],
    sidebarDepth: 0,
    displayAllHeaders: true,
    lastUpdated: '最近更新',
  },
  markdown: {
    lineNumbers: true,
  },
};
