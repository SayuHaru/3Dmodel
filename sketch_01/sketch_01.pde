float eyeX;
float eyeY;
float eyeZ;
int i;
String lines[];
String words[];
FloatList x = new FloatList();
FloatList y = new FloatList();
FloatList z = new FloatList();
FloatList red = new FloatList();
FloatList green = new FloatList();
FloatList bule = new FloatList();
float Max_x ;
float Max_y ;
float Max_z ;
float Min_x ;
float Min_y ;
float Min_z ;
float Mid_x = 0;
float Mid_y = 0;
float Mid_z = 0;

void setup() {  
  size(900, 900, P3D);
  lines = loadStrings("ex.txt");
  for (i=0; i<lines.length; i++) {
    words = lines[i].split(",", 0);
    x.append(float(words[0]));
    y.append(float(words[1]));
    z.append(float(words[2]));
    red.append(float(words[3]));
    green.append(float(words[4]));
    bule.append(float(words[5]));
    if (i==0) {
      Max_x = float(words[0]);
      Max_y = float(words[1]);
      Max_z = float(words[2]);
      Min_x = float(words[0]);
      Min_y = float(words[1]);
      Min_z = float(words[2]);
    }
    if (Max_x < float(words[0])) {
      Max_x = float(words[0]);
    }
    if (Max_y < float(words[1])) {
      Max_y = float(words[1]);
    }
    if (Max_z < float(words[2])) {
      Max_z = float(words[2]);
    }

    if (Min_x > float(words[0])) {
      Min_x = float(words[0]);
    }
    if (Min_y > float(words[1])) {
      Min_y = float(words[1]);
    }
    if (Min_z > float(words[2])) {
      Min_z = float(words[2]);
    }
  }

  Mid_x = ( Max_x + Min_x)/2;
  Mid_y = ( Max_y + Min_y)/2;
  Mid_z = ( Max_z + Min_z)/2;
  eyeX = Mid_x;
  eyeY = Mid_y;
  eyeZ = Mid_z;
}

void draw() {
  background(255);
  for (int i=0; i<lines.length; i++) {
    stroke(red.get(i), green.get(i), bule.get(i));
    point(x.get(i)*(-1), y.get(i), z.get(i));
  }
  
  if (keyPressed) {
    switch(key) {
    case 'a':
      eyeX -= 3.0;
      break;
    case 'd':
      eyeX += 3.0;
      break;
    case 'w':
      eyeY -= 3.0;
      break;
    case 'x':
      eyeY += 3.0; 
      break;
    }
    if (keyCode == UP) {
      eyeZ -= 3.0;
    } else if (keyCode == DOWN) {
      eyeZ += 3.0;
    }
  } 
  camera(eyeX, eyeY-1000, eyeZ, Mid_x, Mid_y, Mid_z-1, 0, -1, 0);
}
