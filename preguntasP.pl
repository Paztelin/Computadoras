
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


preguntas :-
        write('En que area te desarrollas? (e/n) '),
            read(Respuesta1),
        write('Que tareas vas a realizar? (e/n) '),
            read(Respuesta2),
        write('Con que tarea de renderizado trabajas mas, Edicion de video o Modelado 3D? (ev/m3d) '),
            read(Respuesta3),
        (Respuesta1 = 'e' ->
        write('\nSe recomienda una latop de gama Alta o Media');
        write('\nSe recomienda una laptop de gama Baja')
        ),
        (Respuesta2 = 'e' ->
        write('\nLas tareas que usted realizara son Exigentes');
        write('\nLas tareas que usted realizara son No son Exigentes')
        ),
        (Respuesta3 = 'ev' ->
        write('\nSe recomienda una latop de gama Alta o Media');
        write('\nSe recomienda una laptop de gama Baja')
        ).



/*SI SIRVE XD
%listing(area)
pregunta_area :-
    write('En que area te desarrollas? (e/n) '),
    read(Respuesta),
    (Respuesta = 'e' ->
        write('Se recomienda una latop de gama Alta o Media');
        write('Se recomienda una laptop de gama Baja')
    ).


%listing(tarea)
pregunta_tarea :-
    write('Que tareas vas a realizar? (e/n) '),
    read(Respuesta),
    (Respuesta = 'e' ->
        write('Las tareas que usted realizara son Exigentes');
        write('Las tareas que usted realizara son No son Exigentes')
    ).


pregunta_caracter :-
    write('Que caracteristicas prefiere, Almacenamiento, Velocidad, o Ambos? (al,ve,am) '),
    read(Respuesta),
    (Respuesta = 'al' ->
        write('Se recomienda ');
        write('Se recomienda un')
    ).


pregunta_render :-
    write('Con que tarea de renderizado trabajas mas, Edicion de video o Modelado 3D? (ev/m3d) '),
    read(Respuesta),
    (Respuesta = 'ev' ->
        write('Se recomienda una latop de gama Alta o Media');
        write('Se recomienda una laptop de gama Baja')
    ).
*/
