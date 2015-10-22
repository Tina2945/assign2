//You should implement your assign2 here.

boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;
PImage bg1;
PImage bg2;
PImage start1;
PImage start2;
PImage end1;
PImage end2;
PImage fighter;
PImage enemy;
PImage hp;
PImage treasure;
int b=0;
int t=0;
int fx=500;
int fy=0;
int ex=0;
int  ey=0;
int hx=40;

  int GAME;
  final int GAME_START=0;
  final int GAME_RUN=1;
  final int GAME_OVER=2;
   int tx=floor(random(0,620));
    int ty=floor(random(0,450));
void setup () {
  size(640, 480) ;
  bg1=loadImage("img2/bg1.png");
  bg2=loadImage("img2/bg2.png");
  enemy=loadImage("img2/enemy.png");
  hp=loadImage("img2/hp.png");
  fighter= loadImage("img2/fighter.png");
  treasure=loadImage("img2/treasure.png");
  start1=loadImage("img2/start1.png");
  start2=loadImage("img2/start2.png");
  end1=loadImage("img2/end1.png");
  end2=loadImage("img2/end2.png");
  
}

void draw() {
 background(0);
  image(bg1,b,0);
  image(bg2,t-640,0);
     b=b+5;
     t=t+5;
   if(b>=640){
     b=-640;}
     if(t>=1280){
       t=0;}
  switch(GAME){
    case GAME_START:
    image(start2,0,0);
    if((mouseX>=220&&mouseX<=420)&& (mouseY>=350&&mouseY<=420)){
      image(start1,0,0);
      if(mousePressed){
        GAME=GAME_RUN;
      }
    }
    break;
    case GAME_RUN:
   
     image(enemy,ex,ey);
     ex=ex+3;
     ex%=640;
     if(ex==0){
       ey=floor(random(400));
     }
     if(ey>=fy){
       ey=ey-3;
     }
     if(ey<=fy){
       ey=ey+3;
     }
    image(fighter,fx,fy);
    fill(247,7,7);
    rect(10,10,hx,10);
    image(hp,1,1);
    image(treasure,tx,ty);
   
  if(upPressed){
    fy=fy-5;
    
    if(fy<=0){
      fy=0;
    }
  }
  if(downPressed){
    fy=fy+5;
    
    if(fy>=430){
      fy=430;
    }
  }
  if(leftPressed){
    
    fx=fx-5;
    
    if(fx<=0){
      fx=0;
    }
  }
  if(rightPressed){
    fx=fx+5;
    
    if(fx>=590){
      fx=590;
    }
  }
  if((fx<=ex+20&&fx>=ex-20)&&(fy<=ey+20&&fy>=ey-20)){
    hx=hx-40;;
    ex=0;
    ey=floor(random(400));
    if(hx<=0){
      GAME=GAME_OVER;
      hx=40;
      fx=500;
    }
  }
  
  if((fx<=tx+20&&fx>=tx-20)&&(fy<=ty+20&&fy>=ty-20)){
    hx=hx+20;
    tx=floor(random(600));
    ty=floor(random(400));
    if(hx>=200){
      hx=200;
    }
  }
  break;
  case GAME_OVER:
  image(end2,0,0);
  if((mouseX>=220&&mouseX<=420)&& (mouseY>=290&&mouseY<=350)){
      image(end1,0,0);
      if(mousePressed){
        GAME=GAME_START;
      }
  break;
  }
  }
}
void keyPressed(){
if(key==CODED){
  switch (keyCode){
    case UP:
    upPressed = true;
    break;
     case DOWN:
    downPressed = true;
    break;
     case LEFT:
    leftPressed = true;
    break;
     case RIGHT:
    rightPressed = true;
    break;
  }
}
}
void keyReleased(){
if(key==CODED){
  switch (keyCode){
    case UP:
    upPressed = false;
    break;
     case DOWN:
    downPressed = false;
    break;
     case LEFT:
    leftPressed = false;
    break;
     case RIGHT:
    rightPressed = false;
    break;
  }
}
}
