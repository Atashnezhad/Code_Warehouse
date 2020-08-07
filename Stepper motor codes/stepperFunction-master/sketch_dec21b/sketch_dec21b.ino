


//Include the Arduino Stepper Library
#include <Stepper.h>

// Define Constants

// Number of steps per internal motor revolution 
const float STEPS_PER_REV = 32; 

//  Amount of Gear Reduction
const float GEAR_RED = 64;

// Number of steps per geared output rotation
const float STEPS_PER_OUT_REV = STEPS_PER_REV * GEAR_RED;

// Define Variables
int StepsRequired;
int Num_Of_rev = 1;
int total = 200;
int i = 1;
//float vel = 0;

Stepper steppermotor(STEPS_PER_REV, 8, 10, 9, 11);

Stepper steppermotor2(STEPS_PER_REV, 2, 4, 3, 5);





void setup(){
// initialize the serial port:
  Serial.begin(9600); 
//  amin_acc(500, 0, -1);
//Run_Step_Wise_2(400, 700, 1);
//Run_Step_Wise_2(400, 700, -1);

}


// ===================================================================

void rotate_the_stepper(int NumOfRotations, int S_speed, int CWCCW)
{

      //  total = NumOfRotations;
      for (int i = 1; i <= NumOfRotations; i++) 
      {
    
          //  StepsRequired  =  Num_Of_rev * STEPS_PER_OUT_REV * CWCCW;
          StepsRequired  =  STEPS_PER_OUT_REV * CWCCW;
          steppermotor.setSpeed(S_speed);   
          steppermotor.step(StepsRequired);
          Serial.print("Cycle number is ");
          Serial.println(i);    // print the number
    
      }

}


void rotate_the_stepper2(int NumOfRotations, int S_speed, int CWCCW)
{

      //  total = NumOfRotations;
      for (int i = 1; i <= NumOfRotations; i++) 
      {
    
          //  StepsRequired  =  Num_Of_rev * STEPS_PER_OUT_REV * CWCCW;
          StepsRequired  =  STEPS_PER_OUT_REV * CWCCW;
          steppermotor2.setSpeed(S_speed);   
          steppermotor2.step(StepsRequired);
          Serial.print("Cycle number is ");
          Serial.println(i);    // print the number
    
      }

}

















//=================================================================
void Run_Step_Wise_2(float NumOfSteps, int S_speed, int CWCCW)
{
  
      float total = (NumOfSteps / STEPS_PER_OUT_REV);
      int loop_num = floor(total);
      float rest_steps_num = floor((total - loop_num)*1000);
    
    
      if (loop_num < 1)
      {
    
          StepsRequired  =  rest_steps_num * CWCCW;
          steppermotor.setSpeed(S_speed);   
          steppermotor.step(StepsRequired);
    
      }
        
      else {
          
    
          for (int i = 1; i <= loop_num; i++) 
          {
              
              StepsRequired  =  STEPS_PER_OUT_REV * CWCCW;
              steppermotor.setSpeed(S_speed);   
              steppermotor.step(StepsRequired);
              
          }
    
          StepsRequired  =  rest_steps_num * CWCCW;
          steppermotor.setSpeed(S_speed);   
          steppermotor.step(StepsRequired);
    
      }
}



void amin_acc(int steps, int vel, int CWCCW, int max_vel_inc, int vel_max)
{

      for (int i = 1; i <= max_vel_inc; i +=1)
      {
        
        vel = vel + (vel_max / max_vel_inc);
        Run_Step_Wise_2(steps, vel, CWCCW);  
        Serial.print("steps = "   );
        Serial.print(steps);
        Serial.print("  vel = "); 
        Serial.print(vel);
        Serial.print("  CWCCW = ");
        Serial.println(CWCCW);
        
      }
        
    
      for (int i = 1; i <= (max_vel_inc-1); i +=1)
      {
        
        vel = vel - (vel_max / max_vel_inc);
        Run_Step_Wise_2(steps, vel, CWCCW);  
        Serial.print("steps = "   );
        Serial.print(steps);
        Serial.print("  vel = "); 
        Serial.print(vel);
        Serial.print("  CWCCW = ");
        Serial.println(CWCCW);
        
      }  
    
}
//=================================================================




void amin(){

//      rotate_the_stepper(2,700,1);
//      rotate_the_stepper2(2,700,-1);



  
}


void craweling(int num_of_crawling){

  Serial.println("craweling");


  for (int i = 1; i <= num_of_crawling; i +=1)
      {

        rotate_the_stepper(1,700,-1); // stepper 1 = Up -1
        rotate_the_stepper2(1,700,1); // stepper 2 = Up 1
        
      }  

  for (int i = 1; i <= num_of_crawling; i +=1)
      {

        rotate_the_stepper2(1,700,-1);
        rotate_the_stepper(1,700,1); // down 1
        
      }  


  
}







void loop()
{
  


//        Serial.println("delay");
//      delay(5000);
//      amin();

        craweling(10);



//      rotate_the_stepper(1,700,-1); // stepper 1 = Up -1
//      rotate_the_stepper2(1,700,1); // stepper 2 = Up 1
//      rotate_the_stepper(1,700,-1); // stepper 1 = Up -1
//      rotate_the_stepper2(1,700,1); // stepper 2 = Up 1
//      rotate_the_stepper(1,700,-1); // stepper 1 = Up -1
//      rotate_the_stepper2(1,700,1); // stepper 2 = Up 1
//      rotate_the_stepper(1,700,-1); // stepper 1 = Up -1
//      rotate_the_stepper2(1,700,1); // stepper 2 = Up 1
//      delay(1000);
//
//      rotate_the_stepper2(1,700,-1);
//      rotate_the_stepper(1,700,1); // down 1
//      rotate_the_stepper2(1,700,-1);
//      rotate_the_stepper(1,700,1); // down 1
//      rotate_the_stepper2(1,700,-1);
//      rotate_the_stepper(1,700,1); // down 1
//      rotate_the_stepper2(1,700,-1);
//      rotate_the_stepper(1,700,1); // down 1
//      Serial.println("done");





      
      //Run_Step_Wise_2(50000, 700, -1);
      //Run_Step_Wise_2(60000, 700, -1);
      
//      Serial.println("done");
//      delay(2000000000);
      
      //amin_acc(int steps, int vel, int CWCCW, int max_vel_inc, int vel_max)
      //amin_acc(100, 100, -1, 1000, 1000);
      //amin_acc(100, 100, 1, 1000, 1000);
      
      //Run_Step_Wise_2(2048, 700, 1);
      //Run_Step_Wise_2(2048, 700, -1);
      
      //rotate_the_stepper(1,700,-1); // 1 down  -1 up
      //rotate_the_stepper(1,700,1); 
      //delay(5000);

}
