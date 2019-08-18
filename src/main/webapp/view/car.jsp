<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>LCL租车</title>
    <link rel="stylesheet" href="../static/css/car.css">
    <script src="../static/js/jquery-1.12.4.js"></script>
</head>
<body>
<!-- head -->
<div class="header">
    <!-- top -->
    <div class="head-top">
        <div class="top-link">
            <p>你好，user <a href="../public/userLogin.html">[退出]</a></p>
        </div>
    </div>
    <!-- top -->

    <!-- bottom -->
    <div class="head-bottom">
        <div class="logo">
            <img src="../static/img/logo.png" alt="logo">
        </div>
        <div class="nav clearfix">
            <ul>
                <li><a href="javascript:;">首页</a></li>
                <li class="index-a sort-nav"><a href="CarServlet?sort=null">自驾租车</a></li>
                <li class="search-nav"><a href="javascript:;">车辆查询</a></li>
                <li><a href="${pageContext.request.contextPath}/order/userOrder/1">查看订单</a></li>
                <li><a href="${pageContext.request.contextPath}/order/userOrder/-1">历史订单</a></li>
                <li><a href="javascript:;">xxx</a></li>
            </ul>
        </div>
    </div>
    <!-- bottom -->
</div>
<!-- head -->


<!-- car-bady -->
<div class="car-bady clearfix">
    <!-- sort -->
    <div class="sort clearfix">
        <ul class="clearfix">
            <li class="default current-sort"><a href="javascript:;">默认排序</a></li>
            <li class="desc"><a href="javascript:;">按租金</a><span><img src="../static/img/sort.png" alt="sort"></span></li>
            <li class="asc"><a href="javascript:;">按租金</a><span><img src="../static/img/sort.png" alt="sort"></span></li>
        </ul>
        <span></span>
    </div>
    <!-- sort -->

    <%-- search --%>
    <div class="search clearfix">
        <button id="search-but">搜索</button>
        <input type="text" id="search-txt">
    </div>
    <%-- search --%>

    <div class="carTypeList clearfix">
        <%-- div模板
            <div class="carlist clearfix  ">
                <ul>
                    <li>
                        <div class="car-img">
                            <img src="images/雪佛兰新科鲁兹.jpg"/>
                        </div>
                    </li>
                    <li>
                        <div class="carinfo">
                            <p class="name">雪佛兰新科鲁兹</p>
                            <p class="info">三厢|1.5自动|乘坐5人</p>
                        </div>
                    </li>
                    <li>
                        <div class="price">
                            <span class="rmb">￥</span>
                            <span class="num">534</span>
                            <span class="unit">/套餐价</span>
                        </div>
                        <div class="price-a"><a href="javascript:;">套餐预约</a></div>
                    </li>
                </ul>
            </div>
            --%>
        <%-- 通过jstl循环产生div --%>

        <c:forEach var="car" items="${cars}">
            <div class="carlist clearfix">
                <ul>
                    <li>
                        <div class="car-img">
                            <img src="${car.cimg}"/>
                        </div>
                    </li>
                    <li>
                        <div class="carinfo">
                            <p class="name">${car.cname}</p>
                            <p class="info">${car.cinfo}</p>
                        </div>
                    </li>
                    <li>
                        <div class="price">
                            <span class="rmb">￥</span>
                            <span class="num">${car.crent}</span>
                            <span class="unit">/套餐价</span>
                        </div>
                        <div class="price-a"><a href="${pageContext.request.contextPath}/car/${car.cid}">套餐预约</a></div>
                    </li>
                </ul>
            </div>
        </c:forEach>

    </div>
</div>
<!-- car-bady -->

</body>

<script>
    $(function () {
        $(".nav>ul>li").click(function () {
            $(this).addClass("index-a").siblings().removeClass("index-a");
        });

        $(".sort > ul > li").click(function () {
            $(this).addClass("current-sort").siblings().removeClass("current-sort");
        });

        //sort ajax实现排序
        $(".desc").click(function () {
            $.get(
                "${pageContext.request.contextPath}/car/carList",
                "sort=" + "desc",
                function (result) {
                    $(".carlist").remove();
                    console.log(typeof (result));
                    $.each(result, function (key, value) {
                        var str = jsonToStr(value);
                        $(".carTypeList").append(str);
                    });
                }, "json"
            );
        });

        $(".asc").click(function () {
            $.get(
                "${pageContext.request.contextPath}/car/carList",
                "sort=" + "asc",
                function (result) {
                    $(".carlist").remove();

                    $.each(result, function (key, value) {
                        var str = jsonToStr(value);
                        $(".carTypeList").append(str);
                    });
                }, "json"
            );
        });

        //按cname排序
        $(".default").click(function () {
            $.get(
                "${pageContext.request.contextPath}/car/carList",
                "sort=" + "default",
                function (result) {
                    $(".carlist").remove();

                    $.each(result, function (key, value) {
                        var str = jsonToStr(value);
                        $(".carTypeList").append(str);
                    });
                }, "json"
            );
        });

        //判断可用车辆
        // *共有种车型可以租用

        $(".sort>span").text("*共有" + $(".carlist").length + "种车型可以租用")
    });

    //点击导航栏，切换租车和搜索栏目
    $(".sort-nav").click(function () {
        $(".sort").css("display", "block");
        $(".search").css("display", "none");
    });

    $(".search-nav").click(function () {
        $(".sort").css("display", "none");
        $(".search").css("display", "block");
    });

    //点击搜索按钮
    $("#search-but").click(function () {
        $.post(
            "${pageContext.request.contextPath}/car/search",
            {cname: $("#search-txt").val()},
            function (data) {
                $(".carlist").remove();

                $.each(data, function (key, value) {
                    var str = jsonToStr(value);
                    $(".carTypeList").append(str);
                });

            }, "json"
        );
    });

    function jsonToStr(value) {
        var str = "<div class=\"carlist clearfix\">\n" +
            "                <ul>\n" +
            "                    <li>\n" +
            "                        <div class=\"car-img\">\n" +
            "                            <img src= " + value.cimg + ">\n" +
            "                        </div>\n" +
            "                    </li>\n" +
            "                    <li>\n" +
            "                        <div class=\"carinfo\">\n" +
            "                            <p class=\"name\">" + value.cname + "</p>\n" +
            "                            <p class=\"info\">" + value.cinfo + "</p>\n" +
            "                        </div>\n" +
            "                    </li>\n" +
            "                    <li>\n" +
            "                        <div class=\"price\">\n" +
            "                            <span class=\"rmb\">￥</span>\n" +
            "                            <span class=\"num\">" + value.crent + "</span>\n" +
            "                            <span class=\"unit\">/套餐价</span>\n" +
            "                        </div>\n" +
            "                        <div class=\"price-a\"><a href=\"${pageContext.request.contextPath}/car/=" + value.cid + "\">套餐预约</a></div>\n" +
            "                    </li>\n" +
            "                </ul>\n" +
            "            </div>";
        // console.log(str);
        return str;
    }

</script>

</html>