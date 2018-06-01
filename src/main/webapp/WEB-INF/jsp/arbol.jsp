
<!doctype html>
<html>
<head>
    <title>Network | Hierarchical Layout, userDefined</title>

    <style type="text/css">
        body {
            font: 10pt sans;
        }

        #mynetwork {
            width: 600px;
            height: 600px;
            border: 1px solid lightgray;
        }
    </style>
    <script type="text/javascript" src="/js/vis.js"></script>
    <link href="/css/vis-network.min.css" rel="stylesheet" type="text/css"/>


    <script type="text/javascript">
        var nodes = null;
        var edges = null;
        var network = null;
        var directionInput = document.getElementById("direction");

        function destroy() {
            if (network !== null) {
                network.destroy();
                network = null;
            }
        }

        function draw() {
            destroy();
            nodes = [];
            edges = [];
            var connectionCount = [];

            // randomly create some nodes and edges
            for (var i = 0; i < 15; i++) {
                nodes.push({id: i, label: String(i)});
            }
            edges.push({from: 0, to: 1}); //********union de los nodos
            edges.push({from: 0, to: 2});
            edges.push({from: 1, to: 3});
            edges.push({from: 1, to: 4});
            edges.push({from: 2, to: 5});
            edges.push({from: 2, to: 6});
            edges.push({from: 3, to: 7});
            edges.push({from: 3, to: 8});
            edges.push({from: 8, to: 9});
            edges.push({from: 8, to: 10});
            edges.push({from: 5, to: 11});
            edges.push({from: 11, to: 12});
            edges.push({from: 11, to: 13});
            edges.push({from: 13, to: 14});

            nodes[0]["level"] = 0;      //*****nivel en que va cada nodo
            nodes[1]["level"] = 1;
            nodes[2]["level"] = 1;
            nodes[3]["level"] = 2;
            nodes[4]["level"] = 2;
            nodes[5]["level"] = 2;
            nodes[6]["level"] = 2;
            nodes[7]["level"] = 3;
            nodes[8]["level"] = 3;
            nodes[9]["level"] = 4;
            nodes[10]["level"] = 4;
            nodes[11]["level"] = 3;
            nodes[12]["level"] = 4;
            nodes[13]["level"] = 4;
            nodes[14]["level"] = 5;


            // create a network
            var container = document.getElementById('mynetwork');
            var data = {
                nodes: nodes,
                edges: edges
            };

            var options = {
                edges: {
                    smooth: {
                        type: 'cubicBezier',
                        forceDirection: (directionInput.value == "UD" || directionInput.value == "DU") ? 'vertical' : 'horizontal',
                        roundness: 0.4
                    }
                },
                layout: {
                    hierarchical: {
                        direction: directionInput.value
                    }
                },
                physics:false
            };
            network = new vis.Network(container, data, options);

            // add event listeners
            network.on('select', function (params) {
                document.getElementById('selection').innerHTML = 'Selection: ' + params.nodes;
            });
        }

    </script>
    
</head>

<body onload="draw();">
<h2>Hierarchical Layout - User-defined</h2>

<div style="width:700px; font-size:14px; text-align: justify;">
    This example shows a user-defined hierarchical layout. If the user defines levels for nodes but does not do so for
    all nodes, an alert will show up and hierarchical layout will be disabled. Either all or none can be defined.
    If the smooth curves appear to be inverted, the direction of the edge is not in the same direction as the network.
</div>
<p>
    <input type="button" id="btn-UD" value="Up-Down">
    <input type="button" id="btn-DU" value="Down-Up">
    <input type="button" id="btn-LR" value="Left-Right">
    <input type="button" id="btn-RL" value="Right-Left">
    <input type="hidden" id='direction' value="UD">
</p>

<div id="mynetwork"></div>

<p id="selection"></p>
<script language="JavaScript">
    var directionInput = document.getElementById("direction");
    var btnUD = document.getElementById("btn-UD");
    btnUD.onclick = function () {
        directionInput.value = "UD";
        draw();
    };
    var btnDU = document.getElementById("btn-DU");
    btnDU.onclick = function () {
        directionInput.value = "DU";
        draw();
    };
    var btnLR = document.getElementById("btn-LR");
    btnLR.onclick = function () {
        directionInput.value = "LR";
        draw();
    };
    var btnRL = document.getElementById("btn-RL");
    btnRL.onclick = function () {
        directionInput.value = "RL";
        draw();
    };
</script>
</body>
</html>
