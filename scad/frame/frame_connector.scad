$fn = 100;

radius = 15;
length = 90;
connector_margin = 3;

module frame_connector(radius, length, connector_margin) {
    connector_size = radius - 2*connector_margin;
    translate([connector_margin, connector_margin, 0])
    polyhedron(
        points=[[0,0,0], [0,connector_size,0], [0,connector_size,length], [0,0,length], [connector_size,0,0], [connector_size,0,length]],
        faces=[[0,1,2,3],[5,4,3,2],[0,4,5,1],[0,3,4],[5,2,1]]
    );
}

frame_connector(
    radius = radius,
    length = length,
    connector_margin = connector_margin
);
