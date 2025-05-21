`timescale 1ns/1ps
`define Input_Text 64'h5579c1387b228445
`define Key 80'h6dab31744f41d7008759
module test_bench;
reg reset_pulse=0;
wire ready;
reg clk;
wire [63:0] plaintext;
reg [63:0] test_vector;
reg [79:0] Key_vector;
reg [3:0] count;


decrypt DUT(.ciphertext(test_vector),.key(Key_vector),.reset(reset_pulse),.ready(ready),.clk(clk),.plaintext(plaintext));
initial
begin
clk=0;
test_vector=`Input_Text;
Key_vector=`Key;
count=0;
reset_pulse=1;
#7 reset_pulse=0;
end
always
begin 
    #5 clk=~clk;
    
end
initial
begin
    $dumpfile("present_decryption.vcd");
    $dumpvars(0,DUT);
    #350 $finish;
end
initial
begin
repeat (35)
begin           
$display("%d permutation_data=%h substitution_data =%h plain text=%h dtata=%h key=%h %b %d",$time,DUT.permutation_data,DUT.substitution_data,DUT.plaintext,DUT.data_register,DUT.masterkey[79:16],DUT.ready,DUT.round);#10; 
end

end


endmodule
