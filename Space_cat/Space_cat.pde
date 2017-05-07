import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;


import ddf.minim.*;

 
 
 
 Minim minim;
AudioPlayer coco;
AudioPlayer bag;
AudioPlayer geo;
AudioPlayer snoop;
AudioSample squish;
AudioSample explo1;
AudioSample exploboss;

float bonusx,bonusy,bonus,cptbonus; //coordonnées de la caisse bonus, valeur de l'état(activation ou non du bonus);
int taille,taille2,taille3;
float abs=0; //abscisses des astéroides
int select=0;
int xv; //abscisse du coeur bonus après le boss
int worldselect=0;
int world=0; // choix du monde
int bosslife = 100;//vie du boss
int  yb;//coordonées du boss
int cptboss=0; //compteur de boss
float xb,xbo;//pareil
int lvl=1,cptlvl;// niveau actuel et competeur pour changer de niveau
int menu=0;
float ly=0; //ordonée du texte level
int sc=0;
int cptv; //le nombre de tacos d'affilé
float xm,xm2,xm3; // abscisse des missile
int vie; //nombre de vies
float t=1; //vitesse des objet qui tombent
float x=70;//abcsisse du chat
 float o=2; //vitesse de la balle
 int ym=500;//ordonée du missile
 float y=500;//ordonée du chat
 int best=10;
 float p=1; //vitesse de la ligne de triangles
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
 float yl=-40;
 int ylife=15; //ordonée des coeurs
 int r=200;
 float v=1;
 int b=200;
 float []tabx= new float[200];
float [] taby= new float[200] ;
float [] tabxa= new float[11] ;
float []tabxb= new float[100];
float [] tabyb= new float[100] ;

PImage bonusbox, image1, image2, image3,mondes, menu2, banana, frites, donut, cocop, pineaple, burger, soda, thugcat, palmcat, city, island, background,cat,bombe,life,taco,asteroide,trump,gameover,missile,pizza,menui,boss, option,mondeselect; // déclaration des images

void monde(){
  if(menu==0){
    
  if (key == ENTER){
  select=1;
  
 }  
  if(select==1){
    image(menu2,0,0,350,550);
    image(mondes,0,0,350,550);
        taby[i]=taby[i]-t;
        tabyb[i]=tabyb[i]-t;
  

   
   
    
  if(key=='1'){
    worldselect=1;
    background(background);
    image(mondes,0,0,350,550);
    
  }
  if(key =='2'){
    worldselect=2;
    background(island);
    image(mondes,0,0,350,550);
  }
  if(key=='3'){
    worldselect=3;
    background(city);
    image(mondes,0,0,350,550);
  }
 if(worldselect==1){
   
    image(cat,26,140,80,80);
    if (key == ENTER ) {
   if(keyPressed==true){
    select=2;
     menu=1;
     world=1;
     bag.play();
    
  snoop.close();
  coco.close();
      
   }
    }
 }
  if(worldselect==2){
  
    image(palmcat,145,140,80,80);
     if (key == ENTER ) {
   if(keyPressed==true){
     select=2;
     menu=1;
     world=2;
     coco.play();
     bag.close(); 
  snoop.close();
;
     
   }
   else{
     select=2;
     menu=1;
     world=2;
     }
     }
 }
  if(worldselect==3){
   
    image(thugcat,245,140,80,80);
    if (key == ENTER) {
     if(keyPressed==true){
     select=2;
     menu=1;
     world=3;
     snoop.play();
     bag.close(); 

  coco.close();
      
   }
    }
 }

  
 
  }
  }
}
void bonusmissil(){
  if(ym==449 ){
    cptbonus=cptbonus-1;
  }
  if (bonus==0 && score%10==0){
    bonusy=-60;
    bonusx= random(50,200);
    }
    bonusy=bonusy+t;
     
      
 
   image(bonusbox,bonusx,bonusy,60,60);
  
   
  if (cptbonus<=0){
    cptbonus=0;
  }
  if(dist(bonusx,bonusy,x,y)<45){
    bonus=3;
    cptbonus=3;
    bonusy=600;
  }
  

if(cptbonus==1){
    image(missile,15,15,60,60);
}
if(cptbonus==2){
    image(missile,15,15,60,60);
    image(missile,35,15,60,60);
}
if(cptbonus==3){
    image(missile,15,15,60,60);
    image(missile,35,15,60,60);
     image(missile,55,15,60,60);
    }
     if(bonus<=0){
       bonus=0;
     }
  
}

    



void option(){
   if (key == 'o' || key=='O'){
     if(keyPressed==true){
     
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
    
   
   
   monde();
    option();
 
 // image(trump,100,300,150,150);
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
 
 if(dist(xm,ym,xb,yb+20)<100 ){
   bosslife=bosslife-25;
   exploboss.trigger();
   xm=1000;
   if(xm2>400 && xm3>400){
   bonus=bonus-1;
   ym=500;
   }
   }
   if(dist(xm2,ym,xb,yb+20)<100 ){
   bosslife=bosslife-25;
   exploboss.trigger();
   xm2=1000;
   if(xm>400 && xm3>400){
   bonus=bonus-1;
   ym=500;
   }
   }
   if(dist(xm3,ym,xb,yb+20)<100 ){
   bosslife=bosslife-25;
   exploboss.trigger();
   xm3=1000;
   if(xm2>400 && xm>400){
   bonus=bonus-1;
   ym=500;
   }
   }
 }
   else{

     cptboss=0;
     image(life,xb,yb,60,60);
     yb=yb+1;
     if(dist(xb,yb,x,y)<55){
       vie=vie+1;
        yb=100;
            cptlvl=cptlvl+1;
       bosslife=100 +(25*cptlvl);
      }
      if(yb>600){
         yb=100;
            cptlvl=cptlvl+1;
       bosslife=100 +(25*cptlvl);
      }
   }
}

  
void jeu(){
  
    if (key == 's' || key== 'S'){
      if(keyPressed==true){
    menu=0;
    score=0;
    select=0;
    worldselect=0;
    tabx[i]=random(350);
   taby[i]=random(-50000,-50);
   vie=5;
    bag.close(); 
  snoop.close();
  coco.close();
   
      }
    }
    
  
   if(world == 2){
     image1=cocop;
     image2=banana;
     image3=pineaple;
     taille=60;
     taille2=100;
     taille3=100;
    background(island);
    
      fill(255,255,255);
  line(25,500,320,500);
  image(palmcat,x-25,y-25,60,60);
 
  
      
     }
 if(world==1){
      image1=taco;
     image2=pizza;
     image3=donut;
      taille=50;
     taille2=90;
     taille3=90;
    background(background);
   fill(255,255,255);
  line(25,500,320,500);
  image(cat,x-25,y-25,60,60);
  
    }
    
    if(world==3){
       taille=50;
     taille2=60;
     taille3=50;
     image1=burger;
     image2=frites;
     image3=soda;
      background(city);
    
      fill(255,255,255);
  line(25,500,320,500);
  image(thugcat,x-25,y-25,60,60);
 
    }
 
  

 
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
   image(image1,tabx[i]-25,taby[i]-25,taille,taille);
   }
   t=1.5;
   }
   
   if(score>=15 && score<=29){ //LEVEL 1.2
   if ( taby[i]>=-30 && taby[i]<=550){
     
    image(image2,tabx[i]-15,taby[i]-15,taille2,taille2);
  }
   o=2;
    t=1.5;
 }
 
 
 if(score>=30 && score<=59){
    if ( taby[i]>=-30 && taby[i]<=550){
  image(image3,tabx[i]-50,taby[i]-10,taille3,taille3);
    }
   t=1.5;
    o=2;
    
 }
 
 if(score>=60 && score<=89){
    if ( taby[i]>=-30 && taby[i]<=550){

   image(image1,tabx[i]-10,taby[i]-10,taille,taille);
    }
   t=2;
   o=3;
 }
 if(score>=90 && score<=119){
    if ( taby[i]>=-30 && taby[i]<=550){

   image(image2,tabx[i],taby[i],taille2,taille2);
    }
   t=2;
   o=3;
 }
 if(score>=120 && score<=150){
    if ( taby[i]>=-30 && taby[i]<=550){

   image(image3,tabx[i],taby[i],taille3,taille3);
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
       image(bombe,tabxb[i]-15,tabyb[i]-15,50,50);
     }
     p=2;
 }
 if(score>=30 && score<=59){
    if ( tabyb[i]>=-30 && tabyb[i]<=550){
      image(bombe,tabxb[i]-10,tabyb[i]-10,50,50);
    }
   t=1.5;
   p=2.5;
   
 
 }
 if(score>=60 && score<=89){
   if ( tabyb[i]>=-30 && tabyb[i]<=550){
     image(bombe,tabxb[i]-5,tabyb[i]-5,50,50);
   }
   p=3;
    
  
 }
 if(score>=90 && score<=119){
   if ( tabyb[i]>=-30 && tabyb[i]<=550){
     image(bombe,tabxb[i]-5,tabyb[i]-5,50,50);
   }
   p=3.5;
    
  
 }
   
   if(dist(x,y,tabxb[i],tabyb[i])<40){
     tabyb[i]=600;
     cptv=0;
     vie=vie-1;
     
   }
   if(dist(xm+15,ym,tabxb[i],tabyb[i])<25){
     
     if (bonus>0){
       bonus=bonus-1;
     }
     explo1.trigger();
     cptv=cptv+1;
     tabyb[i]=600;
     xm=1020;
     }
    if(dist(xm2+15,ym,tabxb[i],tabyb[i])<25){
       if (bonus>0){
       bonus=bonus-1;
        xm2=1020;
     }
     tabyb[i]=600;
     explo1.trigger();
     cptv=cptv+1;
     xm2=1000;  
   
   }
    if(dist(xm3+15,ym,tabxb[i],tabyb[i])<25){
     tabyb[i]=600;
     explo1.trigger();
     cptv=cptv+1;  
      bonus=bonus-1;
      xm3=1000;
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
 
 if (key == ' ' && ym==500) {
   if(keyPressed ==true){
      xm=x-25;
       if(bonus>0 ){
     xm2=xm+25;
      xm3=xm-25;
     }
     if(bonus==0){
       xm2=1200;
      xm3=1000;
     }
      
     ym=ym-1;
   }
 }
 missile();
  bonusmissil();
    

 
if (key=='c' || key=='C'){  // fonction triche
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
  monde();
  
}

void ligne(){
  if(score%10 ==0){ // réinitiatisation de la lgne tous les 10 points
    abs=0;
    yl=-40;
   for(i=0;i<11;i++){
     tabxa[i]=abs;
    abs=abs+31;
   }
  }
  for(i=0;i<11;i++){
if(yl>-40 && yl<600){
  image(asteroide,tabxa[i],yl,30,30);
}
if (dist(tabxa[i]+10,yl,x,y)<30){ //detection chat astéroides
  
  yl=600;
    vie=vie-1;
}
if (dist(tabxa[i]+10,yl,x,ym)<30){ //detection missiles astéroides
  tabxa[i]=600;
   
}
if (dist(tabxa[i]+10,yl,x+5,ym)<30){ //detection missiles astéroides
  tabxa[i]=600;
   
}
if (dist(tabxa[i]+10,yl,x-50,ym)<30){ //detection missiles astéroides
  tabxa[i]=600;
 
}
   }
yl=yl+p;
  
}
void missile(){
    if(ym<-30){
      bonus=bonus-1;
    }
     if (ym>-10 && ym<500){   //dessin du missile
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
    if(bonus>0){
    if (ym>-10 && ym<500){   //dessin du missile
       fill(#FFBC03);
       ellipse(xm2+25,ym+50,random(5,10),20);
       ellipse(xm2+25,ym+30,random(10,15),20);
       ellipse(xm2+25,ym+10,random(15,20),20);
     image(missile,xm2,ym-60,50,50);
      
  }
    else{
     ym=500;
    }
    
    
    if (ym>-10 && ym<500){   //dessin du missile
       fill(#FFBC03);
       ellipse(xm3+25,ym+50,random(5,10),20);
       ellipse(xm3+25,ym+30,random(10,15),20);
       ellipse(xm3+25,ym+10,random(15,20),20);
     image(missile,xm3,ym-60,50,50);
      
  }
    else{
     ym=500;
     }
    }
   
      
    
  }

void Deplacement(){    //deplacement du chat
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
  bonus=0;
  cptbonus=0;
  bonusx=175;
  bonusy=-60;
  world = -1;
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
 donut= loadImage("donut.png");
 cocop= loadImage("cocop.png");
 pineaple= loadImage("pineapleP.png");
 burger= loadImage("burgerP.png");
 frites= loadImage("fritesP.png");
 soda= loadImage("sodaP.png");
  missile = loadImage("missile.png");
  pizza = loadImage("pizza.png");
  menui = loadImage("menu.jpg");
  menu2 = loadImage("menu.png");
  boss = loadImage ("boss.png");
  asteroide =loadImage("asteroide.png");
  island = loadImage("beach.png");
  option = loadImage("option.jpg");
  mondeselect = loadImage("monde.png");
  city = loadImage("city.jpg");
  bonusbox= loadImage("bonus.png");
  thugcat= loadImage("thugcat.png");
  palmcat= loadImage("palmcat.png");
  banana= loadImage("bananeP.png");
  mondes= loadImage("mondes.png");
 minim= new Minim(this);
 bag = minim.loadFile("Bag Raiders - Shooting Stars.mp3");
  squish = minim.loadSample("squish.wav");
  explo1 = minim.loadSample("explo1.wav");
  geo= minim.loadFile("GeometryDash-Level1.mp3");
  exploboss = minim.loadSample("chat.mp3");
  coco = minim.loadFile("cocoSong.mp3");
  snoop = minim.loadFile("snoop.mp3");
  fill(255,255,255);
  line(25,500,320,25);
  
 for( int i=0; i < tabx.length ; i=i+1){
 tabx[i]=random(350);
 }
 for(int i=0;i<11;i=i+1){
     tabxa[i]=abs;
    abs=abs+31;
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
  
   
 menu();
 if (menu>=1){
   jeu();
  
   }
   
   
}
 

 