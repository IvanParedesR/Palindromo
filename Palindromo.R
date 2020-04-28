#https://www.cofece.mx/wp-content/uploads/2018/10/Libro-CPC-PoderyBienestar-ver4.pdf

#/*Esta version del programa tiene la version final de las regiones geograficas (clave numerica en parentesis):
#1.- NOROESTE (seis): Baja California(2), Baja California Sur(3), Chihuahua(8), Durango(10), Sinaloa(25), Sonora(26)
#2.- NORESTE (tres): Coahuila(5), Nuevo Leon(19), Tamaulipas(28)
#3.- CENTRO_NORTE (cinco): Aguascalientes(1), Guanajuato(11), Queretaro(22), San Luis Potosi(24), Zacatecas(32)
#4.- CENTRO_SUR (tres): Ciudad de Mexico(9), Estado de Mexico(15), Morelos(17)
#5.- SUROESTE (tres): Chiapas(7), Guerrero(12), Oaxaca(20)
#6.- SURESTE (cuatro): Campeche(4), Quintana Roo(23), Tabasco(27), Yucatan(31)
#7.- OESTE (cuatro): Colima(6), Jalisco(14), Michoacan(16), Nayarit(18)
#8.- ESTE (cuatro): Hidalgo(13), Puebla(21), Tlaxcala(29), Veracruz(30)*/

tinit=hsec

INPC_octubre_2014=114.5690
INPC_octubre_2015=117.410
factor_inflac_2014=INPC_octubre_2015/INPC_octubre_2014

symmetry_imposed=1

# library optmum, pgraph
optset
#__output=0

 # /*library maxlik;*/
  
load INPP_CONSTRUCCION_46[4968,6]=inpp_construccion_46_ciudades.asc
inpp_mat_46_fecha=INPP_CONSTRUCCION_46[.,1]
inpp_mat_46_estado=INPP_CONSTRUCCION_46[.,2]
inpp_mat_46_municipio=INPP_CONSTRUCCION_46[.,3]
inpp_mat_46_latitud=INPP_CONSTRUCCION_46[.,4]*pi/180 #/*(en radianes)*/
inpp_mat_46_longitud=INPP_CONSTRUCCION_46[.,5]*pi/180 #/*(en radianes)*/
inpp_mat_46_materiales=INPP_CONSTRUCCION_46[.,6]


load INPC_46[4968,66]=inpc_46_ciudades.asc

inpc_46_fecha=INPC_46[.,1];
inpc_46_estado=INPC_46[.,2];
inpc_46_municipio=INPC_46[.,3];
inpc_46_latitud=INPC_46[.,4]*pi/180; /*(en radianes)*/
  inpc_46_longitud=INPC_46[.,5]*pi/180; /*(en radianes)*/
  inpc_46_tortilla=INPC_46[.,6];
inpc_46_pan_dulce=INPC_46[.,7];
inpc_46_pan_blanco=INPC_46[.,8];
inpc_46_pollo=INPC_46[.,9];
inpc_46_carne_res=INPC_46[.,10];
inpc_46_visceras_res=INPC_46[.,11];
inpc_46_chorizo=INPC_46[.,12];
inpc_46_jamon=INPC_46[.,13];
inpc_46_salchichas=INPC_46[.,14];
inpc_46_tocino=INPC_46[.,15];
inpc_46_leche_pasteurizada=INPC_46[.,16];
inpc_46_leche_en_polvo=INPC_46[.,17];
inpc_46_leche_evaporada=INPC_46[.,18];
inpc_46_queso_fresco=INPC_46[.,19];
inpc_46_queso_oaxaca=INPC_46[.,20];
inpc_46_crema_de_leche=INPC_46[.,21];
inpc_46_queso_manchego=INPC_46[.,22];
inpc_46_mantequilla=INPC_46[.,23];
inpc_46_queso_amarillo=INPC_46[.,24];
inpc_46_huevo=INPC_46[.,25];
inpc_46_manzana=INPC_46[.,26];
inpc_46_platano=INPC_46[.,27];
inpc_46_aguacate=INPC_46[.,28];
inpc_46_papaya=INPC_46[.,29];
inpc_46_naranja=INPC_46[.,30];
inpc_46_limon=INPC_46[.,31];
inpc_46_melon=INPC_46[.,32];
inpc_46_uva=INPC_46[.,33];
inpc_46_pera=INPC_46[.,34];
inpc_46_guayaba=INPC_46[.,35];
inpc_46_durazno=INPC_46[.,36];
inpc_46_sandia=INPC_46[.,37];
inpc_46_pina=INPC_46[.,38];
inpc_46_jitomate=INPC_46[.,39];
inpc_46_papa=INPC_46[.,40];
inpc_46_cebolla=INPC_46[.,41];
inpc_46_tomate_verde=INPC_46[.,42];
inpc_46_lechuga_col=INPC_46[.,43];
inpc_46_calabacita=INPC_46[.,44];
inpc_46_zanahoria=INPC_46[.,45];
inpc_46_chile_serrano=INPC_46[.,46];
inpc_46_nopales=INPC_46[.,47];
inpc_46_chayote=INPC_46[.,48];
inpc_46_chile_poblano=INPC_46[.,49];
inpc_46_pepino=INPC_46[.,50];
inpc_46_ejotes=INPC_46[.,51];
inpc_46_chicharo=INPC_46[.,52];
inpc_46_frijol=INPC_46[.,53];
inpc_46_jugos_nectares=INPC_46[.,54];
inpc_46_refrescos=INPC_46[.,55];
inpc_46_agua_embotellada=INPC_46[.,56];
inpc_46_antibioticos=INPC_46[.,57];
inpc_46_cardiovasculares=INPC_46[.,58];
inpc_46_analgesicos=INPC_46[.,59];
inpc_46_nutricionales=INPC_46[.,60];
inpc_46_gastrointestinales=INPC_46[.,61];
inpc_46_antigripales=INPC_46[.,62];
inpc_46_medicina_tos=INPC_46[.,63];
inpc_46_medicina_piel=INPC_46[.,64];
inpc_46_autobus_foraneo=INPC_46[.,65];
inpc_46_transporte_aereo=INPC_46[.,66];

load PRECIOS_PROMEDIO_46[46,70]=precios_promedio_46_ciudades_junio_2011.asc; 

precios_46_estado=PRECIOS_PROMEDIO_46[.,1];
precios_46_municipio=PRECIOS_PROMEDIO_46[.,2];
precios_46_latitud=PRECIOS_PROMEDIO_46[.,3]*pi/180; /*(en radianes)*/
precios_46_longitud=PRECIOS_PROMEDIO_46[.,4]*pi/180; /*(en radianes)*/
precios_46_tortillas=PRECIOS_PROMEDIO_46[.,5];
precios_46_pan_blanco=PRECIOS_PROMEDIO_46[.,6];
precios_46_pan_dulce=PRECIOS_PROMEDIO_46[.,7];
precios_46_pollo_entero=PRECIOS_PROMEDIO_46[.,8];
precios_46_pollo_piezas=PRECIOS_PROMEDIO_46[.,9];
precios_46_huevo=PRECIOS_PROMEDIO_46[.,10];
precios_46_bistec_res=PRECIOS_PROMEDIO_46[.,11];
precios_46_molida_res=PRECIOS_PROMEDIO_46[.,12];
precios_46_visceras_res=PRECIOS_PROMEDIO_46[.,13];
precios_46_chorizo=PRECIOS_PROMEDIO_46[.,14];
precios_46_jamon=PRECIOS_PROMEDIO_46[.,15];
precios_46_salchichas=PRECIOS_PROMEDIO_46[.,16];
precios_46_tocino=PRECIOS_PROMEDIO_46[.,17];
precios_46_leche_pasteurizada=PRECIOS_PROMEDIO_46[.,18];
precios_46_leche_en_polvo=PRECIOS_PROMEDIO_46[.,19];
precios_46_leche_maternizada=PRECIOS_PROMEDIO_46[.,20];
precios_46_leche_condensada=PRECIOS_PROMEDIO_46[.,21];
precios_46_queso_fresco=PRECIOS_PROMEDIO_46[.,22];
precios_46_queso_oaxaca=PRECIOS_PROMEDIO_46[.,23];
precios_46_queso_amarillo=PRECIOS_PROMEDIO_46[.,24];
precios_46_crema_de_leche=PRECIOS_PROMEDIO_46[.,25];
precios_46_mantequilla=PRECIOS_PROMEDIO_46[.,26];
precios_46_manzana=PRECIOS_PROMEDIO_46[.,27];
precios_46_platanos=PRECIOS_PROMEDIO_46[.,28];
precios_46_aguacate=PRECIOS_PROMEDIO_46[.,29];
precios_46_papaya=PRECIOS_PROMEDIO_46[.,30];
precios_46_naranja=PRECIOS_PROMEDIO_46[.,31];
precios_46_limon=PRECIOS_PROMEDIO_46[.,32];
precios_46_melon=PRECIOS_PROMEDIO_46[.,33];
precios_46_uvas=PRECIOS_PROMEDIO_46[.,34];
precios_46_pera=PRECIOS_PROMEDIO_46[.,35];
precios_46_guayaba=PRECIOS_PROMEDIO_46[.,36];
precios_46_sandia=PRECIOS_PROMEDIO_46[.,37];
precios_46_pina=PRECIOS_PROMEDIO_46[.,38];
precios_46_jitomate=PRECIOS_PROMEDIO_46[.,39];
precios_46_papa=PRECIOS_PROMEDIO_46[.,40];
precios_46_cebolla=PRECIOS_PROMEDIO_46[.,41];
precios_46_tomate_verde=PRECIOS_PROMEDIO_46[.,42];
precios_46_col=PRECIOS_PROMEDIO_46[.,43];
precios_46_lechuga=PRECIOS_PROMEDIO_46[.,44];
precios_46_calabacita=PRECIOS_PROMEDIO_46[.,45];
precios_46_zanahoria=PRECIOS_PROMEDIO_46[.,46];
precios_46_chile_serrano=PRECIOS_PROMEDIO_46[.,47];
precios_46_nopales=PRECIOS_PROMEDIO_46[.,48];
precios_46_chayote=PRECIOS_PROMEDIO_46[.,49];
precios_46_chile_poblano=PRECIOS_PROMEDIO_46[.,50];
precios_46_pepino=PRECIOS_PROMEDIO_46[.,51];
precios_46_ejotes=PRECIOS_PROMEDIO_46[.,52];
precios_46_chicharo=PRECIOS_PROMEDIO_46[.,53];
precios_46_frijol=PRECIOS_PROMEDIO_46[.,54];
precios_46_jugos_nectares=PRECIOS_PROMEDIO_46[.,55];
precios_46_refrescos_envasados=PRECIOS_PROMEDIO_46[.,56];
precios_46_agua_embotellada=PRECIOS_PROMEDIO_46[.,57];
precios_46_antibioticos=PRECIOS_PROMEDIO_46[.,58];
precios_46_cardiovasculares=PRECIOS_PROMEDIO_46[.,59];
precios_46_analgesicos=PRECIOS_PROMEDIO_46[.,60];
precios_46_nutricionales=PRECIOS_PROMEDIO_46[.,61];
precios_46_gastrointestinales=PRECIOS_PROMEDIO_46[.,63];
precios_46_antigripales=PRECIOS_PROMEDIO_46[.,64];
precios_46_medicinas_tos=PRECIOS_PROMEDIO_46[.,67];
precios_46_medicinas_piel=PRECIOS_PROMEDIO_46[.,68];
precios_46_autobus_foraneo=PRECIOS_PROMEDIO_46[.,69];
precios_46_transporte_aereo=PRECIOS_PROMEDIO_46[.,70];
precios_46_materiales=ones(46,1)*100;
fecha_2011=2011.06;
fecha_inicial_2014=2014.08;
fecha_final_2014=2014.11;
P_46_tortillas_2014=zeros(46,1);
P_46_pan_blanco_2014=zeros(46,1);
P_46_pan_dulce_2014=zeros(46,1);
P_46_pollo_entero_2014=zeros(46,1);
P_46_pollo_piezas_2014=zeros(46,1);
P_46_huevo_2014=zeros(46,1);
P_46_bistec_res_2014=zeros(46,1);
P_46_molida_res_2014=zeros(46,1);
P_46_visceras_res_2014=zeros(46,1);
P_46_chorizo_2014=zeros(46,1);
P_46_jamon_2014=zeros(46,1);
P_46_salchichas_2014=zeros(46,1);
P_46_tocino_2014=zeros(46,1);
P_46_leche_pasteurizada_2014=zeros(46,1);
P_46_leche_en_polvo_2014=zeros(46,1);
P_46_leche_maternizada_2014=zeros(46,1);
P_46_leche_condensada_2014=zeros(46,1);
P_46_queso_fresco_2014=zeros(46,1);
P_46_queso_oaxaca_2014=zeros(46,1);
P_46_queso_amarillo_2014=zeros(46,1);
P_46_crema_de_leche_2014=zeros(46,1);
P_46_mantequilla_2014=zeros(46,1);
P_46_manzana_2014=zeros(46,1);
P_46_platanos_2014=zeros(46,1);
P_46_aguacate_2014=zeros(46,1);
P_46_papaya_2014=zeros(46,1);
P_46_naranja_2014=zeros(46,1);
P_46_limon_2014=zeros(46,1);
P_46_melon_2014=zeros(46,1);
P_46_uvas_2014=zeros(46,1);
P_46_pera_2014=zeros(46,1);
P_46_guayaba_2014=zeros(46,1);
P_46_sandia_2014=zeros(46,1);
P_46_pina_2014=zeros(46,1);
P_46_jitomate_2014=zeros(46,1);
P_46_papa_2014=zeros(46,1);
P_46_cebolla_2014=zeros(46,1);
P_46_tomate_verde_2014=zeros(46,1);
P_46_col_2014=zeros(46,1);
P_46_lechuga_2014=zeros(46,1);
P_46_calabacita_2014=zeros(46,1);
P_46_zanahoria_2014=zeros(46,1);
P_46_chile_serrano_2014=zeros(46,1);
P_46_nopales_2014=zeros(46,1);
P_46_chayote_2014=zeros(46,1);
P_46_chile_poblano_2014=zeros(46,1);
P_46_pepino_2014=zeros(46,1);
P_46_ejotes_2014=zeros(46,1);
P_46_chicharo_2014=zeros(46,1);
P_46_frijol_2014=zeros(46,1);
P_46_jugos_nectares_2014=zeros(46,1);
P_46_refrescos_envasados_2014=zeros(46,1);
P_46_agua_embotellada_2014=zeros(46,1);
P_46_antibioticos_2014=zeros(46,1);
P_46_cardiovasculares_2014=zeros(46,1);
P_46_analgesicos_2014=zeros(46,1);
P_46_nutricionales_2014=zeros(46,1);
P_46_gastrointestinales_2014=zeros(46,1);
P_46_antigripales_2014=zeros(46,1);
P_46_medicinas_tos_2014=zeros(46,1);
P_46_medicinas_piel_2014=zeros(46,1);
P_46_autobus_foraneo_2014=zeros(46,1);
P_46_transporte_aereo_2014=zeros(46,1);
P_46_materiales_2014=zeros(46,1);
