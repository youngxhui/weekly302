module.exports = {
  title: '302周报计划',
  head: [],
  dest: './docs/.vuepress/dist',
  base: '/',
  themeConfig: {
    nav: [{ text: '主页', link: '/' }, { text: '2019周报', link: '/2019/' }],
    sidebar: 'auto',
    sidebar: ['/', ['/2019/0325', '0325周报']],
    sidebarDepth: 1,
    displayAllHeaders: true,
    lastUpdated: 'Last Updated',
  },
  markdown: {
    lineNumbers: true,
  },
};
