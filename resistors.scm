(define temp-coef-color
  (lambda (clr)
    (cond ((equal? clr "brn") '100ppm)
	   ((equal? clr "red") '50ppm)
	   ((equal? clr "orn") '15ppm)
	   ((equal? clr "yel") '25ppm)
	   ((equal? clr "blu") '10ppm)
	   ((equal? clr "vio") '5ppm)
	   (else (display "temp-coef-color: color not found\n")))))

(define tolerance-color
  (lambda (clr)
    (cond ((equal? clr "brn") '1%)
	  ((equal? clr "red") '2%)
	  ((equal? clr "gre") '0.5%)
	  ((equal? clr "blu") '0.25%)
	  ((equal? clr "vio") '0.1%)
	  ((equal? clr "gol") '5%)
	  ((equal? clr "sil") '10%)
	  (else (display "tolerance-color: color not found\n")))))

(define multiplier-color
  (lambda (clr)
    (cond ((equal? clr "blk") 1)
	  ((equal? clr "brn") 10)
	  ((equal? clr "red") 100)
	  ((equal? clr "orn") 1000)
	  ((equal? clr "yel") 10000)
	  ((equal? clr "gre") 100000)
	  ((equal? clr "blu") 1000000)
	  ((equal? clr "vio") 10000000)
	  ((equal? clr "gol") 0.1)
	  ((equal? clr "sil") 0.01)
	  (else (display "multiplier-color: color not found")))))

(define first-bands
  (lambda (clr)
    (cond ((equal? clr "blk") 0)
	  ((equal? clr "brn") 1)
	  ((equal? clr "red") 2)
	  ((equal? clr "orn") 3)
	  ((equal? clr "yel") 4)
	  ((equal? clr "gre") 5)
	  ((equal? clr "blu") 6)
	  ((equal? clr "vio") 7)
	  ((equal? clr "gra") 8)
	  ((equal? clr "whi") 9)
	  (else (display "first-bands: color not found\n")))))

;; currently supports only 3-band resistors
;; usage example:
;; (colors-to-resistance (list "red" "blk" "red")) --> 2000 Ohm, tolerace: 20%

(define colors-to-resistance
  (lambda (lst)
    (cond ((null? lst) (display "null list\n"))
	  ((eq? (length lst) 3)
	   (let ((res (* (expt 10 (first-bands (caddr lst)))
	      (+ (* (first-bands (car lst)) 10)
		 (first-bands (cadr lst)))))
		 (tol '20%))
	     (begin (display res)
		    (display " Ohm, tolerace: ")
		    (display tol)
		    (newline))))
	  (else (display "not yet implemented\n")))))
