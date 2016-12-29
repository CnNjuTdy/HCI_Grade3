/**
 * Created by Tonndiyee on 2016/10/15.
 */
//
var date = get_date();
document.getElementById("dateStr").innerHTML =date;

//绘图表
draw_line_chart('#lineChart');
draw_pie_chart('#pieChart');
draw_bar_chart('#allBarChart');
draw_bar_chart('#yourBarChart');
draw_bar_chart('#weightBarChart')