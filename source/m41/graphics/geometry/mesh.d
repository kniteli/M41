module m41.graphics.geometry.mesh;

import gl3n.linalg, std.container;

class Mesh {

public:
	Array!(float) vertices;
	float[] normals;
	float[] colors;
}