int branch_length = 90;
float proportion = 0.8;
float left_angle = PI / 9;
float right_angle = PI / 7;
float start_angle = PI / 2;
int start_x = window.innerWidth / 2;
int start_y = window.innerHeight / 2 + window.innerHeight / 4;

ArrayList branches;

class Branch {
	int x, y;
	float angle;
	Branch(int x, int y, float angle) {
		this.x = x;
		this.y = y;
		this.angle = angle;
	}
}

void setup() {
	size(screen.width, screen.height);
	background(255, 124, 191);
	stroke(204, 255, 0);
	smooth();
	frameRate(20);

	branches = new ArrayList();
	branches.add(new Branch(start_x, start_y, start_angle));
}

void draw() {
	if(branch_length < 7) {
		return;
	}
	float angle;
	int branches_count = branches.size();
	for(int p = 0; p < branches_count; p++) {
		Branch br = (Branch)branches.get(0);
		branches.remove(0);

		angle = br.angle + left_angle;
		Branch left_branch = new Branch(round(br.x + branch_length * cos(angle)),
			round(br.y - branch_length * sin(angle)), angle);
		line(br.x, br.y, left_branch.x, left_branch.y);

		angle = br.angle - right_angle;
		Branch right_branch = new Branch(round(br.x + branch_length * cos(angle)),
			round(br.y - branch_length * sin(angle)), angle);
		line(br.x, br.y, right_branch.x, right_branch.y);

		branches.add(left_branch);
		branches.add(right_branch);
	}
	branch_length *= proportion;
}
