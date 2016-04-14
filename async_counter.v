module async_counter (clock,reset,dout);

input clock,reset;
output [6:0] dout;
reg [3:0] din;
initial 
	begin
	din = 4'b0000;
	end

//always @(reset)
//	din = 4'b0000;

always @(negedge reset,negedge clock)
	if(~reset)	din[0] = 0;
	else	din[0] = ~din[0];
	
always @(negedge reset,negedge din[0])
	if(~reset)	din[1] = 0;
	else	din[1] = ~din[1];
	
always @(negedge reset,negedge din[1])
	if(~reset)	din[2] = 0;
	else	din[2] = ~din[2];
	
always @(negedge reset,negedge din[2])
	if(~reset)	din[3] = 0;
	else	din[3] = ~din[3];

assign	dout=(din==4'h0)?7'b1000000:
             (din==4'h1)?7'b1111001:
             (din==4'h2)?7'b0100100:
             (din==4'h3)?7'b0110000:
             (din==4'h4)?7'b0011001:
             (din==4'h5)?7'b0010010:
             (din==4'h6)?7'b0000010:
             (din==4'h7)?7'b1111000:
             (din==4'h8)?7'b0000000:
             (din==4'h9)?7'b0010000:
			 (din==4'hA)?7'b0001000:
			 (din==4'hB)?7'b0000011:
			 (din==4'hC)?7'b1000110:
			 (din==4'hD)?7'b0100001:
			 (din==4'hE)?7'b0000110:
			 (din==4'hF)?7'b0001110:7'b0;
endmodule