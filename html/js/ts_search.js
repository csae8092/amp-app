const typesenseInstantsearchAdapter = new TypesenseInstantSearchAdapter({
    server: {
        apiKey: 'ItDIbHdyx8VIgjYJjmO23EhFh2f6lUXJ', // Be sure to use an API key that only allows searches, in production
        nodes: [
            {
                host: 'typesense.acdh-dev.oeaw.ac.at',
                port: '443',
                protocol: 'https'
            }
        ]
    },
    // The following parameters are directly passed to Typesense's search API endpoint.
    //  So you can pass any parameters supported by the search endpoint below.
    //  queryBy is required.
    //  filterBy is managed and overridden by InstantSearch.js. To set it, you want to use one of the filter widgets like refinementList or use the `configure` widget.
    additionalSearchParameters: {
        queryBy: 'full_text'
    }
});

const searchClient = typesenseInstantsearchAdapter.searchClient;
const search = instantsearch({
    searchClient,
    indexName: 'amp'
});

search.addWidgets([

    instantsearch.widgets.searchBox({
        container: '#searchbox',
        autofocus: true,
        cssClasses: {
          form: 'form-inline',
          input: 'form-control col-md-11',
          submit: 'btn',
          reset: 'btn'
        }
    }),

    instantsearch.widgets.configure({
        hitsPerPage: 8
    }),

    instantsearch.widgets.hits({
        container: '#hits',
        templates: {
            empty: 'Keine Ergebnisse',
            item: 
                `
                    <h4><a href="{{ id }}.html">{{ title }}</a></h4>
                    <p style="overflow:hidden;max-height:210px;">{{#helpers.snippet}}{ "attribute": "full_text" }{{/helpers.snippet}}</p>
                    <h5><span class="badge badge-primary">{{ project }}</span></h5>
                    <div>
                        <div>
                            {{#persons}}
                            <span class="badge badge-secondary">{{ . }}</span>
                            {{/persons}}
                        </div>
                        <div>
                            {{#works}}
                            <span class="badge badge-success">{{ . }}</span>
                            {{/works}}
                        </div>
                        <div>
                            {{#places}}
                            <span class="badge badge-info">{{ . }}</span>
                            {{/places}}
                        </div>
                        <div>
                            {{#orgs}}
                            <span class="badge badge-info">{{ . }}</span>
                            {{/orgs}}
                        </div>
                    </div>
                `
            }
        }
    ),

    instantsearch.widgets.pagination({
        container: '#pagination'
    }),

    instantsearch.widgets.stats({
        container: '#stats-container',
        templates: {
          text: `
            {{#areHitsSorted}}
              {{#hasNoSortedResults}}no hits{{/hasNoSortedResults}}
              {{#hasOneSortedResults}}1 hit{{/hasOneSortedResults}}
              {{#hasManySortedResults}}{{#helpers.formatNumber}}{{nbSortedHits}}{{/helpers.formatNumber}} hits {{/hasManySortedResults}}
              aus {{#helpers.formatNumber}}{{nbHits}}{{/helpers.formatNumber}}
            {{/areHitsSorted}}
            {{^areHitsSorted}}
              {{#hasNoResults}}no hits{{/hasNoResults}}
              {{#hasOneResult}}1 hit{{/hasOneResult}}
              {{#hasManyResults}}{{#helpers.formatNumber}}{{nbHits}}{{/helpers.formatNumber}} hits{{/hasManyResults}}
            {{/areHitsSorted}}
            found in {{processingTimeMS}}ms
          `,
        }
    }),

    instantsearch.widgets.refinementList({
        container: '#refinement-list-places',
        attribute: 'places',
        searchable: true,
        searchablePlaceholder: 'Search',
        cssClasses: {
            searchableInput: 'form-control form-control-sm mb-2 border-light-2',
            searchableSubmit: 'd-none',
            searchableReset: 'd-none',
            showMore: 'btn btn-secondary btn-sm align-content-center',
            list: 'list-unstyled',
            count: 'badge ml-2 badge-info',
            label: 'd-flex align-items-center text-capitalize',
            checkbox: 'mr-2',
        }
    }),

    instantsearch.widgets.refinementList({
        container: '#refinement-list-persons',
        attribute: 'persons',
        searchable: true,
        searchablePlaceholder: 'Search',
        cssClasses: {
            searchableInput: 'form-control form-control-sm mb-2 border-light-2',
            searchableSubmit: 'd-none',
            searchableReset: 'd-none',
            showMore: 'btn btn-secondary btn-sm align-content-center',
            list: 'list-unstyled',
            count: 'badge ml-2 badge-secondary',
            label: 'd-flex align-items-center text-capitalize',
            checkbox: 'mr-2',
        }
    }),

    instantsearch.widgets.refinementList({
        container: '#refinement-list-works',
        attribute: 'works',
        searchable: true,
        searchablePlaceholder: 'Search',
        cssClasses: {
            searchableInput: 'form-control form-control-sm mb-2 border-light-2',
            searchableSubmit: 'd-none',
            searchableReset: 'd-none',
            showMore: 'btn btn-secondary btn-sm align-content-center',
            list: 'list-unstyled',
            count: 'badge ml-2 badge-success',
            label: 'd-flex align-items-center text-capitalize',
            checkbox: 'mr-2',
        }
    }),

    instantsearch.widgets.refinementList({
        container: '#refinement-list-orgs',
        attribute: 'orgs',
        searchable: true,
        searchablePlaceholder: 'Search',
        cssClasses: {
            searchableInput: 'form-control form-control-sm mb-2 border-light-2',
            searchableSubmit: 'd-none',
            searchableReset: 'd-none',
            showMore: 'btn btn-secondary btn-sm align-content-center',
            list: 'list-unstyled',
            count: 'badge ml-2 badge-success',
            label: 'd-flex align-items-center text-capitalize',
            checkbox: 'mr-2',
        }
    }),
    
    instantsearch.widgets.rangeInput({
        container: "#range-input",
        attribute: "year",
        templates: {
            separatorText: 'to',
            submitText: 'Search',
        },
        cssClasses: {
            form: 'form-inline',
            input: 'form-control',
            submit: 'btn'
        }
    }),

    instantsearch.widgets.pagination({
        container: '#pagination',
        padding: 2,
        cssClasses: {
            list: 'pagination',
            item: 'page-item',
            link: 'page-link'
        }
    }),

    instantsearch.widgets.clearRefinements({
        container: '#clear-refinements',
        templates: {
            resetLabel: 'reset filters',
        },
        cssClasses: {
            button: 'btn'
        }
    }),

    instantsearch.widgets.currentRefinements({
        container: '#current-refinements',
        cssClasses: {
            delete: 'btn',
            label: 'badge'
        }
    })
]);

search.addWidgets([
    instantsearch.widgets.configure({
        attributesToSnippet: ['full_text'],
    })
]);

search.start();