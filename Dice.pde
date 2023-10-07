//simple dice

void setup(){ //setup and stuff
  size(500,600);
  noLoop();
  textSize(30);
}

void draw(){ 
  int dieSum = 0;
  background(180,180,180);
  for(int y = 30; y < 500; y += 80){
    for(int x = 30; x < 500; x += 80){
      Dice bob;
      bob = new Dice(x, y);
      bob.show();
      dieSum += bob.value;
    }
  }

  text("Total Sum: " + dieSum, 160, 550); //displays text that tells u the sum
}

void mouseClicked(){ //redraw and stuff
  redraw();
}

class Dice {// die
  int value, myX, myY;//declare member variables
  Dice(int x, int y){//constructor function
    myX = x; //coordinates of the die
    myY = y;
    value = (int)(Math.random()*6)+1; //sets the value of the die
  }
  
  void show(){
    fill(255,255,255);//white
    rect(myX, myY, 49, 49, 20); //makes the squareish die shape
    fill(0, 0, 0);//black
    if(value % 2 == 1){//for odd numbers
      ellipse(myX+25, myY+25, 7,7);//ellipse in the middle of the die
      if(value > 1){//if its odd and greater than one so 3 or 5
        ellipse(myX+14, myY+14, 7, 7); //creates the dots on one of the diagonals
        ellipse(myX+35, myY+35, 7, 7);
        if(value == 5){ //if the value is 5
          ellipse(myX+35, myY+14, 7, 7); //creates dots on the other diagonal
          ellipse(myX+14, myY+35, 7, 7);
        }
      }
    } else if(value != 6) {//before already checked if value was odd, so now it 
                            //should be even, so this checks if for 2 or 4
      ellipse(myX+16, myY+16, 7, 7); //makes diagonal that's used in 2 and 4
      ellipse(myX+34, myY+34, 7, 7);
      if(value == 4){ //checks if value equals 4
        ellipse(myX+16, myY+34, 7, 7); //finishes making the 4 shape
        ellipse(myX+34, myY+16, 7, 7);
      }
    } else {//this will be a 6
      ellipse(myX+16, myY+14, 7, 7);//left side
      ellipse(myX+16, myY+25, 7, 7);
      ellipse(myX+16, myY+36, 7, 7);
      
      ellipse(myX+34, myY+14, 7, 7);//right side
      ellipse(myX+34, myY+25, 7, 7);
      ellipse(myX+34, myY+36, 7, 7);
    }
  }
}
