`timescale 1ns / 1ps

module traffic_light_controller(
    input clk,
    input reset,
    output reg [2:0] highway,
    output reg [2:0] farm
);

reg [1:0] state;

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10,
          S3 = 2'b11;

always @(posedge clk or posedge reset)
begin
    if(reset)
        state <= S0;
    else
        state <= state + 1;
end

always @(*)
begin
    case(state)

        S0:
        begin
            highway = 3'b001;
            farm = 3'b100;
        end

        S1:
        begin
            highway = 3'b010;
            farm = 3'b100;
        end

        S2:
        begin
            highway = 3'b100;
            farm = 3'b001;
        end

        S3:
        begin
            highway = 3'b100;
            farm = 3'b010;
        end

        default:
        begin
            highway = 3'b100;
            farm = 3'b100;
        end

    endcase
end

endmodule