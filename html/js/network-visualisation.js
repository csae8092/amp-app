// https://github.com/acdh-oeaw/network-visualisation

const persons_person =
  "https://raw.githubusercontent.com/Auden-Musulin-Papers/amp-app/dev/html/js/json/analytics/person_person.json";
const person_org =
  "https://raw.githubusercontent.com/Auden-Musulin-Papers/amp-app/dev/html/js/json/analytics/person_org.json";

const networkVisualization = (url, container_id, second) => {
  window
    .fetch(url)
    .then((response) => {
      if (!response.ok) {
        throw new Error(response.statusText);
      }
      return response.json();
    })
    .then((data) => {
      //console.log(data, typeof data);
      const edges = {};
      const nodes = {};
      const types = { edges: {}, nodes: {} };

      Object.entries(data).map((relation) => {
        // console.log(relation[1]);
        var amp_id = second ? relation[1].person_org : relation[1].amp_id;
        var load = true;
        try {
          var source = relation[1].source;
          var _source = "person_" + source[0].id;
        } catch (err) {
          console.log(err);
          load = false;
        }
        try {
          var target = relation[1].target;
          var _target = second
            ? "org_" + target[0].id
            : "person_" + target[0].id;
        } catch (err) {
          console.log(err);
          load = false;
        }
        try {
          var relation_type = relation[1].relation_type_object;
          var _type = "relation_type_" + relation_type[0].id;
        } catch (err) {
          console.log(err);
          load = false;
        }

        if (load) {
          edges[amp_id] = {
            id: amp_id,
            source: _source,
            target: _target,
            type: _type,
          };
          nodes[_source] = {
            id: _source,
            label: source[0].value,
            type: "Person",
          };
          nodes[_target] = {
            id: _target,
            label: target[0].value,
            type: second ? "Orgs" : "Person",
          };
          types.edges[_type] = {
            id: _type,
            label: relation_type[0].value,
          };
          types.nodes["Person"] = {
            id: "Person",
            label: "Person",
            color: "#b59890",
          };
          if (second) {
            types.nodes["Orgs"] = {
              id: "Orgs",
              label: "Organizations",
              color: "#7f8c8d",
            };
          }
        }
        // console.log(edges, nodes, types);
      });

      ReactDOM.render(
        React.createElement(NetworkVisualization.SelectionControls, {
          //   height: 800,
          //   width: 600,
          showNeighborsOnly: true,
          graph: {
            edges,
            nodes,
            types,
          },
        }),
        document.getElementById(container_id)
      );
    })
    .catch((error) => {
      console.error(error);
    });
};

networkVisualization(persons_person, "container-network", false);
networkVisualization(person_org, "container-network-org", true);
