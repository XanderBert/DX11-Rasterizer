//global variables
//
float4x4 gWorldViewProj : WorldViewProjection;


struct VS_INPUT
{
	float3 Position : POSITION;
	float3 Color : COLOR;
	float2 TexCoord : TEXCOORD;
};
struct VS_OUTPUT
{
	float4 Position : SV_POSITION;
	float3 Color : COLOR;
	float2 TexCoord : TEXCOORD;
};
//------------------------------------------------
// Vertex Shader
//------------------------------------------------
VS_OUTPUT VS(VS_INPUT input)
{
	VS_OUTPUT output = (VS_OUTPUT)0;

	//multiply the World View Projection Matrix with every vertex position
	output.Position = float4(mul(float4(input.Position, 1.0f), gWorldViewProj));
	output.TexCoord = input.TexCoord;
	output.Color = input.Color;
	return output;
}
//------------------------------------------------
// Pixel Shader
//------------------------------------------------
float4 PS(VS_OUTPUT input) : SV_TARGET
{
	return float4(input.Color, 1.0f);
}
//------------------------------------------------a
// Technique
//------------------------------------------------
technique11 DefaultTechnique
{
	pass P0
	{
		SetVertexShader(CompileShader(vs_5_0, VS()));
		SetGeometryShader(NULL);
		SetPixelShader(CompileShader(ps_5_0, PS()));
		
	}
}