`timescale 1ns/10ps
module CS(Y, X, reset, clk);

input clk, reset; 
input 	[7:0] X;
output 	[9:0] Y;

//declare array of 9bit
reg [71:0] Temp;
reg [7:0] StoreTemp;
reg[7:0] A_appro; //A_Approximate
reg[11:0] sum;
reg[7:0] OldByte;
reg [9:0]Y; // output
integer i, counter;
reg [7:0] A_avg;
//wire [9:0] Y_temp;
//--------------------------------------
//  \^o^/   Write your code here~  \^o^/
//--------------------------------------

//parameter div = 18'b000111000111001000;
//assign  Y_temp =  ((A_appro*9) + sum) /8;

always@(posedge clk or posedge reset ) begin
    
    if (reset) begin
        counter <= 0;
        sum <= 0;
        Temp <= 72'b 0;
        A_appro <= 8'b 0; 
     end
     else begin
         A_appro = 0;
        OldByte =  Temp>>64;
        sum = sum - OldByte + X;
        Temp = (Temp <<8) | X;
        counter = counter + 1;
         if(counter >= 9) begin       
            A_avg = sum /9;      
            for(i=0; i<9; i = i+1)begin
                StoreTemp = (Temp<<(i*8))>>64;
                A_appro = (StoreTemp <= A_avg && StoreTemp> A_appro)?StoreTemp:A_appro;
            end
        end 
        Y = ((A_appro*9) + sum) /8 ;
    end
end

endmodule


