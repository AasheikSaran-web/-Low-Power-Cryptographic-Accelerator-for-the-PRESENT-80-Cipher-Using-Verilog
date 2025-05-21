`timescale 1ns/1ps
`define Input_Text 64'h0000000000000000
`define Key 80'h00000000000000000000
module test_bench;
reg reset_pulse=0;
wire ready;
reg clk;
wire [63:0] ciphertext;
reg [63:0] test_vector;
reg [79:0] Key_vector;
reg [3:0] count;


encrypt DUT(.plaintext(test_vector),.key(Key_vector),.reset(reset_pulse),.ready(ready),.clk(clk),.ciphertext(ciphertext));
initial
begin
clk=0;
test_vector=`Input_Text;
Key_vector=`Key;
count=0;
reset_pulse=1;
#7 reset_pulse=0;
end
initial
begin
	$dumpfile("present.vcd");
	$dumpvars(0,DUT);
	#350 $finish;
end


always
begin 
    #5 clk=~clk;
    
end
initial
begin 
repeat (35)
begin  
// $display("%d permutation_data=%h substitution_data =%h ciphertext=%h dtata=%h key=%h %b %d",$time,DUT.permutation_data,DUT.substitution_data,DUT.ciphertext,DUT.data_register,DUT.masterkey[79:16],DUT.ready,DUT.round);#10; 
$display("%d permutation_data=%h substitution_data =%h ciphertext=%h dtata=%h key=%h %b %d",$time,DUT.permutation_data,DUT.substitution_data,DUT.ciphertext,DUT.data_register,DUT.masterkey,DUT.ready,DUT.round);#10; 
end

end


endmodule
