module NMS_Datapath (refScore, adjScore, refPixel, outPixel);
	input [7:0] refScore; // 기준점 Score
	input [63:0] adjScore; // 인접한 8개의 점 Score
	input [7:0] refPixel; // 기준점 데이터
	output [7:0] outPixel; // 최종 Corner 데이터

	// 인접한 8개의 점과 비교하여 기준점의 Score가 모든 인접한 점보다 크면 0xff로 최종 Corner 출력
	assign outPixel = 
		(refScore == 8'd0) ? refPixel : // Corner가 아닌 경우
		(refScore < adjScore[63:56]) ? refPixel :
		(refScore < adjScore[55:48]) ? refPixel :
		(refScore < adjScore[47:40]) ? refPixel :
		(refScore < adjScore[39:32]) ? refPixel :
		(refScore < adjScore[31:24]) ? refPixel :
		(refScore < adjScore[23:16]) ? refPixel :
		(refScore < adjScore[15:8]) ? refPixel :
		(refScore < adjScore[7:0]) ? refPixel : 8'b10100101;
endmodule 