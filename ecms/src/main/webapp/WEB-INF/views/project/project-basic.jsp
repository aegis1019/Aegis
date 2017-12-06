<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

    <title>项目基本情况</title>

    <link rel="stylesheet" type="text/css" href="../css/jquery.bxslider.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/bootstrap/easyui.css" />
    <link rel="stylesheet" type="text/css" href="../Scripts/EasyUI/jquery-easyui-1.5.1/themes/icon.css" />
    <link rel="stylesheet" type="text/css" href="../css/Comm1.0.1.css" />
    <link href="../css/Index1.0.0.css" rel="stylesheet" />

    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.min.js"></script>
    <script type="text/javascript" src="../Scripts/EasyUI/jquery-easyui-1.5.1/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.easing.compatibility.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.easing.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.easing.min.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="../Scripts/Common/json2.js"></script>
    <script type="text/javascript" src="../Scripts/FirstPage/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript" src="../Scripts/jquery-1.8.3/jquery.bxslider.min.js"></script>
    <script>
        jQuery.easing.def = "string";
        $(document).ready(function () {
            var height = $(document.body).height() - 20;
            var width = $(document.body).width();
            //  $('#slider1').bxSlider();
            $('#slider1').bxSlider({
                auto: true,   //自动滑动
                pause: 8000   //自动滑动停留时间,毫秒(ms)(1000ms=1秒)
            });
            //{
            //    width: [200, 'easeInOutBack'],
            //    height: [200, 'easeOutBack']
            //}
            $("#slider1").closest(".LiSty").width(width);
            $("#slider1").closest(".bx-wrapper").height(height);
            $("#slider1").closest(".bx-wrapper").css('min-width', '100%');
        })
    </script>

</head>
<body>
<div style="height: 100%">
    <%--<div class="content" style="width: 100%; height: 100%">
        <img src="../images/img/bg-${projectId}.jpg" style="width: 100%; height: 100%" />
    </div>--%>

    <ul class="slider1" id="slider1">

        <li class="LiSty"><a href="javascript:void(0)" target="_blank">
            <img src="/Uploads/GraphicProgress/1/bg.jpg" style="width: 100%;" />
        </a></li>

        <li class="LiSty"><a href="javascript:void(0)" target="_blank">
            <img src="/Uploads/GraphicProgress/1/nk2.png" style="width: 100%;" />
        </a></li>

        <li class="LiSty"><a href="javascript:void(0)" target="_blank">
            <img src="/Uploads/GraphicProgress/1/Look.jpg" style="width: 100%;" />
        </a></li>
    </ul>


</div>
</body>

</html>
