%H E C H O S%

%areas%
%exigentes%
area(ingenieria,exigente).
area(arquitectura,exigente).
area(diseno,exigente).
area(cienciasFisicas,exigente).
area(matematicas,exigente).
%no exigentes%
area(artes).
area(cienciaSociales).
area(economicoAdministrativas).
area(educacion).
area(humanidades).

%tareas%
%exigentes%
tarea(edicionRenderizacionVideo,exigente).
tarea(modeloDeGraficos3D,exigente).
tarea(manejoDeGranCantidadDatos,exigente).
tarea(desarrolloAppPrograms,exigente).
%no exigentes%
tarea(procesadorTexto).
tarea(hojasCalculo).
tarea(programsDisenoGrafico).
tarea(navegarXInternet).
tarea(verVideos).
tarea(enviarCorreos).
tarea(tareasOficina).


%tareaAE(X,Y) :- tarea(X,exigente), area(Y,exigente).

%tipos almacenamiento
tipoAlmacenamiento(ssd,gamaM).
tipoAlmacenamiento(hdd,gamaB).
tipoAlmacenamiento(hibrido,gamaA).


%tarjeta graficas
modelo(tarjetaGrafica,generacion,gama).
importanteRealizar(tarjetaGrafica,fotosVideosJugar).
gamaAlta(tarjetaGrafica).
gamaMedia(tarjetaGrafica).
gamaBaja(tarjetaGrafica).


%procesador
cuenta(procesador,nucleos).
cuenta(procesador,frecuenciaReloj).
/*
%RAM
capacidad(ram,8). %GB%
capacidad(ram,12).
capacidad(ram,16).
capacidad(ram,24).
velocidad(ram,2400). %MHz%
velocidad(ram,3200).*/


%PREGUNTAS
/*
• ¿En qué área te desarrollas?
• ¿Qué tareas necesitas realizar?
• ¿Qué característica prefieres más? ¿Almacenamiento, velocidad o ambos?
• ¿Con que tarea de renderizado trabajas más? ¿Edición de video o modelado 3D?
*/


%reglas
laptopGamaBaja(X) :- area(X). %R1
laptopGamaAlta(X) :- area(X,exigente). %R2

tareasNoExigentes(X) :- laptopGamaBaja(X). %R3
tareasExigentes(X) :- laptopGamaAlta(X). %R4

usuarioTExigentes(X) :- tarea(X,exigente). %R5
usuarioTNExigentes(X) :- tarea(X). %R6

laptopGamaAlta(X,Y):-area(X,exigente),gamaAlta(Y). %R7





almacenamVelocidad(X) :- X>49, X<551.
almacenamCapacidad(X) :- X>127, X<1001.

almacenamiento(X,Y,A) :- tipoAlmacenamiento(A,gamaM), almacenamVelocidad(X), almacenamCapacidad(Y), X=550, Y>=128,Y=<512. %R8 - SSD
almacenamiento(X,Y,A) :- tipoAlmacenamiento(A,gamaB), almacenamVelocidad(X), almacenamCapacidad(Y), X=150, Y=1000. %R9 - HDD
almacenamiento(X,Y,A) :- tipoAlmacenamiento(A,gamaA), almacenamVelocidad(X), almacenamCapacidad(Y). %R10 - Hibrido



% tipoHDD(X,Y) :- almacenamVelocidad(X), almacenamCapacidad(Y), X=150,Y=1000. %R11 - HDD
% tipoHibrido(X,Y) :- almacenamVelocidad(X), almacenamCapacidad(Y),X>149,X<551, Y>511,Y<1001. %R12 - Hibrido

defineGamaProcesador(X) :- cuenta(procesador,X). %R11

procesador_nucleos_frecuenciaBaja(X,Y) :- X>0,X<5, Y>0, Y<4.
procesador_nucleos_frecuenciaMedia(X,Y) :- X>3, X<9, Y>2, Y<5.
procesador_nucleos_frecuenciaAlta(X,Y) :- X>7, X<17, Y>5.

procesador_nucleos(X):- X>0,X<17.

gamaBajaProcesador(Nucleos,Frecuencia) :- procesador_nucleos_frecuenciaBaja(Nucleos,Frecuencia). %R12
gamaMediaProcesador(Nucleos,Frecuencia) :- procesador_nucleos_frecuenciaMedia(Nucleos,Frecuencia). %R13
gamaAltaProcesador(Nucleos,Frecuencia) :- procesador_nucleos_frecuenciaAlta(Nucleos,Frecuencia). %R14


procesador_DualCore(Num_nucleos) :- procesador_nucleos(Num_nucleos),Num_nucleos=2. %R15__BAJA
procesador_QuadCore(Num_nucleos):- procesador_nucleos(Num_nucleos), Num_nucleos=4. %R16__MEDIA
procesador_Multinucleos(Num_nucleos) :- procesador_nucleos(Num_nucleos), Num_nucleos>5. %R17__ALTA


gama(procesador_Multinucleos, procesador_QuadCore).
gamaas(procesador_DualCore).

utilTE(X,Y) :- gama(X,Y) . %R18
utilT(X) :- gamaas(X). %R19

tarjetaGAlta(X) :- laptopGamaAlta(X).%R20__MAL
tareasRenderizado(X) :- tarjetaGAlta(X). %R21__MAL


tar(Y) :- tarea(X,Y), tarea(X,Y).
tareass(X,Y) :- tar(Y,X). %R22
