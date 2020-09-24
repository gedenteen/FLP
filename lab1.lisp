(defun func1 (a) 
	(car(cdr(cdr(car(cdr a))))))

(print (caddr(cadr'(1 (2 (3 4) *) 5)))) ;task 1
(print (cons '(a (b c)) nil)) ;task2
(print (cons '(1) (cons '(2 3) nil))) ;task3a
(print (list '(1) '(2 3))) ;task3b