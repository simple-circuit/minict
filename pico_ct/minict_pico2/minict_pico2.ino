
//-----------------------------------------------------------------------------
// mini_ct.c
//-----------------------------------------------------------------------------
//Copyright 2012 Veikko Kanto 

//   Licensed under the Apache License, Version 2.0 (the "License");
//   you may not use this file except in compliance with the License.
//   You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
//   Unless required by applicable law or agreed to in writing, software
//   distributed under the License is distributed on an "AS IS" BASIS,
//   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//   See the License for the specific language governing permissions and
//   limitations under the License.
//
// DATE: 1-7-12
//
// C8051F120 Prototype board Curve Tracer Program 
// Project Name mini_ct
// UART 460800bps board has 22.1184MHz crystal
// Compiled with uC/51 WWW.WICKENHAEUSER.COM
//
// Port0.0 UART Out
// Port0.1 UART In
// Port0.2 Foot Switch In
// Port1.0-7 GP Output
// PORT2.0-5 Rotary and Toggle Switch Indicator Inputs
// Port3.0-7 GP Output
// DAC0 CT Collector Sweep Voltage
// DAC1 CT Base Step Voltage/Current
// ADC-12Bit Channels 0-1 Voltage and Current PV PI
//

#include "math.h"
#include "pico/stdlib.h"
#include "pico/binary_info.h"
#include "hardware/spi.h"
#define spi1 ((spi_inst_t *)spi1_hw)
//#include "RP2040_PWM.h" //used for header files, pwm directly programmed
//#include <Adafruit_TinyUSB.h> 

#define BDSN 33 //device serial number
#define pwm_pin4    4 
#define SWP 0x0D     //test place holder for register read value
volatile boolean l;
uint16_t  rbuf[] = {0 ,0};                 //array used to send spi commands
volatile int i,j;
int volatile updwn;                   //Waveform generator current DAC value                
int volatile ramp;                    //Waveform generator lookup table current pointer value 
int volatile stpsav;                 //Flag to stop [512] continuous waveform data acqusition and save
int volatile dacset;                 //Last DAC0 value for manual DA0 command
int volatile swpstart;               //Starting value for DAC0 used in MEA sweep command 
int volatile swpstep;                //Step value for DAC0 used in MEA sweep command
unsigned int volatile data0, data1;   //Temporary data storage
int volatile icnt, jcnt, kcnt, wcnt;  //General Purpose Loop variables 
unsigned char volatile runng;       //Flag to freeze runng waveform
int volatile pv[512];     //ADC0 voltage storage array for up to two cycles of waveform
int volatile pi[512];     //ADC1 current storage array for up to two cycles of waveform
int volatile wav[256];    //Waveform Look Up Table
int volatile P1 = 0;
int volatile P2 = 2;
int volatile P3 = 0;
int volatile intflg;
double frequency = 36621; //12-bits 150mhz/4096 for DACs

int sd = 17;
int sck = 18;   //serial clock
int mosi = 19;  //data out
int miso = 16;  //data in


void Pin21_Handler() {
   gpio_put(22, HIGH);           //Digital Write High
   if (intflg != 0) {
    data0 = analogRead(A0);  //Analog Read 40us
    data1 = analogRead(A1);  //Analog Read 40us
    data0 = data0+analogRead(A0);  //Analog Read 40us
    data1 = data1+analogRead(A1);  //Analog Read 40us
    data0 = data0+analogRead(A0);  //Analog Read 40us
    data1 = data1+analogRead(A1);  //Analog Read 40us
    data0 = data0+analogRead(A0);  //Analog Read 40us
    data1 = data1+analogRead(A1);  //Analog Read 40us
    pv[ramp] = data0;        //save voltage as 14-bit data
    pi[ramp] = 16383-data1;        //save current as 14-bit data
   
   //Waveform generation
    //Update Collector DAC0 to look up table value. If runng !=0, then set it to dacset fixed value
    if ( runng == 0) updwn = wav[ramp]; else updwn = dacset;
    P1 = 0;
    //pwm_set_chan_level(2,0, 1024-(updwn>>2) );
    writeDAC0(updwn);  //Dac0 Write
    ramp++;                      //point to next waveform value
    if (ramp >= 256) ramp = 0;   //waveform is 256 data point loop
   }
   gpio_put(22, LOW);     
}


void setup(){
   pinMode(25, OUTPUT); //built in LED
}
void loop(){

}



void setup1(){

//gpio_set_function(pwm_pin4,GPIO_FUNC_PWM);
//gpio_set_function(pwm_pin6,GPIO_FUNC_PWM);

//pwm_set_wrap(2,1023);
//pwm_set_chan_level(2,0,512);
//pwm_set_enabled(2,true);

//pwm_set_wrap(3,1023);
//pwm_set_chan_level(3,0,512);
//pwm_set_enabled(3,true);
      pinMode(0, INPUT_PULLUP); //GP digital input
      pinMode(1, INPUT_PULLUP); //GP digital input
      pinMode(2, INPUT_PULLUP); //GP digital input
      pinMode(3, INPUT_PULLUP); //GP digital input
      pinMode(4, OUTPUT); //gp output 
      pinMode(5, OUTPUT); //gp output 
      pinMode(6, OUTPUT); //gp output 
      pinMode(7, OUTPUT); //gp output 
      pinMode(8, INPUT_PULLUP); //rotary switch bit-0
      pinMode(9, INPUT_PULLUP); //rotary switch bit-1
      pinMode(10, INPUT_PULLUP); //rotary switch bit-2
      pinMode(11, INPUT_PULLUP); //rotary switch bit-3
      pinMode(12, INPUT_PULLUP); //I/V switch
      pinMode(13, INPUT_PULLUP); //gain switch
      pinMode(14, OUTPUT); //dac1 pwm output
      pinMode(15, INPUT_PULLUP); //GP digital input
      pinMode(sd,OUTPUT);   //17
   //   pinMode(sck,OUTPUT);  //18
   //   pinMode(mosi,OUTPUT); //16
   //   pinMode(miso,OUTPUT);  //19    
      pinMode(21, OUTPUT); //interrupt timing clock out
      pinMode(22, OUTPUT); //timing out test point for adc/dac interrupt loop
      pinMode(23, OUTPUT); //set high for PWM regulation 3.3V
      digitalWrite(23,1);
      pinMode(26, INPUT); //analog input A0
      pinMode(27, INPUT); //analog input A1
      pinMode(28, INPUT); //analog input A2
      pinMode(25, OUTPUT); //built in LED     
  
       intflg = 1;
       Serial.begin(460800); 
       analogReadResolution(12);
       analogWriteFreq(frequency);
       analogWriteResolution(12);
       analogWrite(14,2048);
       updwn = 32;       //Set to any number, updwn is the current value of the waveform generator 
       ramp = 0;         //Set the waveform lookup table pointer to zero      
       runng = 0;      //When runng = 0, waveform data is from the lookup table, else it is the static dacset value
       stpsav = 0;      //ADC data is saved at each waveform step with this flag set to zero
                     //Setting to 512 stops ADC aquisition but not waveform generation. Stop when sending serial data
       Sine_256 ();      //Create a sine wave table
       tone(21,15360);
      gpio_set_function(miso, GPIO_FUNC_SPI);
      gpio_set_function(sck, GPIO_FUNC_SPI);
      gpio_set_function(mosi, GPIO_FUNC_SPI);
      bi_decl(bi_3pins_with_func(miso, mosi, sck, GPIO_FUNC_SPI));
      spi_init(spi0, 16000000);
      spi_set_format(spi0,16,SPI_CPOL_1 ,SPI_CPHA_1,SPI_MSB_FIRST);
      writeDAC0(2048);

      attachInterrupt(digitalPinToInterrupt(21), Pin21_Handler, RISING);
      
}

void writeDAC0(unsigned int a){
   spi_set_format(spi0,16,SPI_CPOL_1 ,SPI_CPHA_1,SPI_MSB_FIRST);
   
   rbuf[0] = (a & 0xfff) + 0x7000;
   gpio_put(sd,LOW);
   gpio_put(sd,LOW);
   spi_write16_blocking (spi0,rbuf,1); 
   gpio_put(sd,HIGH);
}


//-----------------------------------------------------------------------------
// Function PROTOTYPES
//-----------------------------------------------------------------------------

// void SYSCLK_Init (void);
// void PORT_Init (void);
// void UART0_Init (void);
// void ADC0_Init (void);
// void Timer0_Init (void);
// void inttostr(int iv);
// void print2(int ir);
// void inttobytes(int iv);
// void Sine_256 (void);
// void Triag_256 (void);
// void PSine_256 (void);
// void PTriag_256 (void);
// void NSine_256 (void);
// void NTriag_256 (void);
// void Square_256 (void);
// void PSquare_256 (void);
// void NSquare_256 (void);
// void TIMER0_ISR (void) interrupt;
// void vkputc(char cb1);
// char vkgetc(void);
//-----------------------------------------------------------------------------
// Global VARIABLES
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// MAIN Routine
//-----------------------------------------------------------------------------

void loop1() {
   char c;                            //Serial Port character storage     
   int ival;                          //Command Integer Value 
   char scmd[5];                      //Command String Value
   delay(1000);
//   vkputc(P2 & 0x3F);  //send swtich positions
   P2=(gpio_get_all()>>8)&0x3f;
   vkputc(P2);  //send swtich positions
   vkputc(BDSN);       //send unit serial number
   vkputc(131);        //send character 131 to signal processor was reset or woken from power down

//Main command interpreter loop that looks for three character ASCII command followed by 4 digit integer value
  while (1) {
    i = 0;
      while (i<3) {             //Get three command characters
       c = vkgetc();
     Serial.write(c);             //echo character 
     scmd[i] = c;
     i++;
       if (c == 10) i = 0;     //Reset if <CR> or <LF>
     if ( c == 13) i = 0;
      }
    scmd[3] = 0;             //Get up to four decimal characters and convert to integer
    ival = 0;
    i = 0;
      while (i<4) {
       c = vkgetc();
     Serial.write(c);
     Serial.write('.');          //echo character plus dot
       if (c == 10) break;    //End integer input if <CR> or <LF>
     if (c == 13) break;
     if (c <= '9')  ival = (ival*10) + (c & 15); //muliply by 10 to convert to binary
     i++;                                        //sloppy routine only checks for '9' or less
      }
     ///SerialUSB.print(scmd);  //test command input
     ///SerialUSB.print(ival); 
     
//Set Wave Type by generating a DAC function table
      if (strcmp(scmd,"WAV") == 0 ) {
      if (ival == 0) Sine_256();
      if (ival == 1) Triag_256();
      if (ival == 2) Square_256();
      if (ival == 3) PSine_256();
      if (ival == 4) PTriag_256();
      if (ival == 5) PSquare_256();
      if (ival == 6) NSine_256();
      if (ival == 7) NTriag_256();
      if (ival == 8) NSquare_256();
      };

//Set Extra Ports P1 or P3 to Data Value, can be used for control of relays etc.
      if (strcmp(scmd,"SP1") == 0 ) {
       P1 = ival & 0xFF;
      };
      
      if (strcmp(scmd,"SP3") == 0 ) {
       P3 = ival & 0xFF;
      };


//Set DAC voltage to static Value 0 to 4095
    if (strcmp(scmd,"DA0") == 0 ) {
////       IE = 0x80; //turn off timer0 interupts
      intflg = 0;
      delayMicroseconds(10);
      //pwm_set_chan_level(2,0, 1024-((ival & 4095)>>2) );
      writeDAC0((ival&4095));
     }; 
      
    if (strcmp(scmd,"DA1") == 0 ) {
     // pwm_set_chan_level(3,0, 1024-((ival & 4095)>>2) ); 
     analogWrite(14, (ival & 4095) );   
    };

//Set Step DAC Start Value 0 to 4095, zero point is 2048
      if (strcmp(scmd,"STA") == 0 ) {
       swpstart = ival;
      };
      
//Set Step DAC step size 0 to 4095, sero point is 2048
      if (strcmp(scmd,"STP") == 0 ) {
       swpstep = ival-2048;
      };

//Measure while Stepping DAC, Average 16 measurements per point and return values for up to 9999 V-I data points
    if (strcmp(scmd,"MEA") == 0 ) {
       //IE = 0x80;                    //turn off timer0 interupts to stop continuouse sweep
       intflg = 0;
       delayMicroseconds(10);
       dacset = swpstart;            //starting sweep value
       for (j = 0; j < ival; j++){   //return up to 9999 data points       
        // pwm_set_chan_level(2,0, 1024-((dacset & 4095)>>2) );  
        writeDAC0((dacset & 4095)); 
        dacset = dacset + swpstep;         //increment DAC and limit to 0-4095
        if (dacset < 0) dacset = 0;    
        if (dacset > 4095) dacset = 4095;
        delayMicroseconds(100);       // delay 100 us for settling
        if (j==0)delayMicroseconds(300); // wait on first step for large voltage settling
        data0 = 0;                      //initiallize avage value holders
        data1 = 0;
        for (i = 0; i < 16; i++) {
        //Voltage 0 read       
         data0 = data0 + analogRead(A0); //Accumulate data
        //Voltage 1 read 
         data1 = data1 + analogRead(A1); //Accumulate data
        }
         inttobytes(data0 >> 2);       //Reduce summed data to 14bits and send to serial port
         inttobytes(16384-(data1 >> 2)); 
       }
        inttobytes(P2 & 0x3F);         //Send switch position update twice
        inttobytes(P2 & 0x3F); 
        Serial.write(129);                 //Terminate with char(129) and <CR><LF> 
        Serial.write(13);
        Serial.write(10);
        //pwm_set_chan_level(2,0, 512 );
        writeDAC0(2048);         //zero dac voltage
    };

//DCM Measure Static Voltage, Measure up to 512 points and return V-I values
      if (strcmp(scmd,"DCM") == 0 ) {
////        IE = 0x80;                     //turn off timer0 interupts to stop continuous wave generator
             intflg = 0;
             delayMicroseconds(10);

        if (ival > 512) ival = 512;    //Limit to 512 points to protect memory over run
        for (i = 0; i < ival; i++) {   
        //Voltage 0 read       
         data0 = analogRead(A0); 
        //Voltage 1 read 
         data1 = analogRead(A1);
         inttobytes(data0 << 2);       //Save 12 bit data as 14-bit
         inttobytes(16384-(data1 << 2)); 
        }
        inttobytes(P2 & 0x3F);         //Send switch position twice
        inttobytes(P2 & 0x3F);    
        Serial.write(129);                  //Terminate with char(129) <CR><LF>
        Serial.write(13);
        Serial.write(10);
      };

//Scan N-data points (up to 256) of sine or triangle sweeps, return values V-I data points
      if (strcmp(scmd,"SWP") == 0 ) {
      ////IE = 0x82;                       //turn on timer0 interupts to enable continuous wave generation
      intflg = 1;
      delayMicroseconds(10);

      stpsav = 0;                     //turn on ADC read and saving data
      j = ramp;                        //find current waveform generator pointer position
      while (j == ramp);               //wait for next waveform step 
      while (j != ramp);               //wait until waveform loops back to same step
      if (ival > 256) ival = 256;      //limit data points to 256
      stpsav = 512;                   //turn off adc read and save for print out
      print2(ival);                    //send binary record of voltage and current data 
      stpsav = 0;                     //turn on adc read and save
     };

//Disable the Continuous Generator but keep aquiring data in continuous loop
//1 = disable and set DAC to static dacval, 0 = enable and use waveform table
      if (strcmp(scmd,"DIS") == 0 ) {
      runng = ival & 0x01;
      };


//Enable or Disable timer interupt  0 = off   1 = on
//With interupts disabled, the waveform generator is stopped and so is ADC data acquisition
//Turn off interupts to use the ADC in a non synchronous acqusition
//Commands DA0, MEA and DCM shut down interupts
//Command SWP turns on interupts
      if (strcmp(scmd,"INT") == 0 ) {
       if (ival == 0){  
        intflg = 0;
        delayMicroseconds(10);
       }
       else {  
        stpsav = 0;
        intflg = 1;
        delayMicroseconds(10);
       }
      };


//Reset values to initial conditions
    if (strcmp(scmd,"RST") == 0 ) {
      // pwm_set_chan_level(2,0, 512);
      //  pwm_set_chan_level(3,0, 512 );
      writeDAC0(2048);         //zero output on both DACs
      analogWrite(14,2048);
      intflg = 0; 
////          P1 = 0;                  //port-1 outputs to zero
////          P2 = 0xFF;               //port-2 set high for input state
////          P3 = 0;                  //port-3 outputs to zero
      }  

//Identify Curve Tracer S/N and Switch Settings and trigger refresh
      if (strcmp(scmd,"SER") == 0 ){
     //  vkputc(P2 & 0x3F);  //send switch settings
       P2=(gpio_get_all()>>8)&0x3f;
       vkputc(P2);  //send switch settings
       vkputc(BDSN);       //send unit serial number
       vkputc(131);       //send char(131) to signal end of serial number data
      }                   //131 will trigger user app to update state of curve tracer, use for testing boot signal  

//Identify Curve Tracer S/N Switch Settings
      if (strcmp(scmd,"SWS") == 0 ){
       P2=(gpio_get_all()>>8)&0x3f; 
       vkputc(P2);  //send switch settings
      // vkputc(P2 & 0x3F);  //send switch settings
       vkputc(BDSN);       //send unit serial number
       vkputc(132);       //send char(132) to signal end of switch data
      }

//Set Custom Wave File
      if (strcmp(scmd,"SCW") == 0 ){
       if (ival == 8192) wcnt = 0;     //if 8192, then set waveform pointer to start
       if (ival < 4096) {              //0 to 4095 is valid data point (zero is at 2048)
        if (wcnt < 0) wcnt = 0;        //limit pointer to 256 values
        if (wcnt > 255) wcnt = 255; 
        wav[wcnt++] = ival;            //save data point to waveform array and increment
       }
      }
  
 } //end of while
} // end of loop

//Convert integer to 4-digit string and print it
void inttostr(int iv) {
   char c[4];
     c[3] = (iv % 10) + '0';
   iv = iv / 10;
   c[2] = (iv % 10) + '0';
   iv = iv / 10;
   c[1] = (iv % 10) + '0';
   iv = iv / 10;
   c[0] = (iv % 10) + '0';
   iv = iv / 10;
     Serial.write(c[0]);
     Serial.write(c[1]);
     Serial.write(c[2]);
     Serial.write(c[3]);
 } 

//Print N voltage and current, values are 14-bit offset binary shifted into two 7-bit characters
void print2(int ir) {
   int i6;
   for(i6 = 0; i6 < ir; i6++){   //Loop and repeat for ir data points

   inttobytes(pv[i6]);          //Convert voltage and print in two byte format 
   inttobytes(pi[i6]);          //Convert current and print in two byte format 
   } 
//   inttobytes(P2 & 0x3F);      //Send swtich position twice
   P2=(gpio_get_all()>>8)&0x3f;
   inttobytes(P2); 
   inttobytes(P2); 
   Serial.write(129);               //terminate with char(129)<CR><LF>
   Serial.write(13);
   Serial.write(10);
}

//Takes 14-bit integer value, convertis it to two 7-bit bytes and sends the data to the serial port
void inttobytes(int iv) {
   char c[2];
     c[1] = (iv >> 7);
     c[0] = (iv & 0x7F);
     vkputc(c[1]);
     vkputc(c[0]);
 } 

//Put character routine that does not corrupt binary data by sending extra control characters
void vkputc(char cb1){
 Serial.write(cb1);
}

//Get character routine 
char vkgetc(void){
 char c; 
 //while (RI0 == 0);                    //////need to use interupt for footsw press
//  while ((SCON0 & 1) == 0) {
//   if (TMR2L != 0) {
//    TMR2L = 0;
//    vkputc(0x88);
//   }
//  }
  while (Serial.available() == 0);
  c = Serial.read();
 // RI0 = 0;
 return(c); 
}

//-----------------------------------------------------------------------------
// Sine_256  Generates Sine Wave Look Up Table Using 2-integrator oscillator
//-----------------------------------------------------------------------------
void Sine_256 (void) {
 jcnt = 2044;
 kcnt = 0;
 for (icnt = 0; icnt < 256 ; icnt++) {
  wav[icnt] = kcnt + 2048;
  jcnt = jcnt + ((kcnt*5)/201);
  kcnt = kcnt - ((jcnt*5)/201);
}
}



//-----------------------------------------------------------------------------
// Triag_256 Generates Triangle Wave Look Up Table using linear step values
//-----------------------------------------------------------------------------
void Triag_256 (void) {
 jcnt = 2048;
 kcnt = -32;
 for (icnt = 0; icnt < 256 ; icnt++) {
  wav[icnt] = jcnt;
  jcnt = jcnt + kcnt;
  if (jcnt < 0) { jcnt = 32; kcnt = 32;}
  if (jcnt > 4064) { jcnt = 4095; kcnt = -32;}
 }
}


//---------------------------------------------------------------------------------
// Square_256 Generates Square Wave Look Up Table using mid value transistion point 
//---------------------------------------------------------------------------------
void Square_256 (void) {
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = 0;
 }
 for (icnt = 128; icnt < 256 ; icnt++) {
  wav[icnt] = 4095;
 }
}

//-----------------------------------------------------------------------------
// PSine_256  Generates rectified Sine Wave Look Up Table from Sine Wave
//-----------------------------------------------------------------------------
//
void PSine_256 (void) {
 Sine_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt+128] = wav[icnt];
}
}

//------------------------------------------------------------------------------
// NSine_256 Generates negative rectified Sine Wave Look Up Table from Sine Wave
//------------------------------------------------------------------------------
//
void NSine_256 (void) {
 Sine_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = wav[icnt+128];
}
}

//------------------------------------------------------------------------------------
// PSine_Init  Generates Positive Triangle Wave Look Up Table using linear step values
//------------------------------------------------------------------------------------
//
void PTriag_256 (void) {
 Triag_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt+128] = wav[icnt];
}
}

//-----------------------------------------------------------------------------------
// NSine_256  Generates Negative Triangle Wave Look Up Table using linear step values
//-----------------------------------------------------------------------------------
//
void NTriag_256 (void) {
 Triag_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = wav[icnt+128];
}
}

//-------------------------------------------------------------------------------------------
// PSquare_256 Generates Positive Square Wave Look Up Table using mid value transistion point 
//-------------------------------------------------------------------------------------------
void PSquare_256 (void) {
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = 0;
 }
 for (icnt = 128; icnt < 256 ; icnt++) {
  wav[icnt] = 2048;
 }
}

//-------------------------------------------------------------------------------------------
// NSquare_256 Generates Negative Square Wave Look Up Table using mid value transistion point 
//-------------------------------------------------------------------------------------------
void NSquare_256 (void) {
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = 4095;
 }
 for (icnt = 128; icnt < 256 ; icnt++) {
  wav[icnt] = 2048;
 }
}
