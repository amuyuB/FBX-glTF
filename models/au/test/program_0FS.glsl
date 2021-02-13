precision highp float ;
uniform vec4 u_ambient ;
uniform sampler2D u_diffuse ;
uniform vec4 u_emission ;
uniform vec3 u_light0Color ;
varying vec3 v_normal ;
varying vec3 v_position ;
uniform float u_reflectivity ;
varying vec2 v_texcoord0 ;
uniform float u_transparency ;
uniform vec4 u_transparent ;
varying vec3 v_light0Direction ;
void main (void) {
vec3 normal =normalize (v_normal) ;
vec4 color =vec4(0., 0., 0., 0.) ;
vec4 diffuse =vec4(0., 0., 0., 1.) ;
vec3 diffuseLight =vec3(0., 0., 0.) ;
vec4 emission ;
vec4 ambient ;
ambient =u_ambient ;
diffuse =texture2D (u_diffuse, v_texcoord0) ;
emission =u_emission ;
{
float specularIntensity =0. ;
float attenuation =1.0 ;
vec3 l =normalize (v_light0Direction) ;
diffuseLight +=u_light0Color * max (dot (normal, l), 0.) * attenuation ;
}
diffuse.xyz *=diffuseLight ;
color.xyz +=diffuse.xyz ;
color.xyz +=emission.xyz ;
color =vec4(color.rgb * diffuse.a, diffuse.a * u_transparency) ;
gl_FragColor =color ;
}
