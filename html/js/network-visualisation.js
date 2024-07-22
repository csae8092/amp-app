// https://github.com/acdh-oeaw/network-visualisation

const persons_person =
  "https://raw.githubusercontent.com/Auden-Musulin-Papers/amp-app/dev/html/js/json/analytics/person_person.json";
const person_org =
  "https://raw.githubusercontent.com/Auden-Musulin-Papers/amp-app/dev/html/js/json/analytics/person_org.json";
const merged = "js/json/analytics/merged_relationships.json";

const networkVisualization = (url, container_id, second, all) => {
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

      if (all) {
        data.map((relation) => {
          // console.log(relation);
          if (relation.hasOwnProperty("person_org")) {
            var amp_id = relation.person_org;
          } else if (relation.hasOwnProperty("org_event")) {
            var amp_id = relation.org_event;
          } else if (relation.hasOwnProperty("place_relationship_id")) {
            var amp_id = relation.place_relationship_id;
          } else {
            var amp_id = relation.amp_id;
          }
          var load = true;
          try {
            var source = relation.source;
            var _source = amp_id.includes("org_event")
              ? "org_" + source[0].id
              : "person_" + source[0].id;
          } catch (err) {
            console.log(err);
            load = false;
          }
          try {
            var target = relation.target;
            var _target = amp_id.includes("org_event")
              ? "event_" + target[0].id
              : amp_id.includes("relationship_place")
              ? "place_" + target[0].id
              : amp_id.includes("person_event")
              ? "event_" + target[0].id
              : amp_id.includes("person_org")
              ? "org_" + target[0].id
              : "event_" + target[0].id;
          } catch (err) {
            console.log(err);
            load = false;
          }
          try {
            var relation_type = relation.relation_type_object;
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
              type: amp_id.includes("org_event")
                ? "Event"
                : amp_id.includes("relationship_place")
                ? "Place"
                : amp_id.includes("person_event")
                ? "Event"
                : amp_id.includes("person_org")
                ? "Organization"
                : "Person",
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
            types.nodes["Organization"] = {
              id: "Organization",
              label: "Organizations",
              color: "#7f8c8d",
            };
            types.nodes["Place"] = {
              id: "Place",
              label: "Place",
              color: "lightblue",
            };
            types.nodes["Event"] = {
              id: "Event",
              label: "Event",
              color: "lightgreen",
            };
          }
        });
      } else {
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
              type: second ? "Organization" : "Person",
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
              types.nodes["Organization"] = {
                id: "Organization",
                label: "Organizations",
                color: "#7f8c8d",
              };
            }
          }
          // console.log(edges, nodes, types);
        });
      }

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
          onNodeClick: (node, graph, forceGraph) => {
            console.log(node, graph, forceGraph);
          },
          showDirectionality: false,
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
networkVisualization(merged, "container-network-merged", false, true);
