//array containing web color hex 
color[] hex = {#FFFFFF, #C0C0C0, #808080, #000000,
               #FF0000, #800000, #FFFF00, #808000,
               #00FF00, #008000, #00FFFF, #008080,
               #0000FF, #000080, #FF00FF, #800080};
               
//array containing hex values as string for further display
String[] value = {"#FFFFFF", "#C0C0C0", "#808080", "#000000",
               "#FF0000", "#800000", "#FFFF00", "#808000",
               "#00FF00", "#008000", "#00FFFF", "#008080",
               "#0000FF", "#000080", "#FF00FF", "#800080"};
               
//array containing web colors' names
String[] name = {"white", "silver", "gray", "black", "red",
                 "maroon", "yello", "olive", "lime", "green",
                 "aqua", "teal", "navy", "fuchsia", "purple"};

PFont colorFont; //font for color names
PFont numberFont; //font for hex numbers

String defaultText = ""; //default text displayed when the app starts, will be rand
String defaultValue = ""; //default hex value displayed, rand
String instructions = "Write the name of your desired Web Color \n and presss Enter \n or CTRL for a random color"; //instructions
color defaultColor = #FFFFFF; //default color at the start, will be rand
color bgColor;
String colorName;
String colorValue;

//method for randomizing startup color
void initiate()
{
  int index = int(random(name.length));
  defaultText = name[index];
  defaultColor = hex[index];
  defaultValue = value[index];
  
  bgColor = defaultColor;
  colorName = defaultText;
  colorValue = defaultValue;
  
  
}


void setup()
{
  initiate();
  size(640, 480);
  stroke(0);
  colorFont = createFont("strenuous bl.ttf", 32);
  numberFont = createFont("NotCourierSans.otf", 28);
  textAlign(CENTER);

}

void cursor()
{
  float cursorPos = textWidth(colorName); //cursor position
  stroke(255, (125 - map(millis()%3000, 0, 3000, 0, 300))); //blink
  line(cursorPos + (width/2), 150, cursorPos + (width/2), 234); //placing the cursor
}


//a new surface for the background circle
void bgCircle()
{
  color bgcolor = #FFE11B;
  PGraphics bgc = createGraphics(1000, 1000);
  bgc.beginDraw();
  bgc.fill(bgcolor, 160);
  bgc.ellipse(width/2, height/2, 435, 435);
  bgc.endDraw();
  image(bgc, 0, 0);
}


void draw()
{
  background(bgColor); 
  textSize(14);
  bgCircle();
  text(instructions, width/2, 120);
  textFont(colorFont);
  text(colorName.toLowerCase(), width/2, 200);
  textFont(numberFont);
  text(colorValue, width/2, 400);
  cursor();
  
  
  
}
  

//op for randomizign color
void keyReleased()
{
  if (key == CODED)
  {
    if (keyCode == CONTROL)
    {
      initiate();
    }
  }
}


//type and rest
void keyPressed()
{
  if (key == BACKSPACE && colorName.length() > 0)
  {
    colorName = colorName.substring(0, (colorName.length() - 1));
  }
  
  else if (textWidth(colorName) < width / 6 && colorName.length() < 8 && key != CODED && key != BACKSPACE && key != RETURN && key != ENTER)
  {
    colorName += key;
  }
  
  else if (key == ENTER || key == RETURN)
  {
    String colorNameLower = colorName.toLowerCase();
    switch (colorNameLower)
    {
      case "white":
        bgColor = hex[0];
        colorValue = value[0];
        break;
      case "silver":
        bgColor = hex[1];
        colorValue = value[1];
        break;
      case "gray":
        bgColor = hex[2];
        colorValue = value[2];
        break;
      case "black":
        bgColor = hex[3];
        colorValue = value[3];
        break;
      case "red":
        bgColor = hex[4];
        colorValue = value[4];
        break;
      case "maroon":
        bgColor = hex[5];
        colorValue = value[5];
        break;
      case "yellow":
        bgColor = hex[6];
        colorValue = value[6];
        break;
      case "olive":
        bgColor = hex[7];
        colorValue = value[7];
        break;
      case "lime":
        bgColor = hex[8];
        colorValue = value[8];
        break;
      case "green":
        bgColor = hex[9];
        colorValue = value[9];
        break;
      case "aqua":
        bgColor = hex[10];
        colorValue = value[10];
        break;
      case "teal":
        bgColor = hex[11];
        colorValue = value[11];
        break;
      case "blue":
        bgColor = hex[12];
        colorValue = value[12];
        break;
      case "navy":
        bgColor = hex[13];
        colorValue = value[13];
        break;
      case "fuchsia":
        bgColor = hex[14];
        colorValue = value[14];
        break;
      case "purple":
        bgColor = hex[15];
        colorValue = value[15];
        break;
    }
  }
}


  


  