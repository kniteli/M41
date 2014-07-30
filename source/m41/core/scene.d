module m41.core.scene;

import m41.game.generation.galaxy;
import m41.graphics.geometry.mesh;
import m41.utility;
import gl3n.linalg;
class Scene {

public static:

	float[] generateGalaxyMesh(Galaxy galaxy) {
		float[] ret;

		int i;
		foreach(star; galaxy.stars) {
			float star_scale = 1f/50f;
			auto tmp = voxel.buildVoxel(star.pos, star_scale);
			ret ~= tmp;
		}
		return ret;
	}
}

struct voxel {
	static const float size = 1.0f;
	static const float face_offset = size/2;
	//the vertices are built front face first (clockwise)
	//then back face (also clockwise from the front perspective)
	static const vec4[8] vertices = [
		vec4(-face_offset, face_offset, -face_offset, 1.0f), //top front left 	0
		vec4(face_offset, face_offset, -face_offset, 1.0f), //top front right		1
		vec4(face_offset, -face_offset, -face_offset, 1.0f), //bottom front right	2
		vec4(-face_offset, -face_offset, -face_offset, 1.0f), //bottom front left	3
		vec4(-face_offset, face_offset, face_offset, 1.0f), //top back left		4
		vec4(face_offset, face_offset, face_offset, 1.0f), //top back right		5
		vec4(face_offset, -face_offset, face_offset, 1.0f), //bottom back right	6
		vec4(-face_offset, -face_offset, face_offset, 1.0f), //bottom back left	7
	];

	static const vec2[4] uv_coords = [
		vec2(0.0, 1.0), //top left 						0
		vec2(1.0, 1.0), //top right 				1
		vec2(0.0, 0.0), //bottom left	3
		vec2(1.0, 0.0), //bottom right	2
	];

	static float[] buildVoxel(vec4 pos, float target_size) {
		float[] ret;
		auto clip_space_pos = pos;
		float scale_factor = target_size / size;
		auto v0 = voxel.vertices[0]*scale_factor + clip_space_pos;
		auto v1 = voxel.vertices[1]*scale_factor + clip_space_pos;
		auto v2 = voxel.vertices[2]*scale_factor + clip_space_pos;
		auto v3 = voxel.vertices[3]*scale_factor + clip_space_pos;
		auto v4 = voxel.vertices[4]*scale_factor + clip_space_pos;
		auto v5 = voxel.vertices[5]*scale_factor + clip_space_pos;
		auto v6 = voxel.vertices[6]*scale_factor + clip_space_pos;
		auto v7 = voxel.vertices[7]*scale_factor + clip_space_pos;
		//back face
		ret ~= v5.vector;
		ret ~= v4.vector;
		ret ~= v7.vector;
		ret ~= v7.vector;
		ret ~= v6.vector;
		ret ~= v5.vector;
		//left face
		ret ~= v1.vector;
		ret ~= v5.vector;
		ret ~= v6.vector;
		ret ~= v6.vector;
		ret ~= v2.vector;
		ret ~= v1.vector;
		//right face
		ret ~= v4.vector;
		ret ~= v0.vector;
		ret ~= v3.vector;
		ret ~= v3.vector;
		ret ~= v7.vector;
		ret ~= v4.vector;
		//top face
		ret ~= v4.vector;
		ret ~= v5.vector;
		ret ~= v1.vector;
		ret ~= v1.vector;
		ret ~= v0.vector;
		ret ~= v4.vector;
		//bottom face
		ret ~= v3.vector;
		ret ~= v2.vector;
		ret ~= v6.vector;
		ret ~= v6.vector;
		ret ~= v7.vector;
		ret ~= v3.vector;
		//front face
		ret ~= v0.vector;
		ret ~= v1.vector;
		ret ~= v2.vector;
		ret ~= v2.vector;
		ret ~= v3.vector;
		ret ~= v0.vector;

		return ret;
	}
}