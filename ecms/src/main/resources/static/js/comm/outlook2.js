

//初始化左侧
function InitLeftMenu() {
    $("#nav").accordion({ animate: false });

    $.each(MenuData, function (i, n) {

        var menulist = '';
        menulist += '<ul>';
        $.each(n.children, function (j, o) {
            menulist += '<li><div><a id="' + o.id + '" href="#" rel="' + o.itemaddr + '" ><span class="' + o.icon + ' ChlidIcon"></span><span class="nav">' + o.text + '</span></a></div></li> ';

            //menulist += '<li><div><a id="' + o.id + '" href="#" rel="' + o.itemaddr + '" ><span class="nav">' + o.text + '</span></a></div></li> ';
            //if (o.text == "项目列表") {
            //    menulist += '<li><div><a id="' + o.id + '" href="#" rel="' + o.itemaddr + '" ><span class="nav"><img class="Pre" alt=""/></span></a></div></li> ';
            //} else {

            //}
        })
        menulist += '</ul>';

        $('#nav').accordion('add', {
            title: n.text,
            content: menulist,
            iconCls: 'icon ' + n.icon
        });

    });

    $('.easyui-accordion li a').click(function () {
        var tabTitle = $(this).children('.nav').text();

        var url = $(this).attr("rel");
        var menuid = $(this).attr("ref");
        var id = $(this).attr("id");

        addTab(tabTitle, url, id);
        $('.easyui-accordion li div').removeClass("selected");
        $(this).parent().addClass("selected");
    }).hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });

    //选中第一个
    var panels = $('#nav').accordion('panels');
    var t = panels[0].panel('options').title;
    $('#nav').accordion('select', t);
}

function InitLeftMenuReception() {
    $("#nav").accordion({ animate: false });

    $.each(MenuData, function (i, n) {

        var menulist = '';
        menulist += '<ul>';
        $.each(n.children, function (j, o) {
            menulist += '<li><div><a id="' + o.id + '" href="#" rel="' + o.itemaddr + '" ><span class="nav">' + o.text + '</span></a></div></li> ';
        })
        menulist += '</ul>';

        $('#nav').accordion('add', {
            title: n.text,
            content: menulist,
            iconCls: 'icon ' + n.icon
        });

    });

    $('.easyui-accordion li a').click(function () {
        var tabTitle = $(this).children('.nav').text();

        var url = $(this).attr("rel");
        var menuid = $(this).attr("ref");
        var id = $(this).attr("id");

        //window.location.href = "/Home/Index?Type=" + id;
        window.location.href = url;

        $('.easyui-accordion li div').removeClass("selected");
        $(this).parent().addClass("selected");
    }).hover(function () {
        $(this).parent().addClass("hover");
    }, function () {
        $(this).parent().removeClass("hover");
    });

    //选中第一个
    var panels = $('#nav').accordion('panels');
    var t = panels[0].panel('options').title;
    $('#nav').accordion('select', t);
}

function addTab(subtitle, url, id, icon) {
    if (!$('#tabs').tabs('exists', subtitle)) {
        $('#tabs').tabs('add', {
            title: subtitle,
            content: createFrame(url, id),
            closable: true,
            icon: icon
        });
    } else {
        $('#tabs').tabs('select', subtitle);
        //refreshTab({ tabTitle: subtitle, url: url });
        $('#mm-tabupdate').click();
    }
    tabClose();
}

/**
 * 刷新tab
 * @cfg
 *example: {tabTitle:'tabTitle',url:'refreshUrl'}
 *如果tabTitle为空，则默认刷新当前选中的tab
 *如果url为空，则默认以原来的url进行reload
 */
//function refreshTab(cfg){ 
//    var refresh_tab = cfg.tabTitle?$('#tabs').tabs('getTab',cfg.tabTitle):$('#tabs').tabs('getSelected'); 
//    if(refresh_tab && refresh_tab.find('iframe').length > 0){ 
//        var _refresh_ifram = refresh_tab.find('iframe')[0]; 
//        var refresh_url = cfg.url?cfg.url:_refresh_ifram.src; 
//        //_refresh_ifram.src = refresh_url; 
//        _refresh_ifram.contentWindow.location.href=refresh_url; 
//    }
function addTab2(subtitle, url) {
    if (!$('#tabs').tabs('exists', subtitle)) {
        $('#tabs').tabs('add', {
            title: subtitle,
            content: createFrame2(url),
            closable: true,
        });
    } else {
        $('#tabs').tabs('select', subtitle);
        var currTab = $('#tabs').tabs('getSelected');
        //var url = $(currTab.panel('options').content).attr('src');
        $('#tabs').tabs('update', {
            tab: currTab,
            options: {
                content: createFrame2(url)
            }
        })
    }
    tabClose();
}

function createFrame(url, id) {
    var radNum = Math.round(Math.random() * 10000);
    var s = '<iframe id="fm' + id + '" name="fm'+id+'" scrolling="auto" frameborder="0"  src="' + url + '?frameID=fm' + id + '" style="width:100%;height:100%;"></iframe>';
    //var s = '<iframe id="fm' + id + '" name="fm'+id+'" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}
function createFrame2(url) {
    var radNum = Math.round(Math.random() * 10000);
    var s = '<iframe id="fm" scrolling="auto" frameborder="0"  src="' + url + '&frameID=fm" style="width:100%;height:100%;"></iframe>';
    //var s = '<iframe id="fm" scrolling="auto" frameborder="0"  src="' + url + '" style="width:100%;height:100%;"></iframe>';
    return s;
}

function tabClose() {
    /*双击关闭TAB选项卡*/
    $(".tabs-inner").dblclick(function () {
        var subtitle = $(this).children(".tabs-closable").text();
        $('#tabs').tabs('close', subtitle);
    })
    /*为选项卡绑定右键*/
    $(".tabs-inner").bind('contextmenu', function (e) {
        var currtab_title = $(this).children(".tabs-title").text();
        var tab = $('#tabs').tabs('getTab',currtab_title);
        //var tab = $('#tabs').tabs('getSelected');
        if (tab.panel('options').closable) {
            $('#mm').menu('setIcon', {
                target: $("#mm-closeable"),
                iconCls: 'icon-ok'
            });
        }
        else {
            $('#mm').menu('setIcon', {
                target: $("#mm-closeable"),
                iconCls: 'icon-no'
            });
        }
        $('#mm').menu('show', {
            left: e.pageX,
            top: e.pageY
        });

        //var subtitle = $(this).children(".tabs-closable").text();
        var subtitle = $(this).children(".tabs-title").text();
        $('#mm').data("currtab", subtitle);
        $('#tabs').tabs('select', subtitle);
        return false;
    });
}

function closeRightTab() {
    var nextall = $('.tabs-selected').nextAll();
    if (nextall.length == 0) {
        //msgShow('系统提示','后边没有啦~~','error');
        //alert('后边没有啦~~');
        return false;
    }
    nextall.each(function (i, n) {
        var t = $('.tabs-closable', $(n)).text();
        //var t = $('a:eq(0) span', $(n)).text();
        $('#tabs').tabs('close', t);
    });
    return false;
}

function closeLeftTab() {
    var prevall = $('.tabs-selected').prevAll();
    if (prevall.length == 0) {
        alert('到头了，前边没有啦~~');
        return false;
    }
    prevall.each(function (i, n) {
        var t = $('.tabs-closable', $(n)).text();
        //var t = $('a:eq(0) span', $(n)).text();
        $('#tabs').tabs('close', t);
    });
    return false;
}

function ifTabClosable() {
    var currtab_title = $('#mm').data("currtab");
    var tab = $('#tabs').tabs('getTab',currtab_title); //$('#tabs').tabs('getSelected');
    if (tab.panel('options').closable) {
        $('li.tabs-selected a:last').removeClass("tabs-close");
        $('li.tabs-selected .tabs-closable').removeClass("tabs-closable");
        tab.panel('options').closable = false;
        //$('#tabs').tabs('update', {
        //    tab: tab,
        //    options: {
        //        closable:false
        //    }
        //})

    } else {
        if (currtab_title != "欢迎使用") {
            $('li.tabs-selected a:last').addClass("tabs-close");
            $('li.tabs-selected .tabs-closable').addClass("tabs-closable");
            tab.panel('options').closable = true;
        }
        //$('#tabs').tabs('update', {
        //    tab: tab,
        //    options: {
        //        closable: true
        //    }
        //})

    }
}

//绑定右键菜单事件
function tabCloseEven() {
    //刷新
    $('#mm-tabupdate').click(function () {
        var currTab = $('#tabs').tabs('getSelected');
        var url = $(currTab.panel('options').content).attr('src');
        $('#tabs').tabs('update', {
            tab: currTab,
            options: {
                content: createFrame(url)
            }
        })
    })
    //关闭当前
    $('#mm-tabclose').click(function () {
        var currtab_title = $('#mm').data("currtab");
        $('#tabs').tabs('close', currtab_title);
    })
    //全部关闭
    $('#mm-tabcloseall').click(function () {
        $('.tabs-inner span').each(function (i, n) {
            var t = $(n).text();
            if (t != "欢迎使用") {
                $('#tabs').tabs('close', t);
            }
        });
    });
    //关闭除当前之外的TAB
    $('#mm-tabcloseother').click(function () {
        closeRightTab();
        closeLeftTab();
    });
    //切换tab是否可关闭
    $('#mm-closeable').click(function () {
        ifTabClosable();
    });
    //关闭当前右侧的TAB
    $('#mm-tabcloseright').click(function () {
        closeRightTab();
    });
    //关闭当前左侧的TAB
    $('#mm-tabcloseleft').click(function () {
        closeLeftTab();
    });


    //退出
    $("#mm-exit").click(function () {
        $('#mm').menu('hide');
    })
}


//弹出信息窗口 title:标题 msgString:提示信息 msgType:信息类型 [error,info,question,warning]
function msgShow(title, msgString, msgType) {
    $.messager.alert(title, msgString, msgType);
}