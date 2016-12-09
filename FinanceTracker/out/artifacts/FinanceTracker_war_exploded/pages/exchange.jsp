<%@ page import="main.java.com.net.services.TemplateLoader" %><%--
  Created by IntelliJ IDEA.
  User: Max
  Date: 27.11.2016
  Time: 20:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<% out.println(TemplateLoader.loadTemplate("exchange_head")); %>
<body>

<% out.println(TemplateLoader.loadTemplate("site_navbar")); %>

<!-- Body -->

<div class="jumbotron text-center exchange-image">

</div>

<p style="color:black; text-align: center; font-weight: bolder">Most popular exchange rates</p>

<table style="color:black" id="exchangeTable">
    <tr>
        <th>Exchange</th>
        <th>Value</th>
    </tr>
</table>

<script>
    function getExchange() {
        var element = document.getElementById("firstExchange");
        var exchangeValue = document.getElementById("exchangeValue").value;
        var firstValue = element.options[element.selectedIndex].text;
        element = document.getElementById("secondExchange");
        var secondValue = element.options[element.selectedIndex].text;
        var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20%3D%20%22' + firstValue + secondValue + '%22&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
        var xmlResponse = $.get(url,function (xml) {
            $(xml).find("results").each(function () {
                $(this).find("rate").each(function () {
                    $(this).find("Rate").each(function () {
                        var currentRate = $(this).text();
                        document.getElementById("resultExchange").value = parseFloat(currentRate)*exchangeValue;
                    });

                });

            });
        });
    }
</script>

<div class="container-fluid">
    <input id="exchangeValue" type= "number" onchange="getExchange()" name= "firstVal"  title= "First Value" style="width:40%; color: black"/>
    <input id="resultExchange" type= "number" name= "secondVal"  title= "Second Value" style="width:40%; float: right; color: black"/>
    <select class="form-control" id="firstExchange" style="width:40%; float: left">
        <option selected="selected">USD</option>
        <option>BYN</option>
        <option>RUB</option>
        <option>EUR</option>
        <option>GBP</option>
        <option>JPY</option>
    </select>
    <select class="form-control" id="secondExchange" style="width:40%; float: right">
        <option>USD</option>
        <option selected="selected">BYN</option>
        <option>RUB</option>
        <option>EUR</option>
        <option>GBP</option>
        <option>JPY</option>
    </select>
</div>


<script>
    window.onload = loadRates();

    function loadRates() {
        var exchangePairs = ["USDBYN","EURBYN","USDRUB","USDEUR","USDGBP","EURRUB","EURGBP"];
        var xmlResponse;
        var rateName;
        var currentRate;
        var table = document.getElementById("exchangeTable");
        var row;
        var firstCell;
        var secondCell;

        for (var i = 0; i < exchangePairs.length; i++) {
            var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.xchange%20where%20pair%20%3D%20%22' + exchangePairs[i] + '%22&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';
            xmlResponse = $.get(url,function (xml) {
                $(xml).find("results").each(function () {
                    $(this).find("rate").each(function () {
                        $(this).find("Name").each(function () {
                            rateName = $(this).text();
                        });
                        $(this).find("Rate").each(function () {
                            currentRate = $(this).text();
                        });

                    });
                });
                row = table.insertRow(-1);
                firstCell = row.insertCell(0);
                secondCell = row.insertCell(1);
                firstCell.innerHTML = rateName;
                secondCell.innerHTML = currentRate;
            });
        }
    }
</script>

<% out.println(TemplateLoader.loadTemplate("footer")); %>

<% out.println(TemplateLoader.loadTemplate("ajax_scripts")); %>

</body>
</html>
