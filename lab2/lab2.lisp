(defun num1 (n lis)
	(cond 
		((= n 0) lis)
		(t (num1 (- n 1) (cdr lis))) 
	)
)

(num1 3 '(2 6 1 7 0))

(defun num2 (n lis)
	(cond 
		((= n 0) lis)
		(t (num2 (- n 1) (append (cdr lis) (cons (car lis) nil))))
	)
)

(num2 3 '(1 2 3 4 5))

(defun tim (x lis) ; function of counting elements
	(cond
		((null lis) 0) ; if end of list
		((equal (car lis) x) (+ 1 (tim x (cdr lis)))) ; if x == begin of list then n++ 
		(t (tim x (cdr lis))) ; if x != begin of list
	)
)

(defun rm (x lis) ; function of delete elements
	(cond 
		((null lis) nil) ; if end of list
        ((equal x (car lis)) (rm x (cdr lis))) ; if x == begin of list then don't add element in list
        (t (cons (car lis) (rm x (cdr lis)))) ; add element in list
	)
)

(defun endcons (x lis) ; function like 'cons' but element added to the end
	(cond
		((null lis) (cons x nil)) ; if end of list then add element
		(t (cons (car lis) (endcons x (cdr lis)))) ; add elements with 'cons' 
	)
)

(defun num3 (lis &optional (answ nil))
	(cond
		((null lis) answ)
		(t (num3 (rm (car lis) lis) (endcons (list (car lis) (tim (car lis) lis)) answ)))
	)
)

(trace num3)
(num3 '(a b a a c b))
(untrace num3)

(trace rm)
(rm 'a '(a b a a c b))
(untrace rm)

(trace tim)
(tim 'a '(a b a a c b))
(untrace tim)