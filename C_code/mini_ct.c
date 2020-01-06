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

//-----------------------------------------------------------------------------
// Includes
//-----------------------------------------------------------------------------
//#pragma CODE 

#include <c8051f120.h>                 // SFR declarations
#include <stdio.h>
#include <string.h>
#include <irq52.h>

//-----------------------------------------------------------------------------
// Global CONSTANTS
//-----------------------------------------------------------------------------

//#define SYSCLK       22118400          // SYSCLK frequency in Hz
#define BDSN 1 //device serial number
//-----------------------------------------------------------------------------
// Function PROTOTYPES
//-----------------------------------------------------------------------------

void SYSCLK_Init (void);
void PORT_Init (void);
void UART0_Init (void);
void ADC0_Init (void);
void Timer0_Init (void);
void inttostr(int iv);
void print2(int ir);
void inttobytes(int iv);
void Sine_256 (void);
void Triag_256 (void);
void PSine_256 (void);
void PTriag_256 (void);
void NSine_256 (void);
void NTriag_256 (void);
void Square_256 (void);
void PSquare_256 (void);
void NSquare_256 (void);
void TIMER0_ISR (void) interrupt;
void vkputc(char cb1);
char vkgetc(void);
//-----------------------------------------------------------------------------
// Global VARIABLES
//-----------------------------------------------------------------------------

int volatile updwn;                   //Waveform generator current DAC value                
int volatile ramp;                    //Waveform generator lookup table current pointer value 
int volatile stpsav;                 //Flag to stop [512] continuous waveform data acqusition and save
int volatile dacset;                 //Last DAC0 value for manual DA0 command
int volatile swpstart;               //Starting value for DAC0 used in MEA sweep command 
int volatile swpstep;                //Step value for DAC0 used in MEA sweep command
unsigned int volatile data0, data1;   //Temporary data storage
int volatile icnt, jcnt, kcnt, wcnt;  //General Purpose Loop variables 
unsigned char volatile gain0, gain1;  //ADC gain constants
unsigned char volatile running;       //Flag to freeze running waveform
int volatile xdata pv[512];     //ADC0 voltage storage array for up to two cycles of waveform
int volatile xdata pi[512];     //ADC1 current storage array for up to two cycles of waveform
int volatile xdata wav[256];    //Waveform Look Up Table

//-----------------------------------------------------------------------------
// MAIN Routine
//-----------------------------------------------------------------------------

void main (void) {
   char c;                            //Serial Port character storage     
   int ival;                          //Command Integer Value 
   char scmd[5];                      //Command String Value
   int i, j;                          //General Purpose loop variables

   WDTCN = 0xde;                       // disable watchdog timer
   WDTCN = 0xad;

   SYSCLK_Init ();                     // initialize oscillator
   PORT_Init ();                       // initialize crossbar and GPIO
   UART0_Init ();                      // initialize UART0
   Timer0_Init ();                     // timer0 initialize
   ADC0_Init ();                       // initialize ADC
   AD0EN = 1;                          // enable ADC
   SFRPAGE   = DAC0_PAGE;              // enable both DACs
   DAC0CN    = 0x80;
   SFRPAGE   = DAC1_PAGE;
   DAC1CN    = 0x80;
   SFRPAGE   = LEGACY_PAGE;
   P2 = 0xFF;         //set open drain P2 to high state for input of switch states
   P1 = 0;			  //set output ports P1 and P3 to low					
   P3 = 0;
   P0 = P0 & 0xF7;   //P0.3 was ground reference for foot switch used on prototype board, not needed on PC board version
   updwn = 32;       //Set to any number, updwn is the current value of the waveform generator 
   ramp = 0;         //Set the waveform lookup table pointer to zero      
   running = 0;      //When running = 0, waveform data is from the lookup table, else it is the static dacset value
   stpsav = 0;      //ADC data is saved at each waveform step with this flag set to zero
                     //Setting to 512 stops ADC aquisition but not waveform generation. Stop when sending serial data
   Sine_256 ();      //Create a sine wave table
    

   IE = 0x82;        // Enable global interrupts and timer0
   TF0 = 0;
   
   vkputc(P2 & 0x3F);  //send swtich positions
   vkputc(BDSN);       //send unit serial number
   vkputc(131);        //send character 131 to signal processor was reset or woken from power down

//Main command interpreter loop that looks for three character ASCII command followed by 4 digit integer value
	while (1) {
	  i = 0;
      while (i<3) {             //Get three command characters
       c = vkgetc();
	   putchar(c);             //echo character 
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
	   putchar(c);
	   putchar('.');          //echo character plus dot
       if (c == 10) break;    //End integer input if <CR> or <LF>
	   if (c == 13) break;
	   if (c <= '9')  ival = (ival*10) + (c & 15); //muliply by 10 to convert to binary
	   i++;                                        //sloppy routine only checks for '9' or less
      }
	   
//Set Wave Type by generating a DAC function table
      if (strcmp(scmd,"WAV") == 0 ) {
      if (ival == 0) Sine_256 ();
      if (ival == 1) Triag_256();
      if (ival == 2) Square_256();
      if (ival == 3) PSine_256 ();
      if (ival == 4) PTriag_256();
      if (ival == 5) PSquare_256();
      if (ival == 6) NSine_256 ();
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
       IE = 0x80; //turn off timer0 interupts
       SFRPAGE   = DAC0_PAGE;
       dacset = ival;
 	   DAC0L = ival & 0xFF;
	   DAC0H = ival >> 8;
      };
	  if (strcmp(scmd,"DA1") == 0 ) {
	   SFRPAGE   = DAC1_PAGE;
       DAC1L = ival & 0xFF;
	   DAC1H = ival >> 8;
       SFRPAGE   = DAC0_PAGE;
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
       IE = 0x80;                    //turn off timer0 interupts to stop continuouse sweep
       dacset = swpstart;            //starting sweep value
       SFRPAGE   = DAC0_PAGE;
       for (j = 0; j < ival; j++){   //return up to 9999 data points
        DAC0L = dacset & 0xFF;       //update DAC
        DAC0H = dacset >> 8;
        dacset = dacset + swpstep;         //increment DAC and limit to 0-4095
        if (dacset < 0) dacset = 0;    
        if (dacset > 4095) dacset = 4095;
        for (i = 0; i <3000; i ++);       // delay 100 us for setting
        data0 = 0;                      //initiallize avage value holders
        data1 = 0;
        for (i = 0; i < 16; i++) {
        //Voltage 0 read       
         ADC0CF = gain0;               //Select gain
         AMX0SL = 0x00;                // Select AIN.0 as ADC mux output
         AD0INT = 0;                   // ADC0 write - b5 clear interupt
         AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
         while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
         data0 = data0 + (ADC0H << 8) + ADC0L; //Accumulate data
        //Voltage 1 read 
         ADC0CF = gain1;               //Select gain
         AMX0SL = 0x01;                // Select AIN.1 as ADC mux output
         AD0INT = 0;                   // ADC0 write - b5 clear interupt
         AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
         while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
         data1 = data1 + (ADC0H << 8) + ADC0L; //Accumulate data
        }
         inttobytes(data0 >> 2);       //Reduce summed data to 14bits and send to serial port
         inttobytes(data1 >> 2); 
       }
        inttobytes(P2 & 0x3F);         //Send switch position update twice
        inttobytes(P2 & 0x3F); 
        putchar(129);                 //Terminate with char(129) and <CR><LF> 
        putchar('\n');
        DAC0L = 0; 
        DAC0H = 0x08;                //zero dac voltage
	  };

//DCM Measure Static Voltage, Measure up to 512 points and return V-I values
      if (strcmp(scmd,"DCM") == 0 ) {
        IE = 0x80;                     //turn off timer0 interupts to stop continuous wave generator
        SFRPAGE   = DAC0_PAGE;         
        if (ival > 512) ival = 512;    //Limit to 512 points to protect memory over run
        for (i = 0; i < ival; i++) {   
        //Voltage 0 read       
         ADC0CF = gain0;               //Select gain
         AMX0SL = 0x00;                // Select AIN.0 as ADC mux output
         AD0INT = 0;                   // ADC0 write - b5 clear interupt
         AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
         while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
         data0 = (ADC0H << 8) + ADC0L; // Convert to word
        //Voltage 1 read 
         ADC0CF = gain1;               //Select gain
         AMX0SL = 0x01;                // Select AIN.1 as ADC mux output
         AD0INT = 0;                   // ADC0 write - b5 clear interupt
         AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
         while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
         data1 = (ADC0H << 8) + ADC0L; //Convert to word
         inttobytes(data0 << 2);       //Save 12 bit data as 14-bit
         inttobytes(data1 << 2); 
        }
        inttobytes(P2 & 0x3F);         //Send switch position twice
        inttobytes(P2 & 0x3F);    
        putchar(129);                  //Terminate with char(129) <CR><LF>
        putchar('\n');
      };

//Scan N-data points (up to 256) of sine or triangle sweeps, return values V-I data points
      if (strcmp(scmd,"SWP") == 0 ) {
      IE = 0x82;                       //turn on timer0 interupts to enable continuous wave generation
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
      running = ival & 0x01;
      };


//Enable or Disable timer interupt  0 = off   1 = on
//With interupts disabled, the waveform generator is stopped and so is ADC data acquisition
//Turn off interupts to use the ADC in a non synchronous acqusition
//Commands DA0, MEA and DCM shut down interupts
//Command SWP turns on interupts
      if (strcmp(scmd,"INT") == 0 ) {
      if (ival == 0)IE = 0x80; else { IE = 0x82; stpsav = 0;}
      };


//Reset values to initial conditions
	  if (strcmp(scmd,"RST") == 0 ) {
		  SFRPAGE   = DAC0_PAGE;
          DAC0L = 0;               //zero output on both DACs
	      DAC0H = 0x08;
          SFRPAGE   = DAC1_PAGE;
          DAC1L = 0;
	      DAC1H = 0x08;
    	  SFRPAGE   = DAC0_PAGE;
          P1 = 0;                  //port-1 outputs to zero
		  P2 = 0xFF;               //port-2 set high for input state
 	 	  P3 = 0;                  //port-3 outputs to zero
	      gain0 =  0x88;           //ADC gains to unity
          gain1 =  0x88;
      }  

//Set ADC gains for Voltage Measurements function not use and gain is fixed for this application
//	  if (strcmp(scmd,"GN0") == 0 ) gain0 = 0x88 + (7 & ival);
//	  if (strcmp(scmd,"GN1") == 0 ) gain1 = 0x88 + (7 & ival);

//Identify Curve Tracer S/N and Switch Settings and trigger refresh
      if (strcmp(scmd,"SER") == 0 ){
       vkputc(P2 & 0x3F);  //send switch settings
       vkputc(BDSN);       //send unit serial number
       vkputc(131);       //send char(131) to signal end of serial number data
      }                   //131 will trigger user app to update state of curve tracer, use for testing boot signal  

//Identify Curve Tracer S/N Switch Settings
      if (strcmp(scmd,"SWS") == 0 ){
       vkputc(P2 & 0x3F);  //send switch settings
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


   }
}

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
     putchar(c[0]);
     putchar(c[1]);
     putchar(c[2]);
     putchar(c[3]);
 } 

//Print N voltage and current, values are 14-bit offset binary shifted into two 7-bit characters
void print2(int ir) {
   int i6;
   for(i6 = 0; i6 < ir; i6++){   //Loop and repeat for ir data points

   inttobytes(pv[i6]);          //Convert voltage and print in two byte format 
   inttobytes(pi[i6]);          //Convert current and print in two byte format 
   } 
   inttobytes(P2 & 0x3F);      //Send swtich position twice
   inttobytes(P2 & 0x3F); 
   putchar(129);               //terminate with char(129)<CR><LF>
   putchar('\n');
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
  ES0 = 0;
  SBUF0 = cb1;
 //  while (TI0 == 0);
 while ((SCON0 & 2) == 0); 
 SCON0 &= 0xFD; 
 //TI0 = 0;
}

//Get character routine 
char vkgetc(void){
 char c; 
 ES0 = 0;
  //while (RI0 == 0);
  while ((SCON0 & 1) == 0) {
   if (TMR2L != 0) {
    TMR2L = 0;
    vkputc(0x88);
   }
  }
  c = SBUF0;
 // RI0 = 0;
 SCON0 &= 0xFE;
 return(c); 
}

//-----------------------------------------------------------------------------
// Initialization Subroutines
//-----------------------------------------------------------------------------

//-----------------------------------------------------------------------------
// SYSCLK_Init
//-----------------------------------------------------------------------------
//
// This routine initializes the system clock to use an 22.1184MHz crystal
// as its clock source.
//
void SYSCLK_Init (void)
{
     int i;                              // software timer

   char SFRPAGE_SAVE = SFRPAGE;        // Save Current SFR page




//this section for 88Mhz internal clock
  //  SFRPAGE   = CONFIG_PAGE;
 //   OSCICN    = 0x83;
 //   CCH0CN    &= ~0x20;
 //   SFRPAGE   = LEGACY_PAGE;
 //   FLSCL     = 0xB0;
 //   SFRPAGE   = CONFIG_PAGE;
//   CCH0CN    |= 0x20;
//    PLL0CN    |= 0x01;
//    PLL0DIV   = 0x05;
//    PLL0FLT   = 0x01;
//    PLL0MUL   = 0x12;
//    for (i = 0; i < 256; i++);  // Wait 5us for initialization
//    PLL0CN    |= 0x02;
//    while ((PLL0CN & 0x10) == 0);
//    CLKSEL    = 0x02;

// this selection uses the external crystal with PLL divide by 2 and multiply by 8 for 88.4736MHz
    SFRPAGE   = CONFIG_PAGE;
    OSCXCN    = 0x67;
    for (i = 0; i < 3000; i++);  // Wait 1ms for initialization
    while ((OSCXCN & 0x80) == 0);
    OSCICN    = 0x83;
    PLL0CN    = 0x04;
    CCH0CN    &= ~0x20;
    SFRPAGE   = LEGACY_PAGE;
    FLSCL     = 0xB0;
    SFRPAGE   = CONFIG_PAGE;
    CCH0CN    |= 0x20;
    PLL0CN    |= 0x01;
    PLL0DIV   = 0x02;
    PLL0FLT   = 0x07;
    PLL0MUL   = 0x08;
    for (i = 0; i < 256; i++);  // Wait 5us for initialization
    PLL0CN    |= 0x02;
    while ((PLL0CN & 0x10) == 0);
    CLKSEL    = 0x02;


   SFRPAGE = SFRPAGE_SAVE;             // Restore SFR page


}

//-----------------------------------------------------------------------------
// PORT_Init
//-----------------------------------------------------------------------------
//
// Configure the Crossbar and GPIO ports
//
void PORT_Init (void)
{
   SFRPAGE   = CONFIG_PAGE;

   XBR0    = 0x04;                     // Enable UART0
   XBR1    = 0x20;                     //enable T2 input
   XBR2    = 0x40;                     // Enable crossbar and weak pull-ups
   P0MDOUT = 0x01;                     // P0.0 is TX0 push-pull output

   P1MDOUT = 0xFF;                    // P1 push-pull outputs
   P2MDOUT = 0x00;                    // P2 open drain output set to high for input 
   P3MDOUT = 0xFF;                    // P3 push-pull outputs 

   SFRPAGE = LEGACY_PAGE;
}

//-----------------------------------------------------------------------------
// UART0_Init
//-----------------------------------------------------------------------------
//
// Configure the UART0 using Timer1, for 460800 baud and 8-N-1.
//
void UART0_Init (void)
{
   SFRPAGE   = UART0_PAGE;
   SCON0     = 0x50;

}

//-----------------------------------------------------------------------------
// ADC0_Init
//-----------------------------------------------------------------------------
//
// Configure ADC0 to use Timer3 overflows as conversion source, to
// generate an interrupt on conversion complete, and to use left-justified
// output mode.  Enables ADC end of conversion interrupt. Leaves ADC disabled.
//
void ADC0_Init (void)
{
   SFRPAGE   = ADC0_PAGE;
   ADC0CF    = 0x88;
   ADC0CN = 0xC0;                      // ADC0 enabled with sample/hold on convert command
   REF0CN = 0x03;                      // enable on-chip VREF,
                                       // enable VREF output buffer
   AMX0SL = 0x00;                      // Select AIN.0 as ADC mux input
   gain0 = 0x88;                       // Gain = 1, SAR clock = 2.4576MHz 
   gain1 = 0x88;
}

//-----------------------------------------------------------------------------
// Timer0_Init
//-----------------------------------------------------------------------------
//
// Configure Timer0 to auto-reload at interval specified by <counts> (no 
// interrupt generated) using SYSCLK as its time base.
// Configure Timer2 as counter with P0.2 as clock input. Is used for foot switch detection.
// UART clock is timer1 
void Timer0_Init (void)
{
   SFRPAGE   = TIMER01_PAGE;
    TCON      = 0x50;         //Timer0 prescale system clock by 48
    TMOD      = 0x22;         //Auto reload in 8-bit timer mode
    CKCON     = 0x12;         //Timer0 will clear interupt upon servicing call
    TL0       = 0x88;         //Set Timer0 count to -120 
    TH0       = 0x88;         //Timer0 frequency is 15360 when divided by 256 this is 60Hz
    TH1       = 0xFA;          //Timer1 auto reload value generates 460800 baud clock
//    TH1       = 0xE8;          //Timer1 auto reload value generates 115200 baud clock

    SFRPAGE   = TMR2_PAGE;
    TMR2CN    = 0x06;
    SFRPAGE   = TMR3_PAGE;
    TMR3CF    = 0x08;          //Timer3 uses system clock 
    RCAP3L    = 0xF4;          //Reload values set timer to 460800Hz
    RCAP3H    = 0xFF;          //Timer3 not used for any function

}


//-----------------------------------------------------------------------------
// Interrupt Service Routines
//-----------------------------------------------------------------------------
IRQ_VECTOR(TIMER0_ISR, 0xB);
void TIMER0_ISR (void) interrupt 
{
      SFRPAGE   = DAC0_PAGE;
     // DAC0L = 0;                   //used to test loop timing
     // DAC0H = 0x08;
      if (stpsav < 512) {           //if stpsav => 512, don't do ADC acquisition
       //Data acquistion samples voltage, current, voltage, current and averages like values
       //Voltage 0 read       
       ADC0CF = gain0;               //Select gain
       AMX0SL = 0x00;                // Select AIN.0 as ADC mux output
       AD0INT = 0;                   // ADC0 write - b5 clear interupt
       AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
       while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
       data0 = (ADC0H << 8) + ADC0L;
       //Voltage 1 read 
       ADC0CF = gain1;               //Select gain
       AMX0SL = 0x01;                // Select AIN.1 as ADC mux output
       AD0INT = 0;                   // ADC0 write - b5 clear interupt
       AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
       while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
       data1 = (ADC0H << 8) + ADC0L;
       //Voltage 0 read       
       ADC0CF = gain0;               //Select gain
       AMX0SL = 0x00;                // Select AIN.0 as ADC mux output
       AD0INT = 0;                   // ADC0 write - b5 clear interupt
       AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
       while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
       data0 = data0 + (ADC0H << 8) + ADC0L;
       //Voltage 1 read 
       ADC0CF = gain1;               //Select gain
       AMX0SL = 0x01;                // Select AIN.1 as ADC mux output
       AD0INT = 0;                   // ADC0 write - b5 clear interupt
       AD0BUSY = 1;                  // ADC0 write - b4 to 1 starts convert
       while (AD0INT == 0);          // ADC0 read - b5 to 1 end of convert
       data1 = data1 + (ADC0H << 8) + ADC0L;
       pv[ramp] = data0 << 1;        //save voltage as 14-bit data
       pi[ramp] = data1 << 1;        //save current as 14-bit data
     }
      //Waveform generation
      //Update Collector DAC0 to look up table value. If running !=0, then set it to dacset fixed value
      if ( running == 0) updwn = wav[ramp]; else updwn = dacset;
      DAC0L = updwn & 0xFF;
      DAC0H = updwn >> 8;
      ramp++;                      //point to next waveform value
      if (ramp >= 256) ramp = 0;   //waveform is 256 data point loop
}

//-----------------------------------------------------------------------------
// Sine_256  Generates Sine Wave Look Up Table Using 2-integrator oscillator
//-----------------------------------------------------------------------------
void Sine_256 (void)
{
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
void Triag_256 (void)
{
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
void Square_256 (void)
{
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
void PSine_256 (void)
{
 Sine_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt+128] = wav[icnt];
}
}

//------------------------------------------------------------------------------
// NSine_256 Generates negative rectified Sine Wave Look Up Table from Sine Wave
//------------------------------------------------------------------------------
//
void NSine_256 (void)
{
 Sine_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = wav[icnt+128];
}
}

//------------------------------------------------------------------------------------
// PSine_Init  Generates Positive Triangle Wave Look Up Table using linear step values
//------------------------------------------------------------------------------------
//
void PTriag_256 (void)
{
 Triag_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt+128] = wav[icnt];
}
}

//-----------------------------------------------------------------------------------
// NSine_256  Generates Negative Triangle Wave Look Up Table using linear step values
//-----------------------------------------------------------------------------------
//
void NTriag_256 (void)
{
 Triag_256();
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = wav[icnt+128];
}
}

//-------------------------------------------------------------------------------------------
// PSquare_256 Generates Positive Square Wave Look Up Table using mid value transistion point 
//-------------------------------------------------------------------------------------------
void PSquare_256 (void)
{
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
void NSquare_256 (void)
{
 for (icnt = 0; icnt < 128 ; icnt++) {
  wav[icnt] = 4095;
 }
 for (icnt = 128; icnt < 256 ; icnt++) {
  wav[icnt] = 2048;
 }
}