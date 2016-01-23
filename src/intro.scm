#lang racket/gui
(require (lib "graphics.ss" "graphics"))

(open-graphics)

;(define ventana (open-viewport "ThetriX" 400 200)) 

;(define ventana (open-pixmap "ThetriX" 400 200))


(define name-start "../media/img/intro/Start-sequence0")

(define (intro)
  (let (
        (ventana (open-viewport "ThetriX" 400 200))
        )
    (do (
         (frame 1 (+ 1 frame))
         (txt "")
         )
      ((> frame 59) 
       ((draw-pixmap ventana) "../media/img/intro/Start-sequence0059.png" (make-posn 0 0))
       (sleep 0.4)
       ((clear-viewport ventana))
       (sleep 0.5)
       (close-viewport ventana))
      (begin
        (when (= frame 1)
            (sleep 1)
            )
        (if (< frame 10)
            (begin
              (set! txt (string-append txt name-start))
              (set! txt (string-append txt "00"))
              (set! txt (string-append txt (number->string frame)))
              (set! txt (string-append txt ".png"))
              ((draw-pixmap ventana) txt (make-posn 0 0))
              (set! txt "")
              (sleep 0.1)
              )
            (begin
              (set! txt (string-append txt name-start))
              (set! txt (string-append txt "0"))
              (set! txt (string-append txt (number->string frame)))
              (set! txt (string-append txt ".png"))
              ((draw-pixmap ventana) txt (make-posn 0 0))
              (set! txt "")
              (sleep 0.1)
              )
            )))))

(provide (all-defined-out))
;(intro)