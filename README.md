# VKURLAction

整个代码里包括

- openURL模块 VKURLAction
- URL解析模块 VKURLParser
- 中间人模式设计 VKMediatorAction
- runtime工具 VKMsgSend


既然是基于中间人模式，那么VKMediatorAction就是整个代码的核心
VKMediatorAction的主代码并未实现什么核心内容，写了个单例是为了以后可能进行的功能扩展，从现有的代码角度，可以干掉单例，全写成类方法


__本地调用__

VKMediatorAction的category才是中间人的主要代码所在，使用category的方式便于在业务无限庞大的时候，分拆代码便于管理，可以看demo工程中的`VKMediatorAction+webVC.m`的源码

```objectivec
-(void)doAlertWebViewControllerWith:(NSString *)title withMainUrl:(NSString *)url
{
    Class cls = NSClassFromString(@"WebViewController");
    id vc = [[cls alloc]VKCallSelectorName:@"initWithTitle:url:" error:nil,title,url];
    [vc VKCallSelectorName:@"doAlertAction" error:nil];
}


-(id)getWebViewControllerWithTitle:(NSString *)title withMainUrl:(NSString *)url
{
    Class cls = NSClassFromString(@"WebViewController");
    id vc = [[cls alloc]VKCallSelectorName:@"initWithTitle:url:" error:nil,title,url];
    return vc;
}

```


可以看到所有API设计都是native的api，你可以设计任意的参数命名，任意参数种类。

换句话说我们如果想执行本地调用，只需要引入VKMediatorAction，然后调用你想要的api就够了

```objectivec
- (IBAction)native1click:(id)sender {
    [[VKMediatorAction sharedInstance] doAlertWebViewControllerWith:@"webview" withMainUrl:@"http://awhisper.github.io"];
}
- (IBAction)native2click:(id)sender {
    UIViewController *vc = [[VKMediatorAction sharedInstance]getWebViewControllerWithTitle:@"webview" withMainUrl:@"http://awhisper.github.io"];
    [self.navigationController pushViewController:vc animated:YES];
}
```

需要注意的是，`VKMediatorAction+webVC.m`内的源码完全不import业务模块，因此需要你使用runtime的方式去调用对应方法，而我的源码里有一个封装的VKMsgSend的工具，使用这个工具可以减少写runtime代码的成本`VKCallSelectorName`这个方法就是工具提供的，后续还会详细的介绍。

__远程调用__

当你需要使用url的方式打开界面的时候，首先，你需要让中间人有能力接收url传来的字典型参数,所以特意为上面代码的2个mediatoraction，增加了处理字典参数的版本，可以看到，这个代码最初符合设计初衷，url的action最后还是会调用原来的native的action

```objectivec

-(void)doAlertWebViewControllerWithURLParams:(NSDictionary *)params
{
    NSString *title = params[@"title"];
    NSString *url = params[@"url"];
    [self doAlertWebViewControllerWith:title withMainUrl:url];
}


-(id)getWebViewControllerWithURLParams:(NSDictionary *)params
{
    NSString *title = params[@"title"];
    NSString *url = params[@"url"];
    return [self getWebViewControllerWithTitle:title withMainUrl:url];
}

```
完成了Mediator对URL参数的支持，其实就已经可以直接使用VKURLAction了

__VKURLAction使用__

VKURLAction在使用的时候需要提前指定url的scheme和host，经过指定app的scheme和host，凡是不匹配的scheme与host的url都不会进行识别，具体参见demo源码吧，源码很简单不细说了


VKURLAction支持对URL加入sign校验，如果url开启了sign校验功能，所有url必须附带sign参数，并且符合签名校验规则，不然不会进行识别跳转，具体看源码吧，这都是细节，不细说了

只要完成了Mediator对URL参数的支持，其实就已经可以直接使用VKURLAction，比如我们已经写好了`getWebViewControllerWithURLParams:`方法，那么我们可以直接把`getWebViewControllerWithURLParams`当做url的path，使用`scheme://host/path?params=aa&parms2=bb`的形式来打开url，这样就会自动的把url中的参数解析成字典，传入到Mediator得对应方法里

```objectivec
//初始化URLAction
[VKURLAction setupScheme:@"demo" andHost:@"nativeOpenUrl"];
//写url
NSString * url =@"demo://nativeOpenUrl/getWebViewControllerWithURLParams?title=webView&url=http%3A%2F%2Fawhisper.github.io";
//openURL
[VKURLAction doActionWithUrlString:url];
```

更多使用方法参见demo工程

__URL生成__

如果不熟悉如何写url，VKURLAction提供了接口来自动生成接口，尤其是开启了签名校验后，url的签名规则会比较复杂，如果想测试，可以使用相关接口来自动生成url，避免手写各种出错

url的参数必须经过url标准的encode，这一点，自动生成url工具已经实现，如果由别的方式生成url（server下发之类的），请注意调试

__URL简写__

getWebViewControllerWithURLParams当做一个path名字，拼写在url里面实在是有点冗长，并且不好记，因此VKURLAction提供了方法，可以注册简写（注意这不是必须的，不写也一样能够执行url）

```objectivec
//注册简写
[VKURLAction mapKeyword:@"openWeb" toActionName:@"getWebViewControllerWithURLParams"];
//url就可以这么写了
NSString * url =@"demo://nativeOpenUrl/openWeb?title=webView&url=http%3A%2F%2Fawhisper.github.io";

```

简写注册之后，写url也清爽了不少，也少去了别人猜测我们app代码的问题，╮(╯_╰)╭


__URLParser__

整个VKURLAction都是依托在URLParser这个模块之上，他可以进行解析url，识别出url种的scheme，host，识别出url种的path，识别出url种的每一个参数，拼接成字典，校验签名的可靠性，具体代码见源码吧这块不是很复杂
