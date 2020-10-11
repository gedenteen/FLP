(defun task1 (A B)
	(cond
		((null A) (null B)) ;if A and B are empty, then return T
		((member (car A) B) (task1 (cdr A) (remove (car A) B :count 1))) ;if (car A) is incluned in B, then recursion
	)
)

(task1 '(a b c) '(a c b))

(defun mcar (lst) ;function of mass use car
	(cond 
		((null lst) nil)
		(t (cons (caar lst) (mcar (cdr lst))))
	)
)

(mcar '((1 2 3) (4 5 6) (7 8 9)))
  
(defun mcdr (lst) ;function of mass use cdr
	(cond 
		((null lst) nil)
		(t (cons (cdar lst) (mcdr (cdr lst))))
	)
)
 
(mcdr '((1 2 3) (4 5 6) (7 8 9)))
 
(defun task2 (matr)
	(cond 
		((null (car matr)) Nil)
		(t (cons (mcar matr) (task2 (mcdr matr))))
	)
)

(task2 '((1 2 3 4) (5 6 7 8) (9 10 11 12)))
(task2 '((a1 a2) (b1 b2) (c1 c2)))

(defun task3 (p lst)
	(cond 
		((null lst) nil)
		((funcall p (car lst)) t)
		(t (task3 p (cdr lst)))
	)
)

(task3 #'(lambda (num) (<= num 0)) '(-2 0 2))
(task3 #'(lambda (num) (<= num 0)) '(1 2 3))
(task3 #'(lambda (num) (symbolp num)) '(-5 5 a 0 b))
(task3 #'(lambda (num) (symbolp num)) '(-5 5 0 29))