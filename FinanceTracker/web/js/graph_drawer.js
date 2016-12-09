/**
 * Created by Max on 29.11.2016.
 */

function drawStat() {
    // set the data
    var element = document.getElementById("companiesSelect");
    var company = element.options[element.selectedIndex].text;
    var companyName = company.split("-")[1];
    var companyInitials = company.split("-")[0];
    var stocks = [];
    var value = [];
    var i = 0;
    var j = 0;
    var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20"YHOO"%20and%20startDate%20%3D%20"2015-09-11"%20and%20endDate%20%3D%20"2016-12-03"&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';

    var StockTickerXML = $.get(url, function(xml) {
        $(xml).find("results").each(function () {
            $(this).find("quote").each(function () {
                $(this).find("Date").each(function () {
                    stocks[i] = [];
                    stocks[i][0] = $(this).text().concat("T12:00:00");
                    i++;
                });
            });
            $(this).find("quote").each(function () {
                $(this).find("Adj_Close").each(function () {

                    stocks[j][1] = parseFloat($(this).text());
                    j++;
                });
            });
        });
        table = anychart.data.table();
        mapping = table.mapAs();
        mapping.addField('value', 1);

        // chart type
        chart = anychart.stock();

        // set the series
        var series = chart.plot(0).line(mapping);
        series.name("Euro to Dollar Rate");
        alert(companyName);

        chart.title('Stock Line: Currency Rates');
        chart.container('graphContainer');
        table.addData(stocks);
        chart.draw();
    });





    // map the data


}