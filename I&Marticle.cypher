// Sample Cypher code a publication
// Author: Richard T. Watson <rwatson@terry.uga.edu>
// May 2020

// Create each element with a property of elementName and elementType

CREATE (:Element {elementName: 'Anti-Goal', elementType: 'Process'});
CREATE (:Element {elementName: 'Threat appraisal', elementType: 'Process'});
CREATE (:Element {elementName: 'Coping appraisal', elementType: 'Process'})
CREATE (:Element {elementName: 'Emotion-focused coping', elementType: 'Process'});
CREATE (:Element {elementName: 'Problem-focused coping', elementType: 'Process'});
CREATE (:Element {elementName: 'Impact on the environment', elementType: 'Process'});
CREATE (:Element {elementName: 'Emergence of malicious IT', elementType: 'Process'});
// Create an index to speed up searching on an element's name

//Create a publication with properties for DOI (document object identifier) and the citation.
// When implemented, the DOI API (https://support.datacite.org/docs/api-get-doi) would be used populate properties discretely, such as journal title
CREATE (:Publication {DOI: '10.1016/j.infoandorg.2017.06.002'});

// Create a graph for each model in the publication
CREATE (:Graph {graphTitle: 'Process Model of Technology Threat Avoidance'});

// Create a relationships between a publication and graphs it contains
MATCH (p:Publication {DOI: '10.17705/1jais.00560'}),(g:Graph)
WHERE g.graphTitle IN ['Process Model of Technology Threat Avoidance']
CREATE (p)-[r:CONTAINS]->(g)
RETURN r;

// Create the relationships between the elements for the 'Research model'
MATCH (a:Element {elementName: 'Anti-Goal'}),(b:Element {elementName: 'Threat appraisal'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Threat appraisal'}),(b:Element {elementName: 'Coping appraisal'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Coping appraisal'}),(b:Element {elementName: 'Emotion-focused coping'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Coping appraisal'}),(b:Element {elementName: 'Problem-focused coping'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Emotion-focused coping'}),(b:Element {elementName: 'Threat appraisal'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Problem-focused coping'}),(b:Element {elementName: 'Impact on the environment'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Emergence of malicious IT'}),(b:Element {elementName: 'Impact on the environment'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;
MATCH (a:Element {elementName:  'Impact on the environment'}),(b:Element {elementName: 'Threat appraisal'})
CREATE (a)-[r:RELATES_TO {type: 'process', model: 'Process Model of Technology Threat Avoidance'}]->(b)
RETURN r;

// Create the authors
CREATE (:Author {ORCID: '0000-0002-0350-9115'});
CREATE (:Author {ORCID: '0000-0002-1946-3457'});

// Create the relationships between the authors and publication with authorOrder as a property of the relationship
MATCH (p:Publication {DOI: '10.17705/1jais.00560'}), (a:Author {ORCID: '0000-0002-1946-3457'})
CREATE (p)-[r:WRITTEN_BY {authorOrder: 1}]->(a)
RETURN r;
MATCH (p:Publication {DOI: '10.17705/1jais.00560'}), (a:Author {ORCID: '0000-0002-0350-9115'})
CREATE (p)-[r:WRITTEN_BY {authorOrder: 2}]->(a)
RETURN r;
