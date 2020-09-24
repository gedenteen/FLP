(defun func1 (a) 
	(car(cdr(cdr(car(cdr a))))))

(print (caddr(cadr'(1 (2 (3 4) *) 5))))
(print (cons '(a (b c)) nil))