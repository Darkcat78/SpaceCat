

import ddf.minim.*;

 
 
 
 Minim minim;
AudioPlayer coco;
AudioPlayer bag;
AudioPlayer geo;
AudioSample squish;
AudioSample explo1;
AudioSample exploboss;
int cococpt=-1; // choix du thème
int bosslife = 100;//vie du boss
int  yb;//coordonées du boss
int cptboss=0; //compteur de boss
float xb,xbo;//pareil
int lvl=1,cptlvl;// niveau actuel et competeur pour changer de niveau
int menu=0;
float ly=0; //ordonée du texte level
int sc=0;
int cptv; //le nombre de tacos d'affilé
float xm; // abscisse du missile
int vie; //nombre de vies
float t=1; //vitesse des objet qui tombent
float x=70;//abcsisse du chat
 float o=2; //vitesse de la balle
 int ym=500;//ordonée du missile
 float y=500;//ordonée du chat
 int best=10;
 int p=1; //vitesse de la ligne de triangles
 float rx=random(350);
 int ry=-10;
 int n=0; // compteur pour la ligne
 float bx=random(350);
 int by=10;
  int score=0;
 int i;
 int dx = 1;
 int dy = 1;
 int dz = 1;
 int yl=0;
 int ylife=15; //ordonée des coeurs
 int r=200;
 float v=1;
 int b=200;
 float []tabx= new float[200];
float [] taby= new float[200] ;

float []tabxb= new float[100];
float [] tabyb= new float[100] ;

PImage island, background,cat,bombe,life,taco,asteroide,trump,gameover,missile,pizza,menui,boss, option; // déclaration des images

void option(){
   if (key == 'o'){
      if (keyPressed == true){
        image(option,0,0,350,550);
        taby[i]=taby[i]-t;
        tabyb[i]=tabyb[i]-t;
      }
    }
}
void menu(){
  if(menu==0){
     bag.play();
    image(menui,0,0,width,height);
    
   
    option();
   
    
 
 // image(trump,100,300,150,150);
   }
}
void level(){
 
 if ((score % 20)==0 && score>0){
    t=1.5;
   String l3="LEVEL "+ cptlvl;
    fill(255,255,255);
   textSize(60);
   text(l3,70,ly);
   ly=ly+1.5;
   // vitesse de descente du level
   if(ly>=500){
     ly=0;
     score=score+1;
     cptlvl=cptlvl+1;
     
 
 }
 }
}
void boss(){
 
 if(bosslife>0){
  if(xb>=300){
    v=-1;
  }
  if(xb<=50){
   v=1; 
  }
  xb=xb+v;
  
 image(boss,xb,yb,100,100);
 fill(0,255,255);
 rect(xb-50,yb-70,bosslife,yb-90);
 if(dist(xm,ym,xb,yb+20)<100){
   bosslife=bosslife-25;
   ym=0;
   exploboss.trigger();
    
   }
 }
   else{
     cptlvl=cptlvl+1;
     bosslife=100 +(25*cptlvl);
     cptboss=0;
   }
 
}
void coconut(){
  if(key=='w'){
    if(keyPressed == true){
     
      cococpt=2;
    }
  }
   
    if(key=='x'){
    if(keyPressed == true){
     cococpt= -2;
    }
    }
   
  
}


void jeu(){
   if(cococpt>= 1){
    background(island);
    
      fill(255,255,255);
  line(25,500,320,500);
  image(cat,x-25,y-25,50,50);
      bag.close();
     geo.close();
     coco.play();
    }
 if(cococpt<=-1){
    background(background);
    
      fill(255,255,255);
  line(25,500,320,500);
  image(cat,x-25,y-25,50,50);
 
    }
 
  

 
   coconut();
  level();
  if (cptlvl % 2 == 0) {
    cptboss=1;
   boss();
 }
for( int i=0; i < tabx.length ; i=i+1){
  option();
  if(cptboss==1){
   taby[i]=taby[i]-t; 
  }
  
    
  if (ly>0 && ly<=500){
   tabx[i]=random(350);
   taby[i]=random(-50000,-50);
  }
  
     if(vie<=0){
       taby[i]=600;
         image(gameover,15,105,320,240);
       
     }
     
     
   if(score>=0 && score<=14){
     if ( taby[i]>=-30 && taby[i]<=550){
     o=2;
   image(taco,tabx[i]-25,taby[i]-25,50,50);
   }
   t=1.5;
   }
   
   if(score>=15 && score<=29){ //LEVEL 1.2
   if ( taby[i]>=-30 && taby[i]<=550){
     
    image(taco,tabx[i]-15,taby[i]-15,30,30);
  }
   o=2;
    t=1.5;
 }
 
 
 if(score>=30 && score<=59){
    if ( taby[i]>=-30 && taby[i]<=550){
  image(pizza,tabx[i]-50,taby[i]-10,100,100);
    }
   t=1.5;
    o=2;
    
 }
 
 if(score>=60 && score<=90){
    if ( taby[i]>=-30 && taby[i]<=550){

   image(taco,tabx[i]-10,taby[i]-10,20,20);
    }
   t=2;
   o=3;
 }
   
   if(dist(x,y,tabx[i],taby[i])<45){
     taby[i]=600;
     squish.trigger();
     score=score+1;
     
     n=n+1;
     cptv=cptv+1;
   }
     
   taby[i]=taby[i]+t;
   
   
 }
 
if(cptv>=5){
  vie=vie+1;
  cptv=0;
}
   if(score>=30){
     bag.close();
     geo.play();
   }
 
     for( int i=0; i < tabxb.length ; i=i+1){
       option();
  if(vie<=0){
       tabyb[i]=600;
       image(gameover,15,105,320,240);
       
     }
 
   if(score>=0 && score<=14){
     if ( tabyb[i]>=-30 && tabyb[i]<=550){
  
   image(bombe,tabxb[i]-25,tabyb[i]-25,50,50);
     }
 }
   
   if(score>=15 && score<=29){
     if ( tabyb[i]>=-30 && tabyb[i]<=550){
       image(bombe,tabxb[i]-15,tabyb[i]-15,30,30);
     }
     p=2;
 }
 if(score>=30 && score<=59){
    if ( tabyb[i]>=-30 && tabyb[i]<=550){
      image(bombe,tabxb[i]-10,tabyb[i]-10,20,20);
    }
   t=1.5;
   p=3;
   
 
 }
 if(score>=60 && score<=90){
   if ( tabyb[i]>=-30 && tabyb[i]<=550){
     image(bombe,tabxb[i]-5,tabyb[i]-5,10,10);
   }
   p=4;
    
  
 }
   
   if(dist(x,y,tabxb[i],tabyb[i])<40){
     tabyb[i]=600;
     cptv=0;
     vie=vie-1;
     
   }
   if(dist(x,ym,tabxb[i],tabyb[i])<25){
     tabyb[i]=600;
     explo1.trigger();
     cptv=cptv+1;
     ym=500;
     
     
     
   }
   
   tabyb[i]=tabyb[i]+t;
 }
 
 
  if(score>=10){
     ligne();
      }
      
 if (n>=10){
   yl=0;
   n=0;
 }
 
 if (key == ' ') {
   if(keyPressed ==true){
      xm=x-25;
     ym=ym-1;
   }
 }
 
missile();
 
if (key=='c'){  // fonction triche
 if( keyPressed== true){
   sc=1;
 }
}
if(sc==1){
  score=score+1;
  sc=0;
}
  
  
   vie();
 
 
     
     Deplacement();
    
 if(x>=320){
       x=320;
     }
     if(x<=25){
       x=25;
      
    }
    
      textSize(40);
    fill( 255, 255, 255);
  text(score, 160, 90);
 option();
  
  
}

void ligne(){
   
    fill(255,255,200);
    image(asteroide,0,yl,30,30);
    image(asteroide,31,yl,30,30);
    image(asteroide,62,yl,30,30);
    image(asteroide,93,yl,30,30);
    image(asteroide,124,yl,30,30);
    image(asteroide,224,yl,30,30);
    image(asteroide,255,yl,30,30);
    image(asteroide,286,yl,30,30);
    image(asteroide,317,yl,30,30);


if (dist(x,y,15,yl)<30){
  
  yl=600;
    vie=vie-1;
}
if (dist(x,y,46,yl)<30){
  
  yl=600;
    vie=vie-1;
}
if (dist(x,y,77,yl)<30){
 
  yl=600;
    vie=vie-1;
}
if (dist(x,y,108,yl)<30){
  
  yl=600;
   vie=vie-1;
}
if (dist(x,y,139,yl)<30){
  
  yl=600;
    vie=vie-1;
}
if (dist(x,y,239,yl)<30){
  
  yl=600;
    vie=vie-1;
}
if (dist(x,y,270,yl)<30){
 
  yl=600;
    vie=vie-1;
}
if (dist(x,y,301,yl)<30){
  
  yl=600;
   vie=vie-1;
}
if (dist(x,y,332,yl)<30){
  
  yl=600;
   vie=vie-1;
   
   
  
}
yl=yl+p;
  }

void missile(){
  
     if (ym>0 && ym<500){
       fill(#FFBC03);
       ellipse(xm+25,ym+50,random(5,10),20);
       ellipse(xm+25,ym+30,random(10,15),20);
       ellipse(xm+25,ym+10,random(15,20),20);
     image(missile,xm,ym-60,50,50);
      ym=ym-2;
  }
    else{
     ym=500;
    }
    
  }

void Deplacement(){
  if (keyCode == LEFT) {
    if ( keyPressed==true) {
      
      x=x-o;
      
    }
  }
     if (keyCode == RIGHT) {
    if (keyPressed==true) {
     
      x=x+o;
      
    }
     }
}

void vie(){
  
 if(vie==1){
    image(life,150,ylife,40,40);
}
if(vie==2){
    image(life,150,ylife,40,40);
    image(life,190,ylife,40,40);
}
if(vie==3){
    image(life,150,ylife,40,40);
    image(life,190,ylife,40,40);
    image(life,230,ylife,40,40);
}
if(vie==4){
    image(life,150,ylife,40,40);
    image(life,190,ylife,40,40);
    image(life,230,ylife,40,40);
    image(life,270,ylife,40,40);
}
if(vie>=5){
    image(life,150,ylife,40,40);
    image(life,190,ylife,40,40);
    image(life,230,ylife,40,40);
    image(life,270,ylife,40,40);
    image(life,310,ylife,40,40);
    vie=5;
}
  
  
}

void setup (){
  cococpt = -1;
   xb=random(100,250);
   bosslife=100;
  yb=100;
  cptlvl = 1;
  cptv=0;
  vie=5;
  smooth();
  frameRate(300);
 size(350,550);
 background = loadImage("galaxy.jpg");
 life = loadImage("coeur2.png");
  cat = loadImage("cat.png");
 gameover=loadImage("game over.png");
  bombe = loadImage("bombe.png");
  taco = loadImage("taco.png");
  trump = loadImage("trump.png");
  missile = loadImage("missile.png");
  pizza = loadImage("pizza.png");
  menui = loadImage("menu.jpg");
  boss = loadImage ("boss.png");
  asteroide =loadImage("asteroide.png");
  island = loadImage("beach.png");
  option = loadImage("option.jpg");
  
 minim= new Minim(this);
 bag = minim.loadFile("Bag Raiders - Shooting Stars.mp3");
  squish = minim.loadSample("squish.wav");
  explo1 = minim.loadSample("explo1.wav");
  geo= minim.loadFile("GeometryDash-Level1.mp3");
  exploboss = minim.loadSample("chat.mp3");
  coco = minim.loadFile("cocoSong.mp3");
  fill(255,255,255);
  line(25,500,320,25);

 for( int i=0; i < tabx.length ; i=i+1){
 tabx[i]=random(350);
 }
 for( int i=0; i < taby.length ; i=i+1){
 taby[i]=random(-50000,0);
 }
  for( int i=0; i < tabxb.length ; i=i+1){
 tabxb[i]=random(350);
 }
 for( int i=0; i < tabyb.length ; i=i+1){
 tabyb[i]=random(-50000,0);
 }
}


 
 
  



void draw(){
  
  
  frameRate(300);
 // background(r,v,b);
  


   
   
   
   if (keyCode == ENTER) {
   if(keyPressed ==true){
     menu=1;
   }
 }
 menu();
 if (menu>=1){
   jeu();
  
   }
   
   
}

 

 