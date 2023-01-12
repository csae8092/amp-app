Highcharts.getJSON("js/json/analytics/relationships.json", function (data) {
  const nodes = [];
  for (let x in data) {
    let node = data[x].amp_id;
    try {
      var type = data[x].relation_type_object[0].value;
    } catch (err) {
      console.log(err);
    }
    try {
      var type_id = data[x].relation_type_object[0].data.amp_id;
    } catch (err) {
      console.log(err);
    }

    let source = data[x].source[0].value;
    let target = data[x].target[0].value;
    let type_node = `type_${type}_${node.replace("relationship_id_", "")}`;
    nodes.push(
      [`Name: ${source}`, node],
      [`Name: ${target}`, node],
      [type_node, node]
    );
  }

  Highcharts.addEvent(Highcharts.Series, "afterSetOptions", function (e) {
    //var colors = Highcharts.getOptions().colors,
    var nodes = {};
    var colors = [
      "#413344",
      "#614c65",
      "#806485",
      "#936397",
      "#a662a8",
      "#664972",
      "#463c57",
      "#6e8da9",
      "#91bcdd",
      "#567d99",
      "#395e77",
      "#305662",
      "#264d4d",
      "#315c45",
      "#8a9a65",
      "#b6b975",
      "#b65d54",
      "#b60033",
      "#98062d",
      "#800022",
      "#1abc9c",
      "#16a085",
      "#2ecc71",
      "#27ae60",
      "#3498db",
      "#2980b9",
      "#9b59b6",
      "#8e44ad",
      "#34495e",
      "#2c3e50",
      "#f1c40f",
      "#f39c12",
      "#e67e22",
      "#d35400",
      "#e74c3c",
      "#c0392b",
      "#ecf0f1",
      "#bdc3c7",
      "#95a5a6",
      "#7f8c8d",
    ];

    if (
      this instanceof Highcharts.Series.types.networkgraph &&
      e.options.id === "lang-tree"
    ) {
      var i = 0;
      e.options.data.forEach(function (link) {
        if (link[0].includes("Name: ")) {
          let random = Math.floor(Math.random() * colors.length);
          nodes[link[0]] = {
            id: link[0],
            marker: {
              radius: 20,
            },
            color: "#b59890",
          };
          nodes[link[1]] = {
            id: link[1],
            marker: {
              radius: 10,
            },
            color: "#7f8c8d",
          };
        } else if (nodes[link[0]] && nodes[link[0]].color) {
          nodes[link[1]] = {
            id: link[1],
            color: "#615a60",
          };
        } else if (link[0].includes("type_")) {
          let random = Math.floor(Math.random() * colors.length);
          nodes[link[0]] = {
            id: link[0],
            color: "#7f8c8d",
          };
          nodes[link[1]] = {
            id: link[1],
            marker: {
              radius: 10,
            },
            color: "#615a60",
          };
        }
      });

      e.options.nodes = Object.keys(nodes).map(function (id) {
        return nodes[id];
      });
    }
  });

  Highcharts.chart("container-network", {
    chart: {
      type: "networkgraph",
      height: "100%",
    },
    title: {
      text: "Auden Musulin Relationships",
      align: "left",
    },
    subtitle: {
      text: "A Force-Directed Network Graph",
      align: "left",
    },
    plotOptions: {
      networkgraph: {
        keys: ["from", "to"],
        layoutAlgorithm: {
          enableSimulation: true,
          friction: -0.981,
        },
      },
    },
    series: [
      {
        accessibility: {
          enabled: false,
        },
        dataLabels: {
          enabled: true,
          linkFormat: "",
        },
        id: "lang-tree",
        data: nodes,
      },
    ],
  });
});
