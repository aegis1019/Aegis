<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1">
    <title>
        工程建设综合项目管理平台
    </title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="Scripts/EasyUI/jquery-easyui-1.5.1/themes/default/easyui.css" />
    <link rel="stylesheet" type="text/css" href="Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="css/Comm1.0.1.css" />
    <link href="css/Index1.0.0.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="js/comm/outlook2.js"></script>

    <style type="text/css">
        .easyui-accordion ul li div.selected {
            border: 0px solid #ffffff;
        }

        .tabs li {
            border-top: 5px solid #4f78a2;
            height: 30px;
        }

        .tabs li a.tabs-inner {
            border-style: solid;
            -moz-border-radius: 0 0 0 0;
            -webkit-border-radius: 0 0 0 0;
            border-radius: 0 0 0 0;
            background: #7497bc;
            /*color: #3a5d74;*/
            border-top-left-radius: 8px;
            border-top-right-radius: 6px;
        }

        .MyText {
            display: block;
            color: white;
            float: right;
            padding-left: 7px;
            font-size: 14px;
            padding-top: 5px;
        }

        .MyImg {
            float: right;
            padding: 15px 4px 10px;
            display: block;
            margin-left: 8px;
            margin-right: 8px;
        }

        .nav {
            padding-left: 12px;
            height:30px;
        }

        .ChlidIcon {
            float: left;
            height: 32px;
            width: 21px;
        }
    </style>

    <script type="text/javascript">

        var MenuData = ${moduleData};;
        var LoginUserInfo = ${loginUserInfo};
        var strType = ${pageType};
        var isProjectInfo = ${projectInfo};
        function bulidMenu(menuData, opt) {
            if (!menuData) {
                throw "menuData参数不能为空";
            }

            if (typeof menuData != "object" || !menuData.sort) {
                throw "menuData必须为数组类型";
            }

            var menuDiv;
            var menu;
            for (var i = 0; i < menuData.length; i++) {

                menu = menuData[i];

                if(menu.isRoot)
                {
                    //111
                    menuDiv = $('<div id="'+ menu.id + '" name="'+ menu.id + '" class="easyui-menu" data-options="onClick:menuHandler" style="width:200px;"></div>').appendTo('body');

                    if (menu.children) {

                        if (menu == '-') {
                            var sep = $('<div class="menu-sep"></div>');
                            menuDiv.append(sep);
                            continue;
                        }

                        for (var j = 0; j < menu.children.length; j++) {
                            var itemText = menu.children[j].text;
                            var item = $('<div></div>').html(itemText).data("data", menu.children[j]);

                            if (menu.children[j].href){
                                item.attr({ href: menu.children[j].href, target: '_blank' });
                            }

                            if (menu.children[j].itemaddr){
                                item.attr('name', menu.children[j].itemaddr);
                            }

                            if (menu.children[j].id){
                                item.attr('id', menu.children[j].id);
                            }

                            if (menu.children[j].iconCls) {
                                item.attr('iconCls', menu.children[j].iconCls);
                            }

                            menuDiv.append(item);
                        }
                    }

                    var menuItem = $('<a  href="javascript:void(0)">'+ menu.text +'</a>').data("id", menu.id);
                    menuItem.menubutton({
                        iconCls: menu.iconCls,
                        menu: menuDiv
                    });
                    $('#divMenu').append(menuItem);
                }
            }
            return menuDiv.menu(opt || {});
        }

        function showMenu(){

        }

        function addPanel(title, src, id){
            var tabPanel = $('#divTabs').tabs('getTab',title);
            if(tabPanel)
            {
                $('#divTabs').tabs("select", title);
            }
            else{
                var strFrameID = "fm" + id;

                var strHtml = src + "?FrameID=" + strFrameID;
                if(src.indexOf("?")>0)
                {
                    strHtml = src + "&FrameID=" + strFrameID;
                }
                $('#divTabs').tabs('add',{
                    title: title,
                    content: '<iframe id="fm' + id + '" name="fm' + id + '" height="100%" width="100%" frameborder="no" border="0" marginwidth="0" marginheight="0"  scrolling="no" style="overflow-x:hidden;overflow-y:hidden;" src="' + strHtml + '"></iframe>',
                    closable: true
                });
            }
        }

        function removePanel(){
            var tab = $('#divTabs').tabs('getSelected');
            if (tab){
                var index = $('#divTabs').tabs('getTabIndex', tab);
                $('#divTabs').tabs('close', index);
            }
        }

        function menuHandler(item){
            addPanel(item.text, item.name, item.id);
        }




        function CloseWin2() {
            $('#divWin').window('close');
        }

        function onItemClickLocation(){

        }

        function onItemClick(item)
        {
            var strHref = '<iframe id="fmPopWin" name="fmPopWin" width="100%" height="100%" frameborder="no" border="0" marginwidth="0" marginheight="0" width="' + item.width + '" height="' + item.height + '" src="' + item.itemaddr + '"></iframe>';

            top.window.$("#divWin").window({
                content: strHref,
                minimizable: false,
                maximizable: false,
                collapsible: false,
                width: 700,
                height: item.height,
                modal: true,
                title: item.text
            });
        }

        function EditPWD()
        {
            var obj ={
                text:'修改密码',
                width:'700',
                height:'300',
                itemaddr:'/Auth/User/EditPwd'
            };

            onItemClick(obj);
        }

        function Exit()
        {
            document.location = "/logout";
        }

        function DefEvent() {

            $("#btnWeather").bind("click", function () { Weather(); });
            $("#btnEditPwd").bind("click", function () { EditPWD(); });
            $("#btnExit").bind("click", function () { Exit(); });
        }
        function Weather(){
            addTab('天气预警','http://weather.news.qq.com/yztqcx.htm?icity=01010501','3333333333','');
        }
        $(function () {

            bulidMenu(MenuData);


            $('#ulTree').tree({
                data:MenuData,
                onClick: function(node){
                    if(node.id){
                        addPanel(node.text, node.itemaddr, node.id);
                    }
                }
            });

            $('#ulTree').tree('collapseAll');


            $('#divTabs').tabs({
                height: $("#divTabs").parent().height()
            });

            DefEvent();

            $('#divLayout').height($(document).height()-1);
            $('#divLayout').width($(document).width()-1);

            //$('#btnUser').html( LoginUserInfo.UserNo + '，'+LoginUserInfo.CompanyName);
            $('#btnUser').html( LoginUserInfo.userName + '，'+LoginUserInfo.organizationName);

            if(strType=="2"){
                InitLeftMenuReception();
                addTab('项目总平图','/first-page');
            }else
            {
                InitLeftMenu();
            }

            if(isProjectInfo =="1"){

                addTab('项目信息','/project-info/project-basic');
            }

            tabClose();
            tabCloseEven();

            $('#closeMenu').menu({
                onClick:function(item){
                    closeTab(this,item.id);
                }
            });
            showMenu();
        });
    </script>
</head>
<body>
<div id="divLayout" class="easyui-layout" style="width: 100%; height: 100%;">
    <div region="north" split="true" border="false" style="overflow: hidden; height: 60px; background: #ebf7ff; color: #fff; font-family: Verdana, 微软雅黑,黑体">

        <div class="Header">

            <img src="images/IndexPage/logo.png" alt="" style="padding-left: 15px" />
            <div class="indexBtnArea" style="float: right; padding-right: 2px;">

                <a id="btnUser" style="float: left; padding: 20px 20px 20px; display: block; color: white" href="javascript:void(0)"></a>
                <a id="btnExit" class="MyImg" href="javascript:void(0)" style="margin-right: 0px">
                    <img src="images/IndexPage/Exit_top.png" style="display: inline-block; text-align: center;" />
                    <span class="MyText">退出系统</span>
                </a>
                <a id="btnEditPwd" class="MyImg" href="javascript:void(0)">
                    <img src="images/IndexPage/PsWord.png" style="display: inline-block; text-align: center;" />
                    <span class="MyText">修改密码</span>
                </a>
                <a id="btnWeather" class="MyImg" href="javascript:void(0)">
                    <img src="images/IndexPage/weather_top.png" style="display: inline-block; text-align: center;" />
                    <span class="MyText">天气预警</span>
                </a>
            </div>
        </div>
    </div>
    <div region="west" split="true" title="导航菜单" style="width: 180px; border: 0; float: left; color: white;" id="west">
        <div class="easyui-accordion" fit="true" border="false" style="border: 0; background: #6c8292;" id="nav">
        </div>
    </div>
    <div id="mainPanle" region="center" style="background: #eee; overflow-y: hidden; border: 0px;">
        <div id="tabs" class="easyui-tabs" fit="true" style="border: 0px;" data-options="tabHeight:34">


        </div>
    </div>
</div>
</div>
<div id="divAdd"></div>
<div id="divWin"></div>
<div id="divHelperWin"></div>

<div id="mm" class="easyui-menu" style="width: 120px;">
    <div id="mm-tabclose">关闭当前</div>
    <div class="menu-sep"></div>
    <div id="mm-tabcloseother">关闭其他</div>
    <div id="mm-tabcloseall">关闭所有</div>
    <div class="menu-sep"></div>
    <div id="mm-closeable" data-options="iconCls:'icon-ok'">可关闭</div>
</div>

</body>
</html>
