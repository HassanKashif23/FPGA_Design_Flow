module adder(
    input clk,rst,a,b,
    output reg stream
);
    
//State Encoding

parameter C0 = 1'b0,C1 = 1'b1;

reg present_state,next_state;

//Present State Logic

always @(posedge clk or posedge rst) begin
    if (rst) begin
        present_state <= C0;
        //stream <= 0;
    end else begin
        present_state <= next_state;
    end
end

//Next State Logic

always @(*) begin
    case (present_state)
        C0 : begin
            stream = a ^ b ^ present_state;
            if (a & b) begin
                next_state = C1;
            end else begin
                next_state = C0;
            end
            end
        C1 : begin
            stream = a ^ b ^ present_state;
            if (~(a | b)) begin
                next_state = C0;
            end else begin
                next_state = C1;
            end
            end
        default : begin
            next_state = C0;
            stream = 0;
        end
    endcase
end


endmodule

