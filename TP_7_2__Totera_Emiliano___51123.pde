import processing.serial.*;
Serial myPort;

boolean LED1 = false;
boolean LED2 = false;
long lastPress = 0;
int contador;

void setup()
{
  size(520, 280);
  myPort = new Serial(this, "COM3", 9600);
}

void draw()
{
  background(255);
  
  fill(255);
  beginShape();
    vertex(45, 50);
    vertex(150, 50);
    vertex(150, 93);
    vertex(45, 93);
  endShape(CLOSE);
  
  beginShape();
    vertex(45, 170);
    vertex(150, 170);
    vertex(150, 213);
    vertex(45, 213);
  endShape(CLOSE);
  
  boolean entrada1 = millis() - lastPress > 250 && mousePressed && mouseX > 250 && mouseX < 300 && mouseY > 50 && mouseY < 93;

  if (entrada1)
  {
    fill(150);
    noStroke();
    LED1 = !LED1;
    lastPress = millis();
    contador = 1;
    myPort.write(contador);
  }
  else
  {
    fill(220);
    stroke(0);
  }
  
  beginShape();
    vertex(250, 50);
    vertex(300, 50);
    vertex(300, 93);
    vertex(250, 93);
  endShape(CLOSE);
  
  boolean entrada2 = millis() - lastPress > 250 && mousePressed && mouseX > 350 && mouseX < 400 && mouseY > 50 && mouseY < 93;

  if (entrada2)
  {
    fill(150);
    noStroke();
    LED2 = !LED2;
    lastPress = millis();
    contador = 2;
    myPort.write(contador);
  }
  else
  {
    fill(220);
    stroke(0);
  }
  
  beginShape();
    vertex(350, 50);
    vertex(400, 50);
    vertex(400, 93);
    vertex(350, 93);
  endShape(CLOSE);
  
  stroke(0);
  
  if(LED1 == true)
  {
    fill(0, 0, 255);
  }
  else
  {
    fill(255);
  }
  
  beginShape();
    ellipse(275, 191, 50, 50);
  endShape(CLOSE);
  
  if(LED2 == true)
  {
    fill(255, 0, 0);
  }
  else
  {
    fill(255);
  }
  
  beginShape();
    ellipse(375, 191, 50, 50);
  endShape(CLOSE);
  
  fill(0);
  textSize(25);
  text("Entradas", 50, 80);
  text("Salidas", 60, 200);
  textSize(23);
  text("E1", 265, 79);
  text("E2", 365, 79);
  text("S1", 264, 199);
  text("S2", 364, 199);
}



void serialEvent(Serial myPort)
{
  int aux;
  String key = myPort.readStringUntil('\n');
  if (key != null)
  {
    aux = int(trim(key));
    if(aux == 1)
      LED1 = true;
      
    if (aux == -1)
      LED1 = false;
      
    if(aux == 2)
      LED2 = true;
      
    if (aux == -2)
      LED2 = false;
  }
}
