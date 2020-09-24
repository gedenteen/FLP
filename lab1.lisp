(print (caddr(cadr'(1 (2 (3 4) *) 5)))) ;task 1
(print (cons '(a (b c)) nil)) ;task2
(print (cons '(1) (cons '(2 3) nil))) ;task3a
(print (list '(1) '(2 3))) ;task3b

(defun repl (a) ;task4
	(append 
		(cons (car a) (cons (cadr a) nil)) ;1 and 2
		(append
			(append (cons (car (last a)) (butlast (cdddr a))))
			(cons (caddr a) nil) ; 3 element in tail 
			; without nil isn't a list ^
		)
	)
)

(defun replm (lis) ;Dmitry M. version
	(append (cons(car lis) nil) (cons (cadr lis) nil) (last lis)
	 (butlast (cdddr lis)) (cons(caddr lis) nil))
) 