松江区公交管理系统
====
##By Abitalo & Zela
##(2016-4-19)
----
<i>
松江区公交管理系统提供对松江区内的公交站点查询、线路查询以及公交出行最优线路查询功能。  
该系统为B/S架构，使用 Spring+Structs 2+Hibernate框架，并使用 jsp+servlet+javabean作为web层，底层使用mySQL数据库。（Spring和Structs 2框架暂未使用）</i>

#Sample  
##登录、注册和登出
![image](http://7xkp3n.com1.z0.glb.clouddn.com/login.png)  

![image](http://7xkp3n.com1.z0.glb.clouddn.com/register.png)  

![image](http://7xkp3n.com1.z0.glb.clouddn.com/logout.png)

登陆和注册时使用ajax异步判定输入是否合法，数据库中是否存在对应项，并对提交操作做对应处理。

##站点信息的查询、添加与删除
![image](http://7xkp3n.com1.z0.glb.clouddn.com/station.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/addstation.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/fuzzystation.png)

支持模糊搜索特定站点。

##线路信息的查询、添加与删除
![image](http://7xkp3n.com1.z0.glb.clouddn.com/routine.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/routinedetail.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/addRoutine.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/fuzzystation.png)

支持模糊搜索特定线路。

##运营公司信息查询

![image](http://7xkp3n.com1.z0.glb.clouddn.com/company.png)

##公交出行最优路线查询

![image](http://7xkp3n.com1.z0.glb.clouddn.com/path.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/pathtransfer.png)

可根据最短耗时或最少换乘排序，查询最优的前8条路线。

##自适应分辨率变化

![image](http://7xkp3n.com1.z0.glb.clouddn.com/autoadjust.png)

![image](http://7xkp3n.com1.z0.glb.clouddn.com/autoadjust_menu.png)

竖屏分辨率时菜单显示为侧边栏。

#Dependencies

* [materialize][materialize] (https://github.com/dogfalo/materialize/)

#Credits

Author: Aitalo [http://www.abitalo.com/](http://www.abitalo.com/)

<a href="https://cn.linkedin.com/in/abitalo">
  <img alt="Follow me on LinkedIn"
       src="https://raw.githubusercontent.com/florent37/DaVinci/master/mobile/src/main/res/drawable-hdpi/linkedin.png" />
</a>
