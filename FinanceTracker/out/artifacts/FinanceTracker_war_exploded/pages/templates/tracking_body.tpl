<div class="jumbotron text-center tracking-page">

</div>


<div id="graphContainer"></div>

<select class="form-control" id="companiesSelect">
    <option>Apple-AAPL</option>
    <option>Facebook-FB</option>
    <option>Microsoft-MSFT</option>
    <option>International Bussines Mashines-IBM</option>
    <option>Yahoo-YHOO</option>
    <option>Google-GOOG</option>
</select>

<script>

    function getTodayDate() {
        var today = new Date();
        var dd = today.getDate();
        var mm = today.getMonth()+1;
        var yyyy = today.getFullYear();

        if(dd<10) {
            dd='0'+dd
        }

        if(mm<10) {
            mm='0'+mm
        }

        var result = [yyyy,mm,dd];
        return result;
    }


    function DrawGraph() {

        var element = document.getElementById("companiesSelect");
        var company = element.options[element.selectedIndex].text;
        var companyName = company.split("-")[0];
        var companyInitials = company.split("-")[1];
        var stocks = [];
        var value = [];
        var dates = getTodayDate();
        var i = 0;
        var j = 0;
        var url = 'https://query.yahooapis.com/v1/public/yql?q=select%20*%20from%20yahoo.finance.historicaldata%20where%20symbol%20%3D%20"' + companyInitials +'"%20and%20startDate%20%3D%20"' + (dates[0]-1) + '-' + dates[1] + '-' +dates[2] +'"%20and%20endDate%20%3D%20"' + dates[0] + '-' + dates[1] + '-' +dates[2] + '"&diagnostics=true&env=store%3A%2F%2Fdatatables.org%2Falltableswithkeys';

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

            chart = anychart.stock();

            var series = chart.plot(0).line(mapping);
            series.name(companyName + " Stock Rate");

            chart.title('Stock Line: Currency Rates');
            chart.container('graphContainer');
            table.addData(stocks);
            chart.draw();
        });

    };

</script>

<button onclick="DrawGraph()" class="btn btn-success">Get Stock Data</button>