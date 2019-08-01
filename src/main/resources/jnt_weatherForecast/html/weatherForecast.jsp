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




<h1> Weather Forecast</h1>


<div id="container">
  <div id="timezone"></div>
  <div id="temp"></div>
  <canvas id="icon1" width="32" height="32"></canvas>
</div>



<script language='javascript'>
  weatherForecast('${apiKey}','${units}','${language}','${color}');
</script>
