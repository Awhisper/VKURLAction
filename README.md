# VKURLAction
基于target-selector 而非基于block注册式的 openURL  url参数解析+运行时行为处理，各自行为还需要自定义，定义好行为，无需统一注册，即可生效


由casa的组件化思路实现

而非目前各大 urlroute的 block注册管理式的url

不会持有block，无需注册
解析url内容，以动态运行时的行为查找是否存在url对应的action，从而动态传参
