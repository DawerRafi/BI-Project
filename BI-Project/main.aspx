<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BI_Project.main" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" /><%--
<link rel="stylesheet" href="Styles/jquery.dataTables.css" type="text/css" />--%>
<link rel="stylesheet" href="Styles/dataTables.jqueryui.css" type="text/css" />
<link rel="stylesheet" href="Styles/jquery-ui.css" type="text/css" />

    <script type="text/javascript" src="Scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdraw.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxgauge.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxchart.core.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdata.js"></script>
    <script type="text/javascript" src="Scripts/jquery.dataTables.min.js"></script>
    <script type="text/javascript" src="Scripts/jquery-ui.js"></script>

    <title></title>
    <script type="text/javascript">
        // $(document).ready(function () {

        function Chart(sampleData) {
            var settings = {
                title: "Fitness & exercise weekly scorecard",
                description: "Time spent in vigorous exercise by activity",
                enableAnimations: true,
                showLegend: true,
                padding: { left: 5, top: 5, right: 5, bottom: 5 },
                titlePadding: { left: 90, top: 0, right: 0, bottom: 10 },
                source: sampleData,
                categoryAxis:
		{
		    text: 'Category Axis',
		    textRotationAngle: 0,
		    dataField: 'Day',
		    showTickMarks: true,
		    tickMarksInterval: 1,
		    tickMarksColor: '#888888',
		    unitInterval: 1,
		    showGridLines: false,
		    gridLinesInterval: 1,
		    gridLinesColor: '#888888',
		    axisSize: 'auto'
		},
                colorScheme: 'scheme05',
                seriesGroups:
		[
			{
			    type: 'line',
			    valueAxis:
				{
				    unitInterval: 10,
				    minValue: 0,
				    maxValue: 100,
				    displayValueAxis: false,
				    description: 'Goal in minutes',
				    axisSize: 'auto',
				    tickMarksColor: '#888888'
				},
			    series: [
						{ dataField: 'Goal', displayText: 'Personal Goal', opacity: 0.7 }
					]
			},
			{
			    type: 'column',
			    columnsGapPercent: 100,
			    seriesGapPercent: 5,
			    valueAxis:
				{
				    unitInterval: 10,
				    minValue: 0,
				    maxValue: 100,
				    displayValueAxis: true,
				    description: 'Time in minutes',
				    axisSize: 'auto',
				    tickMarksColor: '#888888',
				    gridLinesColor: '#777777'
				},
			    series: [
						{ dataField: 'Running', displayText: 'Running' },
						{ dataField: 'Swimming', displayText: 'Swimming' },
						{ dataField: 'Cycling', displayText: 'Cycling' }
					]
			}
		]
            };
            // setup the chart
            $('#jqxChart').jqxChart(settings);
        }


        function Table(dataSet, dataset2) {
            $("#tabs").tabs({
                "activate": function (event, ui) {
                    $($.fn.dataTable.tables(true)).DataTable().columns.adjust();
                }
            });
            $('#example').dataTable({
                "data": dataSet,
                "scrollY": "150px",
                "scrollCollapse": false,
                "paging": false,
                "jQueryUI": true,
                "columns": [
            { "title": "Customer Name" },
            { "title": "Complaint Type" },
            { "title": "Operator" },
            { "title": "Complaint Date"}
        ]
            });
            $('#Table1').dataTable({
                "data": dataset2,
                "scrollY": "150px",
                "scrollCollapse": false,
                "paging": false,
                "jQueryUI": true,
                "columns": [
            { "title": "Operator Name" },
            { "title": "Average Satisfaction Rate" },
            { "title": "Complaints Handled" }
        ]
            });
        }
        function Gauge(xx, yy,description) {
            var container = '#gaugeContainer' + yy;
            var value = '#gaugeValue' + yy;
                $(container).jqxGauge({
                    ranges: [{ startValue: 0, endValue: 59, style: { fill: '#e02629', stroke: '#ff8000' }, endWidth: 13, startWidth: 10 },
                         { startValue: 60, endValue: 70, style: { fill: '#fbd109', stroke: '#e02629' }, endWidth: 16, startWidth: 13 },
                         { startValue: 71, endValue: 80, style: { fill: '#4bb648', stroke: '#e02629' }, endWidth: 16, startWidth: 13 },
                           { startValue: 81, endValue: 100, style: { fill: '#4bb648', stroke: '#e02629' }, endWidth: 16, startWidth: 13}],
                    ticksMinor: { interval: 5, size: '5%' },
                    ticksMajor: { interval: 10, size: '9%' },
                    value: 0,
                    max: 100,
                    caption: { value: description, position: 'bottom', offset: [0, -10], visible: true },
                    colorScheme: 'scheme05',
                    width: '250px',
                    height: '250px',
                    animationDuration: 1200
                });
                $(container).on('valueChanging', function (e) {
                    $(value).text(Math.round(e.args.value) + '%');
                });
                $(container).jqxGauge('value', xx);
            }
            //});
            function Gauge2(xx, yy, description) {
                var container = '#gaugeContainer' + yy;
                var value = '#gaugeValue' + yy;
                $(container).jqxGauge({
                    ranges: [{ startValue: 0, endValue: 7, style: { fill: '#4bb648', stroke: '#e02629' }, endWidth: 11, startWidth: 10 },
                         { startValue: 7, endValue: 14, style: { fill: '#fbd109', stroke: '#e02629' }, endWidth: 13, startWidth: 11 },
                           { startValue: 14, endValue: 30, style: { fill: '#e02629', stroke: '#e02629' }, endWidth: 16, startWidth: 13}],
                    ticksMinor: { interval: 1, size: '5%' },
                    ticksMajor: { interval: 4, size: '9%' },
                    labels: { visible: true, position: 'inside', interval: 2 },
                    value: 0,
                    max: 30,
                    caption: { value: description, position: 'bottom', offset: [0, -10], visible: true },
                    colorScheme: 'scheme05',
                    width: '250px',
                    height: '250px',
                    animationDuration: 1200
                });
                $(container).on('valueChanging', function (e) {
                    $(value).text(Math.round(e.args.value) + 'min');
                });
                $(container).jqxGauge('value', xx);
            }
            </script>
            <style type="text/css">
        #gaugeValue {
	        background-image: -webkit-gradient(linear, 50% 0%, 50% 100%, color-stop(0%, #fafafa), color-stop(100%, #f3f3f3));
	        background-image: -webkit-linear-gradient(#fafafa, #f3f3f3);
	        background-image: -moz-linear-gradient(#fafafa, #f3f3f3);
	        background-image: -o-linear-gradient(#fafafa, #f3f3f3);
	        background-image: -ms-linear-gradient(#fafafa, #f3f3f3);
	        background-image: linear-gradient(#fafafa, #f3f3f3);
	        -webkit-border-radius: 3px;
	        -moz-border-radius: 3px;
	        -ms-border-radius: 3px;
	        -o-border-radius: 3px;
	        -webkit-box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
	        -moz-box-shadow: 0 0 50px rgba(0, 0, 0, 0.2);
	        padding: 10px;
	    }
    </style>
</head>
<body>
    <form id="form1" runat="server">
 <h1>WELCOME </h1>
  <div id="demoWidget" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 24%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="gaugeValue0" 
            style="position: relative;top: 185px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer0" 
            >
        </div>
    </div>
    <div id="demowidget1" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 24%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        
        <div id="gaugeValue2" 
            style="position: relative; top: 185px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer2" 
            >
        </div>
    </div>
    <div id="demowidget2" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 24%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="gaugeValue1" 
            style="position: relative; top: 185px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer1" 
            >
        </div>
    </div>
    <div id="Div4" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 24%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id='jqxChart' style="width:100%; height:250px">
    </div>
    </div>
    <div id="Div1" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 48.5%; height: 300px; background-color: #C0C0C0;" 
        align="center">
        
        <table cellpadding="0" cellspacing="0" border="0" class="display" id="Table1" style="width: 100%; height: 50px"></table>
      
    </div>
    
    <div id="Div7" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 48.5%; height: 300px; background-color: #C0C0C0;" 
        align="center">
     
        
         <table cellpadding="0" cellspacing="0" border="0" class="display" id="example" 
             style="width: 100%; height: 50px"></table>
    </div>
    </form>
</body>
</html>
