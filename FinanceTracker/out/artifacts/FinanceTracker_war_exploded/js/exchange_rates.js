/**
 * Created by Max on 05.12.2016.
 */

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
            alert(table);
            alert(rateName+currentRate);
            row = table.insertRow(0);
            firstCell = row.insertCell(0);
            secondCell = row.insertCell(1);
            firstCell.innerHTML = rateName;
            secondCell.innerHTML = currentRate;
        });

    }
}