module AS(sel, A, B, S, O);
input [3:0] A, B;
wire [4:0] C;
input sel;
output [3:0] S;
output O;
// reg O;

wire adder1,adder2,adder3,adder4;
    // always@(sel or A or B)
    // begin
    assign C[0] = sel;
    // $display("sel=%d", sel);
    assign adder1 = sel ^ B[0];                //XOR(adder1, sel, B[0]);
    Adder a (A[0], adder1, C[0], C[1], S[0]);
    assign adder2 = sel ^ B[1];                //XOR(adder2, sel^ B[1]);
    Adder b (A[1], adder2, C[1], C[2], S[1]);
    assign adder3 = sel ^ B[2];                //XOR(adder3, sel, B[2]);
    Adder c (A[2], adder3, C[2], C[3], S[2]);
    assign adder4 = sel ^ B[3];                //XOR(adder4, sel, B[3]);
    Adder d (A[3], adder4, C[3], C[4], S[3]);   
    assign O= C[4] ^ C[3];                     //XOR(O, C[4], C[3]);
    // end
endmodule


module Adder(A, B, Cin, Cout, sum);
    input A, B, Cin;
    output Cout, sum;
    reg func1, func2,func3,Cout,sum;
    always@(Cin or A or B)
        begin
            func1 = A ^ B;          //XOR(func1, A, B);
            sum = Cin ^ func1;      //XOR(sum, Cin, func1);
            func2= Cin & func1;     //AND(func2, Cin, func1);
            func3 = A & B;          //AND(func3,A,B);
            Cout = func2 | func3;   //OR(Cout, func2, func3);
        end
endmodule


