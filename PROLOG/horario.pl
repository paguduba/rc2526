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
	
	
	setof: cuando tenemos soluciones multiples para una consulta, las coloca todas en una sola lista
*/

:- load_files('req1.pl').
:- use_module(library(clpfd)).

requirements(Rs):-
	Goal = class_subject_teacher_times(Class, Subject, Teacher, Number),
	setof(req(Class,Subject,Teacher,Number), Goal, Rs0),
	maplist(req_with_slots, Rs0, Rs).
	
	req_with_slots(R, R-Slots):- R = req(_,_,_,N), length(Slots,N).


