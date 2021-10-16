import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Layouts 1.3

Window {
    visible: true
    width: 1260
    height: 600
    title: qsTr("Charts Example")

    GridLayout {
        columns: 3
        rows: 2
        anchors.fill: parent
        anchors.margins: 20
        rowSpacing: 20

        Chart{
            id: box
            width: 400
            height: 300
            Layout.row: 0
            Layout.column: 0

            property int test : 65;

            onPaint: {
                bar( {
                        labels : ["Jan","Feb","Mar","Apr","May","June","July"],
                        datasets : [
                            {
                                fillColor : "rgba(220,220,220,0.5)",
                                strokeColor : "rgba(220,220,220,1)",
                                data : [test,59,90,81,56,55,40]
                            },
                            {
                                fillColor : "rgba(151,187,205,0.5)",
                                strokeColor : "rgba(151,187,205,1)",
                                data : [100-test,48,40,19,96,27,100]
                            }
                        ]
                    });
            }
        }

        Chart{
            id: _line
            width: 400
            height: 300
            Layout.row: 0
            Layout.column: 1

            property var dataA: [65,59,90,81,56,55,40]
            property var dataB: [28,48,40,19,96,27,100]

            onPaint: {
                line({
                         labels : ["Jan","Feb","Mar","Apr","May","June","July"],
                         datasets : [
                             {
                                 fillColor : "rgba(220,220,220,0.5)",
                                 strokeColor : "rgba(220,220,220,1)",
                                 pointColor : "rgba(220,220,220,1)",
                                 pointStrokeColor : "#fff",
                                 data : dataA
                             },
                             {
                                 fillColor : "rgba(151,187,205,0.5)",
                                 strokeColor : "rgba(151,187,205,1)",
                                 pointColor : "rgba(151,187,205,1)",
                                 pointStrokeColor : "#fff",
                                 data : dataB
                             }
                         ]
                     });
            }
        }

        Chart{
            id: _radar
            width: 400
            height: 300
            Layout.row: 0
            Layout.column: 2

            property var dataA: [65,59,90,81,56,55,40]
            property var dataB: [28,48,40,19,96,27,100]

            onPaint: {
                radar( {
                          labels : ["Eating","Drinking","Sleeping","Designing","Coding","Partying","Running"],
                          datasets : [
                              {
                                  fillColor : "rgba(220,220,220,0.5)",
                                  strokeColor : "rgba(220,220,220,1)",
                                  pointColor : "rgba(220,220,220,1)",
                                  pointStrokeColor : "#fff",
                                  data : dataA
                              },
                              {
                                  fillColor : "rgba(151,187,205,0.5)",
                                  strokeColor : "rgba(151,187,205,1)",
                                  pointColor : "rgba(151,187,205,1)",
                                  pointStrokeColor : "#fff",
                                  data : dataB
                              }
                          ]
                      });
            }
        }

        // ROW 2
        Chart{
            id: polar
            width: 400
            height: 300
            Layout.row: 1
            Layout.column: 0

            property var data : [28,48,40,19,96,27];

            onPaint: {
                polarArea([
                              {
                                  value : data[0],
                                  color: "#D97041"
                              },
                              {
                                  value : data[1],
                                  color: "#C7604C"
                              },
                              {
                                  value : data[2],
                                  color: "#21323D"
                              },
                              {
                                  value : data[3],
                                  color: "#9D9B7F"
                              },
                              {
                                  value : data[4],
                                  color: "#7D4F6D"
                              },
                              {
                                  value : data[5],
                                  color: "#584A5E"
                              }
                          ]);
            }
        }

        Chart{
            id: _pie
            width: 400
            height: 300
            Layout.row: 1
            Layout.column: 1

            property var data: [65,59,90]

            onPaint: {
                pie([
                        {
                            value: data[0],
                            color:"#F38630"
                        },
                        {
                            value : data[1],
                            color : "#E0E4CC"
                        },
                        {
                            value : data[2],
                            color : "#69D2E7"
                        }
                    ]);
            }
        }

        Chart{
            id: _donut
            width: 400
            height: 300
            Layout.row: 1
            Layout.column: 2

            property var data: [65,59,90,81,56]

            onPaint: {
                doughnut([
                             {
                                 value: data[0],
                                 color:"#F7464A"
                             },
                             {
                                 value : data[1],
                                 color : "#E2EAE9"
                             },
                             {
                                 value : data[2],
                                 color : "#D4CCC5"
                             },
                             {
                                 value : data[3],
                                 color : "#949FB1"
                             },
                             {
                                 value : data[4],
                                 color : "#4D5360"
                             }

                         ]);
            }
        }
    }

    Timer{
        id:t
        interval: 500
        repeat: true
        running: true
        onTriggered:{
            // Update the box graph
            if(box.test>100)
                box.test=0;
            box.test+=1
            box.requestPaint();

            // Update the line chart
            var x;
            x = _line.dataA.shift();
            _line.dataA.push(x)
            x = _line.dataB.shift();
            _line.dataB.push(x)
            _line.requestPaint()

            // Radar
            x = _radar.dataA.shift();
            _radar.dataA.push(x)
            x = _radar.dataB.shift();
            _radar.dataB.push(x)
            _radar.requestPaint()


            // Polar
            x = polar.data.shift();
            polar.data.push(x)
            polar.requestPaint()

            // Polar
            x = _donut.data.shift();
            _donut.data.push(x)
            _donut.requestPaint()

            // Pie
            x = _pie.data.shift();
            _pie.data.push(x)
            _pie.requestPaint()
        }
    }
}
