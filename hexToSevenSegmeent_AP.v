module hexToSevenSegment_AP
(
    input wire[3:0] hexNumber,
    output wire[6:0] sevenSegmentActiveLow, sevenSegmentActiveHigh
);

reg[6:0] sevenSegment;

always @*
begin
    case(hexNumber)
        4'b0000 : sevenSegment = 7'b000_1000; // A
        4'b0001 : sevenSegment = 7'b000_1100; // P
        default : sevenSegment = 7'b000_1110; // f
    endcase;
end

assign sevenSegmentActiveLow = sevenSegment;
assign sevenSegmentActiveHigh = ~sevenSegment;

endmodule