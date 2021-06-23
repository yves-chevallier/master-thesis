const int MAXNUMBERTRAPS = 20; 

uniform float SX[MAXNUMBERTRAPS]; 
uniform float SY[MAXNUMBERTRAPS]; 
uniform int AC[MAXNUMBERTRAPS]; 
uniform float W, H;

const   float pi = 3.141592654; 
float Real = 0.0; float Imag = 0.0; 

float quickATan2(float y, float x) {
	float coeff_1 = pi / 4.0;
	float coeff_2 = 3.0 * coeff_1;
	float abs_y = abs(y);
	float angle;
	if (x >= 0.0) {
		float r = (x - abs_y) / (x + abs_y);
		angle = coeff_1 - coeff_1 * r;
	} 
	else {
		float r = (x + abs_y) / (abs_y - x);
		angle = coeff_2 - coeff_1 * r;
	}
	return y < 0.0 ? -angle : angle;
}

void main(void) { 
	for(int i = 0; i<MAXNUMBERTRAPS; i++) {
		if(AC[i] > 0) {
			float dx = SX[i];
			float dy = SY[i]; 

			float xj = (float(gl_FragCoord.x)-(W/2.0))/W;
			float yj = (float(gl_FragCoord.y)-(H/2.0))/H;

			float p = 2.0*pi*(xj*dx + yj*dy);

			Real += cos(p);
			Imag += sin(p);
		}
	}
	float W = quickATan2(Imag, Real);   

	float FinalTableIndex = (W+pi)/(2.0*pi);
	gl_FragColor.rgb = vec3( FinalTableIndex );
}
