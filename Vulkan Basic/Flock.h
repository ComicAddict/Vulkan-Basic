#pragma once
#ifndef FLOCK_H
#define FLOCK_H

#include <glm/glm.hpp>
#define GLM_FORCE_RADIANS
#define GLM_FORCE_DEPTH_ZERO_TO_ONE

#include <vector>

const int INSTANCE_NUMBER = 200;

struct FlockMember {
	int type;
	glm::vec3 pos;
	glm::vec3 vel;

};

class Flock {
public:
	void addMoth();
	void addFirefly();
	void updateFlock();
	std::vector<glm::vec3> calculateAcc();

	std::vector<FlockMember> fireflies;
	std::vector<FlockMember> moths;
};
#endif // !FLOCK_H
