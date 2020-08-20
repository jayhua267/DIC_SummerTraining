`timescale 1ns/10ps
module RC4(clk,rst,key_valid,key_in,plain_read,plain_in_valid,plain_in,plain_write,plain_out,cipher_write,cipher_out,cipher_read,cipher_in,cipher_in_valid,done);
    input clk,rst;
    input key_valid,plain_in_valid,cipher_in_valid;
    input [7:0] key_in,cipher_in,plain_in;
    output done;
    output plain_write,cipher_write,plain_read,cipher_read;
    output [7:0] cipher_out,plain_out;
endmodule