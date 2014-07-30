module m41.game.generation.galaxy;

import noise.noise;
import m41.game.generation.models.depthcylinder;
import noise.mod.modulebase;
import m41.utility;
import gl3n.linalg, gl3n.interpolate, gl3n.math;
import std.random;

class GalaxyGenerator {

private static:
	const int star_count = 500000;
	enum PARSECS_WIDTH = 128;
	enum PARSECS_HEIGHT = 128;
	enum PARSECS_DEPTH = 16;
	float[PARSECS_DEPTH][PARSECS_HEIGHT][PARSECS_WIDTH] density_map;
	//static const int core_radius = 100;
	//static const int spiral_radius = 1000;
	//static const int spiral_arms = 2;
	static Mod generator;

public static:
	final Galaxy generate(int seed = 1) {
		Galaxy output = new Galaxy;
		auto rng = Random(seed);
		float min = 0;
		float max = 0;
		float total = 0;
		//get output density map from noise functions and spread the stars
		//around based on suggested densities.
		
		float falloff( float xsq ) { 
			xsq = 1.0 - xsq; return xsq*xsq*xsq; 
		}			

		float distance_from_center(float x, float y, float z) {
			return sqrt(pow(x, 2) + pow(y, 2) + pow(z, 2));
		}

		float distance_from_axis(float x, float y) {
			return sqrt(pow(x, 2) + pow(y, 2));			
		}

		float max_x = cast(float)PARSECS_WIDTH/2;
		float max_y = cast(float)PARSECS_HEIGHT/2;
		float max_z = cast(float)PARSECS_DEPTH/2;

		float radius_max = distance_from_center(cast(float)PARSECS_WIDTH/2, cast(float)PARSECS_HEIGHT/2, cast(float)PARSECS_DEPTH/2);

		foreach( x; 0..PARSECS_WIDTH) {
		foreach( y; 0..PARSECS_HEIGHT){
		foreach( z; 0..PARSECS_DEPTH) {
			auto input_x = x-cast(float)PARSECS_WIDTH/2;
			auto input_y = y-cast(float)PARSECS_HEIGHT/2;
			auto input_z = z-cast(float)PARSECS_DEPTH/2;
			float radius2 = distance_from_center((input_x+0.001)/2.2, (input_y+0.1)*2.2, (input_z+0.1)*2.2);
			float radius = distance_from_center(input_x, input_y, input_z);
			density_map[x][y][z] = generator.GetValue(input_x, input_y, input_z);
			density_map[x][y][z] = pow((1.0-cos(lerp(density_map[x][y][z]*1.3f, 0f, radius/radius_max))), gl3n.math.abs(radius2)/radius_max*4);

			if(density_map[x][y][z] <= min) {
				min = density_map[x][y][z];
			}

			if(density_map[x][y][z] >= max) {
				max = density_map[x][y][z];
			}
		}}}
		foreach( x; 0..PARSECS_WIDTH) {
		foreach( y; 0..PARSECS_HEIGHT){
		foreach( z; 0..PARSECS_DEPTH) {
			auto input_x = x-cast(float)PARSECS_WIDTH/2;
			auto input_y = y-cast(float)PARSECS_HEIGHT/2;
			auto input_z = z-cast(float)PARSECS_DEPTH/2;
			density_map[x][y][z] = normalize(density_map[x][y][z], min, max);
			//float radius = sqrt(pow(input_y, 2) + pow(input_x, 2) + pow(input_z, 2));
			//density_map[x][y][z] = lerp(0.1f, 0.0f, radius/radius_max);
			total += density_map[x][y][z];
		}}}

		//auto matrotated = mat4.zrotation(190*PI_180);
		auto max_degree = 960*PI_180;
		//randomly place stars in a given parsec
		foreach( x; 0..PARSECS_WIDTH) {
		foreach( y; 0..PARSECS_HEIGHT){
		foreach( z; 0..PARSECS_DEPTH) {
			auto star_x = x-cast(float)PARSECS_WIDTH/2;
			auto star_y = y-cast(float)PARSECS_HEIGHT/2;
			auto star_z = z-cast(float)PARSECS_DEPTH/2;
			auto parsec_star_count = cast(int)lrint((star_count/total)*density_map[x][y][z]);
			foreach(star; 0..parsec_star_count) {
				auto x_rand = uniform(-0.5f, 0.5f, rng);
				auto y_rand = uniform(-0.5f, 0.5f, rng);
				auto z_rand = uniform(-0.5f, 0.5f, rng);
				Star t;
				t.pos = vec4(star_x+x_rand, star_y+y_rand, star_z+z_rand, 1.0f);
				auto mag = t.pos.magnitude();
				auto matrotated = mat4.zrotation(max_degree*(mag/radius_max));
				//auto temp_vec = t.pos*matrotated;
				//temp_vec.normalize();
				//auto temp_vec2 = t.pos.normalized();
				//auto result_vec = slerp(temp_vec2, temp_vec, mag/radius_max);
				//result_vec *= mag;
				//t.pos = result_vec;
				t.pos = t.pos*matrotated;
				output.stars ~= t;
			}
		}}}
		logDebug(output.stars.length);
		return output;
	}

	final float normalize(float input, float min, float max) {
		return (input - min)/(max-min);
	}

	final void init() {
		auto simplex = new Simplex();
		simplex.SetFrequency(0.5);
		simplex.SetOctaveCount(3);
		//simplex.SetPersistence(0.1);
		auto scale = new ScaleBias();
		scale.SetScale(0.01);
		scale.SetSourceMod(0, &simplex);
		auto rotate = new RotatePoint();
		rotate.SetSourceMod(0, &simplex);
		generator = simplex;
	}
}

class Galaxy {

	Star[] stars;
}

struct Star {

	vec4 pos;
}