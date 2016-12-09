/**
 * Created by Max on 01.12.2016.
 */
function GetHistoricalStock() {
    var stocks = [];
    var value = [];
    var i = 0;
    var j = 0;
    var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20"YHOO"%20and%20startDate%20%3D%20"2009-09-11"%20and%20endDate%20%3D%20"2010-03-10"&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';

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
        alert(stocks);
        return stocks;
    });

}