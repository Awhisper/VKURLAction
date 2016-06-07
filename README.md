# VKURLAction
基于target-selector  中间人模式VKMediatorAction，而非基于block注册式实现的组件化解耦

基于中间人组件化基础实现了openURL的route


- 实现目标组件所对应支持的中间人VKMediatorAction（实现本地调用解耦）
- 在中间人之上，实现openURL的parse&route，调用VKMediatorAction（实现远程调用解耦）


由反革命工程师casa提出的组件化+路由的思路实现，而非目前各大 urlroute的 block注册管理式的url

这个工具不是为了做urlroute专门设计的，而是基于本地组件化解耦之上，利用组件化的设计封装出得openurl


- 不会持有block，不会统一维护一个map表
- 无需注册（但需要准备中间人模块，用于解耦）
- 基于本地组件解耦，本地调用（包含非json对象传参调用）
- 封装远程url调用，（只支持json对象传参调用）
- 远程url调用是本地调用的子集

解析url内容，以动态运行时的行为查找是否存在url对应的action，从而动态传参
