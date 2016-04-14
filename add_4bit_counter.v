module add_4bit_counter (clock,reset,dout);

input clock,reset;
output [6:0] dout;
reg [3:0] din;
initial 
	begin
	din = 4'b0000;
	end

	
always @(negedge reset,negedge clock)
	begin
		if(~reset)	din = 4'b0000;
		else	begin 
			if(din[0]&&din[1]&&din[2]) din[3] = ~din[3];
			if(din[0]&&din[1]) din[2] = ~din[2];
			if(din[0]) din[1] = ~din[1];
			din[0] = ~din[0];	
		end	
	end

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