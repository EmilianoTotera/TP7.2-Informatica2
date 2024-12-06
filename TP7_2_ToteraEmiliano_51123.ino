#define LED1 A1
#define LED2 A0
#define PULSADOR1 2
#define PULSADOR2 3

int brilloMax = 250, salto = 50;
int LEDenUso, brillo = 0,brillo1 = 0, brillo2 = 0;
unsigned long lastPress = 0;

void setup()
{
  Serial.begin(9600);
  pinMode(LED1, OUTPUT);
  pinMode(LED2, OUTPUT);
  pinMode(PULSADOR1, INPUT_PULLUP);
  pinMode(PULSADOR2, INPUT_PULLUP);
}

void loop()
{
  if (digitalRead(PULSADOR1) == false && millis() - lastPress > 250)
  {
    LEDenUso = LED1;
    brillo = brillo1;

    if(brillo1 == 0)
    {
      aumenta();
      brillo1 = brilloMax;
      Serial.println("1");
    }
    else
    {
      disminuye();
      brillo1 = 0;
      Serial.println("-1");
    }
  }

  if (digitalRead(PULSADOR2) == false && millis() - lastPress > 250)
  {
    LEDenUso = LED2;
    brillo = brillo2;

    if (brillo2 == 0)
    {
      aumenta();
      brillo2 = brilloMax;
      Serial.println("2");
    }
    else
    {
      disminuye();
      brillo2 = 0;
      Serial.println("-2");
    }
  }

  int comando = Serial.read();
  if (comando == 1)
  {
    LEDenUso = LED1;
    brillo = brillo1;

    if (brillo1 == 0)
    {
      aumenta();
      brillo1 = brilloMax;
    }
    else
    {
      disminuye();
      brillo1 = 0;
    }
  }

  if (comando == 2)
  {
    LEDenUso = LED2;
    brillo = brillo2;

    if(brillo2 == 0)
    {
      aumenta();
      brillo2 = brilloMax;
    }
    else
    {
      disminuye();
      brillo2 = 0;
    }
  }
}

void aumenta()
{
  while(brillo < brilloMax)
  {
    brillo += salto;
    analogWrite(LEDenUso, brillo);
    delay(50);
  }
}

void disminuye()
{
  while(brillo > 0)
  {
    brillo -= salto;
    analogWrite(LEDenUso, brillo);
    delay(50);
  }
}