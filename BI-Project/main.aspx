<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="main.aspx.cs" Inherits="BI_Project.main" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<link rel="stylesheet" href="jqwidgets/styles/jqx.base.css" type="text/css" />
    <script type="text/javascript" src="Scripts/jquery-1.11.1.min.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxcore.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdraw.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxgauge.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxchart.core.js"></script>
    <script type="text/javascript" src="jqwidgets/jqxdata.js"></script>
    <title></title>
    <script type="text/javascript">
       // $(document).ready(function () {
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
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="gaugeValue0" 
            style="position: relative;top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer0" 
            >
        </div>
    </div>
    <div id="demowidget1" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="gaugeValue1" 
            style="position: relative; top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer1" 
            >
        </div>
    </div>
    <div id="demowidget2" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="gaugeValue2" 
            style="position: relative; top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="gaugeContainer2" 
            >
        </div>
    </div>
    <div id="Div1" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="Div2" 
            style="position: relative; top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="Div3" 
            >
        </div>
    </div>
    <div id="Div4" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="Div5" 
            style="position: relative; top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="Div6" 
            >
        </div>
    </div>
    <div id="Div7" 
        
        style="border: medium groove #33CCCC; position: relative; float:left; width: 32%; height: 250px; background-color: #C0C0C0;" 
        align="center">
        <div id="Div8" 
            style="position: relative; top: 180px; z-index:1;font-family: Sans-Serif; text-align: center; font-size: 12px; width: 30px;"></div>
       
	    <div style="float: none; position: relative; top: -10px;" id="Div9" 
            >
        </div>
    </div>
    </form>
</body>
</html>
