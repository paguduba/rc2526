/*

	clase del 13 mayo:
	
	HORARIO(?
	
	La estructura de datos mas importante para resolver este ejercicio es: req - Vs
	donde "req" es un requisito(A,B,C,D...) y "vs" una lista de variables de longitud N.
	^ en nuestro caso Clase, Asignatura Profesor y Veces ^
	este ejercicio será similar a un sudoku de forma Irregular, con N variables <-- numero de veces que se imparte la asignatura a la semana
	cada hueco/slots tendra asignado un numero para identificarlo; 
		"si una asignatura se va a impartir 4 veces, su lista tendra 4 huecos"
	para romper la simetria, los elementos de vs tienen una restriccion, tienen que ser estrictamente ascendentes, y todos tienen que ser diferentes
	Ademas, el conjunto de todos los slots, todos los numeros, que los numeros se asignan no solo a las asignaturas, los numeros tambien se asignan a los profesores.
	
	Los numeros de cada slots de los profesores estan limitados para ser diferentes: un profesor no puede tener dos numeros iguales
	
	Restricciones para el requerimientos: el timeslots dividido por dia, tiene que ser forzosamente ascendente, para que sea en dias diferentes <-- esto se ignora en casos de acoplamientos(?
	
	
	setof: cuando tenemos soluciones multiples para una consulta, las coloca todas en una sola lista. NO permite duplicados
	bagof : igual que el setof, pero permite duplicados
*/

:- load_files('req1.pl').		%cargar requisitos
:- use_module(library(clpfd)).	%libreria
:- use_module(library(pairs)).	%pairs_keys()y pairs_values()

requirements(Rs):-
	Goal = class_subject_teacher_times(Class, Subject, Teacher, Number),	%
	setof(req(Class,Subject,Teacher,Number), Goal, Rs0), %es una "traduccion" de class_subject...
	maplist(req_with_slots, Rs0, Rs).
	
req_with_slots(R, R-Slots):- R = req(_,_,_,N), length(Slots,N).

/*
	2o dia: construir la estructura del sudoku
	
*/
classes(Classes):-
	setof(C, S^N^T^class_subject_teacher_times(C,S,T,N), CLasses).	%para obtener un listado de todos los grupos SIN REPETICIONES
teachers(Teachers):-
	setof(T, S^N^C^class_subject_teacher_times(C,S,T,N), Teachers).	
	
rooms(Rooms) :-
        findall(Room, room_alloc(Room,_C,_S,_Slot), Rooms0),
        sort(Rooms0, Rooms).

requirements_variables(Rs, Vars) :-
        requirements(Rs),
        pairs_slots(Rs, Vars),			 				%tendremos todas las variables en una sola lista aplanada
        slots_per_week(SPW),
        Max #= SPW - 1,
        Vars ins 0..Max,								%rango de 0 a 34 en este caso
        maplist(constrain_subject, Rs),				%aplica las restricciones de asignaturas a todos los requisitos 
        classes(Classes),				
        teachers(Teachers),
        rooms(Rooms),
        maplist(constrain_teacher(Rs), Teachers),
        maplist(constrain_class(Rs), Classes),
        maplist(constrain_room(Rs), Rooms).



slot_quotient(S, Q) :-
        slots_per_day(SPD),
        Q #= S // SPD.			

strictly_ascending(Ls) :- chain(#<, Ls).

constrain_subject(req(Class,Subj,_Teacher,_Num)-Slots) :-
        strictly_ascending(Slots), % break symmetry
        maplist(slot_quotient, Slots, Qs0),					%genera una nueva lista con los resultados(?
        findall(F-S, coupling(Class,Subj,F,S), Cs),			%busca las agrupaciones
        maplist(slots_couplings(Slots), Cs),
        pairs_values(Cs, Seconds0),
        sort(Seconds0, Seconds),
        list_without_nths(Qs0, Seconds, Qs),
        strictly_ascending(Qs).

pairs_slots(Ps, Vs) :-
        pairs_values(Ps, Vs0),
        append(Vs0, Vs).

%el chain([A,B,C], ) añade restricciones del orden de los elementos que van en la lista
