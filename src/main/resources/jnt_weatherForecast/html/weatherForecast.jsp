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

<template:addResources type="javascript" insert="body" resources="jquery-3.2.1.min.js, weatherForecast.js"/>
<jcr:nodeProperty node="${currentNode}" name="units" var="units"/>
<c:set value="${currentNode.UUID}" var="uuid"/>

<div id="weatherCard-${uuid}" class="weatherCard-container mt-3">
    <div class="weatherCard">
        <div class="front">
            <div class="cover">
                <img id="cityPic-${uuid}" src="#"/>
            </div>
            <div class="user">
                <img id="iconow-${uuid}" src="#"/>
            </div>

            <div class="content">
                <div class="main">
                    <h2 id="timezone-${uuid}" class="name ml-3">City</h2>
                    <div class="wtime mb-1">
                        <div id="wDate-${uuid}">Date</div>
                        <div id="wTime-${uuid}" class="ml-2">Time</div>
                    </div>
                    <div id="temp-${uuid}" class="temp">Temp</div>
                    <div id="dailySummary-${uuid}" class="summaryTxt" align="center">summary</div>

                </div>
                <div class="footer">
                    <i class="fa fa-mail-forward"></i>
                </div>
            </div>
        </div> <!-- end front panel -->
        <div class="back">
            <div class="header">
                <h5 id="summary-${uuid}" class="motto">"To be or not to be, this is my awesome motto!"</h5>
            </div>
            <div class="content">
                <div class="main">
                    <h4 id="wCity1-${uuid}" class="text-center"></h4>
                    <p id="wDate1-${uuid}" class="text-center"></p>
                    <p id="wTime1-${uuid}" class="text-center"></p>


                    <div class="stats-container">
                        <div class="stats">
                            <h4 id="day1-${uuid}">235</h4>
                            <p>

                                <img id="iconow1-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow1-${uuid}" class="mb-1">Temp</span> / <span id="temphigh1-${uuid}"
                                                                                                  class="mb-1">Temp</span>
                            </p>
                        </div>
                        <div class="stats">
                            <h4 id="day2-${uuid}">235</h4>
                            <p>

                                <img id="iconow2-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow2-${uuid}" class="mb-1">Temp</span> / <span id="temphigh2-${uuid}"
                                                                                                  class="mb-1">Temp</span>
                            </p>
                        </div>
                        <div class="stats">
                            <h4 id="day3-${uuid}">235</h4>
                            <p>

                                <img id="iconow3-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow3-${uuid}" class="mb-1">Temp</span> / <span id="temphigh3-${uuid}"
                                                                                                  class="mb-1">Temp</span>
                            </p>
                        </div>
                    </div>
                    <div class="stats-container">
                        <div class="stats">
                            <h4 id="day4-${uuid}">235</h4>
                            <p>

                                <img id="iconow4-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow4-${uuid}" class="mb-1">Temp</span> / <span id="temphigh4-${uuid}"
                                                                                                  class="mb-1">Temp</span>
                            </p>
                        </div>
                        <div class="stats">
                            <h4 id="day5-${uuid}">235</h4>
                            <p>

                                <img id="iconow5-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow5-${uuid}" class="mb-1">Temp</span> / <span id="temphigh5-${uuid}"
                                                                                                  class="mb-1">Temp</span>
                            </p>
                        </div>
                        <div class="stats">
                            <h4 id="day6-${uuid}">235</h4>
                            <p>

                                <img id="iconow6-${uuid}" height="40px" src="#"/>

                                <br/><span id="templow6-${uuid}" class="mb-1">Temp</span> / <span id="temphigh6-${uuid}"
                                                                                                  class="mb-1">Temp</span>
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
</div>

<script language='javascript'>
    console.log('${openWeatherMapKey} - ${locationIQApiKey}');

    weatherForecast('${openWeatherMapKey}', '${locationIQApiKey}', '${units}', '${uuid}');

    $().ready(function () {
        $('[rel="tooltip"]').tooltip();

    });

    function rotateCard(btn) {
        var $card = $(btn).closest('.weatherCard-${uuid}');
        console.log($card);
        if ($card.hasClass('hover')) {
            $card.removeClass('hover');
        } else {
            $card.addClass('hover');
        }
    }
</script>
