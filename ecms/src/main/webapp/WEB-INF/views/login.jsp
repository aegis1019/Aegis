<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8">
    <title>工程建设综合项目管理平台</title>
    <script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="Scripts/Common/json2.js"></script>
    <link type="text/css" href="css/signin.css" rel="stylesheet" />
    <script type="text/javascript">
        function $Enter$(event, objId, fn) {
            var keycode;
            if (window.event)
                keycode = event.keyCode;
            else
                keycode = event.which;
            if (keycode == 13 || keycode == 108) {
                if (fn) {
                    fn();
                }
                else {
                    var obj = $(objId);
                    if (obj) {
                        obj.focus();
                    }
                }
                return false;
            }
        }

        var clickFlag = false;
        function save() {
            if (!clickFlag) {
                clickFlag = true;
                var u = $("#UserName").val();
                if (!/^[a-zA-Z0-9_]{2,20}$/.test(u)) {
                    alert("用户名只能为2到20位的大小写字母和数字");
                    $("#UserName").focus();
                    clickFlag = false;
                    return;
                }
                var p = $("#Password").val();
                if (!/^.{6,}$/.test(p)) {
                    alert("密码长度不能少于6位");
                    $("#Password").focus();
                    clickFlag = false;
                    return;
                }
                $.ajax({
                    type: "post",
                    url: "/login-post",
                    contentType: "application/json",
                    data: JSON.stringify({ userName: encodeURIComponent(u), password: encodeURIComponent(p) }),
                    success: function (reg) {
                        if (reg.isSuccess) {
                            window.location = reg.redirectUrl;
                        }else{
                            alert(reg.message);
                        }
                    }
                });
            }
        }
    </script>
</head>

<body>
<div class="warp">
    <div class="title">
        <img src="images/Login/logo3.png" alt=""/>
    </div>
    <div class="bg_box">
        <div class="login_box">
            <div class="signin">
                <form class="form_signin">
                    <input type="text" id="UserName" placeholder="用户名" class="UserName" onkeyup="$Enter$(event,'Password')" />
                    <input type="password" id="Password" placeholder="密 码" class="Password" onkeyup="$Enter$(event,null,save)" />
                    <input style="height: 40px;" value="登录" type="button" class="form_submit" onclick="save()" />
                </form>
            </div>
        </div>
    </div>
    <div class="bottom_box">
        <div class="bottom">
            <div>福州市大数据产业基地开发有限责任公司&nbsp;版权所有&nbsp;闽ICP备17002223号</div>
            <div>地址:福州市长乐市数字福建(长乐)产业园</div>
            <div>邮政编码:350200 &nbsp;电话:0591-28665658</div>
        </div>
    </div>
</div>
<script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
<script type="text/javascript" src="Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
</body>
</html>
