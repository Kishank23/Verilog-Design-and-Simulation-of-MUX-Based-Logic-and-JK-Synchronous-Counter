module upcounter_testbench();
reg clk;
wire [3:0] q;
 
counter_4_bit dut(clk, q);
initial begin 
clk=0;
forever #5 clk=~clk;
end
endmodule

module jk_ff_testbench();
reg clk, j, k;
wire q;
 
 jk_behavioural dut(j, k, clk, q);
initial begin
j=0;
k=0;
clk=0;
#10
j=1;
k=0;
#10
j=0;
k=1;
#10
j=1;
k=1;
end
always #5 clk=~clk;
endmodule


module mux_32x1_testbench();
reg [31:0]a;
reg [4:0] sel;
wire y;
integer i;
mux_32x1_structural dut(a, sel, y);
initial begin
    a= 32'h865346bd;
    for(i=0;i<32;i=i+1)
    begin
        sel = i;
        #10;
    end
end
endmodule

module mux_2x1_testbench_structural();
reg a, b;
reg sel;
wire y;
mux_2x1_structural dut(a, b, sel, y);
initial begin
  a=0;
  b=0;
  sel=0;
  #10
  a=0;
  b=1;
  sel=1;
  #10
  a=1;
  b=0;
  sel=0;
  #10
  a=1;
  b=1;
  sel=1;
  
end


endmodule


module mux_2x1_testbench_behavioural();
reg a, b;
reg sel;
wire y;
mux_2x1_behavioural dut(a, b, sel, y);
initial begin
  a=0;
  b=0;
  sel=0;
  #10
  a=0;
  b=1;
  sel=1;
  #10
  a=1;
  b=0;
  sel=0;
  #10
  a=1;
  b=1;
  sel=1;
 
end
endmodule