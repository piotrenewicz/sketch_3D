paper planes[];
int amount;

void setup(){
  size(700, 700, P3D);                                        //window size;
  amount=6;                                                    //declaration of the amount of sheets of paper.  
  planes = new paper[amount];
  for(int j=0; j<amount; j++){
    planes[j] = new paper(25, 200+(j*50), j, amount);                    // declaration of distance between sheets of paper in space and time.
  }//                       ^    ^      ^
//      time between sheets /     \      \distance between sheets
}//                            distance between the core and first sheet.

void draw(){
  background(0);
  pushMatrix();
  translate(width/2, height/2, -600);                          //Z space declaration, the less the number the more the space. 
  
  rotateX(radians(50));
  rotateZ(radians(45));
  
  /*rotateX(-radians(mouseY-height/2));
  rotateY(radians(mouseX-width/2));
  rotateZ(radians(mouse));
  */
  
    for(int i=0; i<amount; i++){
      planes[i].update();
    }
    
    fill(255);
    box(200, 200, 200);
  
  popMatrix();
  
  //print(mouseX+"  "+mouseY+"  "+mouse+ENTER);
}

class paper{
  int FrameOffset;
  int distance;
  int Odist;
  int counter=0;
  int action=0;
  int order=0;
  int index=0;
  int max=0;
  
  paper(int FrameOffset_, int distance_, int index_, int max_){
    FrameOffset=FrameOffset_;
    Odist=distance_;
    index=index_;
    max=max_;
  }

  void setOrder(int order_){
    order=order_;
  }
  
  void update(){
    distance = Odist;
    
    if(order!=0 && action==0){
      action=order;
      order=0;
    }  
    
    if(action==0)counter=0;
    else counter+=2;
    
    if(counter>90)action=0;
    
    if(counter>FrameOffset)
      if(index+1<max)
        if(planes[index+1].action==0)
          planes[index+1].setOrder(action);
                                           
    pushMatrix();
      if(counter>0){
        switch(action){
          case 1:
            rotateZ(-radians(counter));
            break;
          case 2:
            rotateZ(radians(counter));
            break;
          case 3:
            rotateX(radians(counter));
            break;
          case 4:
            rotateX(-radians(counter));
            break;
          case 5:
            rotateY(-radians(counter));
            break;
          case 6:
            rotateY(radians(counter));
            break;
          case 7:
            if(counter<45)distance = 30*(counter)+Odist;
            else distance = Odist+ 30*abs((counter)-90);
          } 
      }
      pushMatrix();
        translate(0, 0,  distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      rotateY(radians(90));
      
      pushMatrix();
        translate(0, 0, distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      rotateX(radians(90));
      
      pushMatrix();
        translate(0, 0, distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      rotateY(radians(90));
      
      pushMatrix();
        translate(0, 0, distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      rotateX(radians(90));
      
      pushMatrix();
        translate(0, 0, distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      rotateY(radians(90));
      
      pushMatrix();
        translate(0, 0, distance);
        rect(-100, -100, 200, 200);
      popMatrix();
      
      
      
    
    popMatrix();
  }
  
}

/*
0=nada
1=X+
2=X-
3=Y+
4=Y-
5=Z+
6=Z-
7=S
*/

//the fix was simple i just made each piece of paper know which paper is next and issue an order to the neighbour
//

int mouse=0;

void mouseWheel(MouseEvent e){
  mouse+=e.getCount();
}

void keyPressed(){
  int code=0;
  if(key=='d')code=1;
  if(key=='a')code=2;
  if(key=='e')code=3;
  if(key=='z')code=4;
  if(key=='w')code=5;
  if(key=='x')code=6;
  if(key=='s')code=7;
  
  //for(int i =0; i<amount; i++){
  //  planes[i].setOrder(code);
  //} 
  
  planes[0].setOrder(code);
}
