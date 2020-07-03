<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>

<template:addResources type="css" resources="weatherForecast.css"/>

<template:addResources type="javascript" insert="body" resources="jquery-3.2.1.min.js, weatherForecast.js,skyicons.js" />

<jcr:nodeProperty node="${currentNode}" name="apiKey" var="apiKey"/>
<jcr:nodeProperty node="${currentNode}" name="language" var="language"/>
<jcr:nodeProperty node="${currentNode}" name="units" var="units"/>
<jcr:nodeProperty node="${currentNode}" name="color" var="color"/>




<div class="col-md-4 col-sm-6">
             <div class="weatherCard-container">
                <div class="weatherCard">
                    <div class="front">
                        <div class="cover">
                            <img id="cityPic" src="#"/>
                        </div>
                        <div class="user">
 								<canvas id="icon1" height="128px" width="128px"></canvas>
                      	</div>
                        	
                        <div class="content">
                            <div class="main">
                                <span id="timezone" class="name ml-3">City</span>
                                <span id="wDate" class="ml-4 mb-4">Date</span>
                                <span id="wTime" class="ml-4">Time</span>
                                <p id="temp" class="temp">Temp</p>

                            </div>
                            <div class="footer">
                                <i class="fa fa-mail-forward"></i>
                            </div>
                        </div>
                    </div> <!-- end front panel -->
                    <div class="back">
                        <div class="header">
                            <h5 id="summary" class="motto">"To be or not to be, this is my awesome motto!"</h5>
                        </div>
                        <div class="content">
                            <div class="main">
                                <h4 id="wCity1" class="text-center"></h4>
                                <p id="wDate1" class="text-center"></p>
                                <p id="wTime1" class="text-center"></p>


                                <div class="stats-container">
                                    <div class="stats">
                                        <h4 id="day1">235</h4>
                                        <p>
                                            <canvas id="dailyIcon1" height="40px" width="40px"></canvas>
                                            <br/><span id="templow1" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh1" class="mb-1">Temp</span><sup>°C</sup>
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4 id="day2">235</h4>
                                        <p>
                                            <canvas id="dailyIcon2" height="40px" width="40px"></canvas>
                                            <br/><span id="templow2" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh2" class="mb-1">Temp</span><sup>°C</sup>
                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4 id="day3">235</h4>
                                        <p>
                                            <canvas id="dailyIcon3" height="40px" width="40px"></canvas>
                                            <br/><span id="templow3" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh3" class="mb-1">Temp</span><sup>°C</sup>

                                        </p>
                                    </div>
                                </div>
                                <div class="stats-container">
                                    <div class="stats">
                                        <h4 id="day4">235</h4>
                                        <p>
                                            <canvas id="dailyIcon4" height="40px" width="40px"></canvas>
                                            <br/><span id="templow4" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh4" class="mb-1">Temp</span><sup>°C</sup>

                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4 id="day5">235</h4>
                                        <p>
                                            <canvas id="dailyIcon5" height="40px" width="40px"></canvas>
                                            <br/><span id="templow5" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh5" class="mb-1">Temp</span><sup>°C</sup>

                                        </p>
                                    </div>
                                    <div class="stats">
                                        <h4 id="day6">235</h4>
                                        <p>
                                            <canvas id="dailyIcon6" height="40px" width="40px"></canvas>
                                            <br/><span id="templow6" class="mb-1">Temp</span><sup>°C</sup> / <span id="temphigh6" class="mb-1">Temp</span><sup>°C</sup>

                                        </p>
                                    </div>
                                </div>

                            </div>
                        </div>
                        <div class="footer">
                            <div class="social-links text-center">

                            </div>
                        </div>
                    </div> <!-- end back panel -->
                </div> <!-- end card -->
            </div> <!-- end card-container -->
        </div> <!-- end col sm 3 -->

<script language='javascript'>
  weatherForecast('${apiKey}','${units}','${language}','${color}');
  
     $().ready(function(){
        $('[rel="tooltip"]').tooltip();

    });

    function rotateCard(btn){
        var $card = $(btn).closest('.weatherCard-container');
        console.log($card);
        if($card.hasClass('hover')){
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }
</script>
