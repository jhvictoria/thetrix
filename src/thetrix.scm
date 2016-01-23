#lang racket/gui
(require (lib "graphics.ss" "graphics"))
(require "tad-lista.scm")
(require "intro.scm")

;\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ ENTORNO GRAFICO ///////////////////////////////////////////////
 
(define filas 0)
(define columnas 0)
(define x-m 1)
(define y-m 1)
(define color null)
(define color2 null)
(define color3 null) ; color 3 y 4 sirven para guardar los colores de la siguiente figura a dibujar
(define color4 null)
(define nivel 1)
(define x 0)
(define y 0)
(define bgcolor (make-rgb 0 0 0.3))
(define y-caida 0)
(define ficha #f) ;Guarda la ficha que va a caer.
(define start-pos 'cen)
(define puntaje 0)

(define figura-tmp null)
(define n-ficha null)
(define figura-actual null)
(define lista-de-0 null)
(define matriz (tad-lista))
(define dim 20)
(define lista-pos-elim (tad-lista))   ; Guarda las posici�nes en el eje y en que "borrar-unos" Elimin� una fila.
(define game-over #f)


; Construye una matriz de ceros y unos (figura j); Y se hace un set a la variable "color" y "color2" para guardar registro del color (azul) para pintarse en el mundo. 
(define (figura-j) 
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        (l3 (tad-lista))
        )
    ((l1 'anexar) 0)
    ((l1 'anexar) 1)
    ((l1 'prim))
    ((l2 'anexar) 0)
    ((l2 'anexar) 1)
    ((l2 'prim))
    ((l3 'anexar) 1)
    ((l3 'anexar) 1)
    ((l3 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    ((lista 'anexar) l3)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 'j)
    ))


; Construye una matriz de ceros y dos (figura l); Y se hace un set a la variable "color" y "color2" para guardar registro del color (verde) para pintarse en el mundo.
(define (figura-l)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        (l3 (tad-lista))
        )
    ((l1 'anexar) 2)
    ((l1 'anexar) 0)
    ((l1 'prim))
    ((l2 'anexar) 2)
    ((l2 'anexar) 0)
    ((l2 'prim))
    ((l3 'anexar) 2)
    ((l3 'anexar) 2)
    ((l3 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    ((lista 'anexar) l3)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 'l)
    ))

; Construye una matriz de ceros y tres (figura t); Y se hace un set a la variable "color" y "color2" para guardar registro del color (rojo) para pintarse en el mundo.
(define (figura-t)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        )
    ((l1 'anexar) 3)
    ((l1 'anexar) 3)
    ((l1 'anexar) 3)
    ((l1 'prim))
    ((l2 'anexar) 0)
    ((l2 'anexar) 3)
    ((l2 'anexar) 0)
    ((l2 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 't)
    ))


; Construye una matriz de ceros y cuatros (figura s); Y se hace un set a la variable "color" y "color2" para guardar registro del color (amarillo) para pintarse en el mundo.
(define (figura-s)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        )
    ((l1 'anexar) 0)
    ((l1 'anexar) 4)
    ((l1 'anexar) 4)
    ((l1 'prim))
    ((l2 'anexar) 4)
    ((l2 'anexar) 4)
    ((l2 'anexar) 0)
    ((l2 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 's)
    ))


; Construye una matriz de ceros y cincos (figura z); Y se hace un set a la variable "color" y "color2" para guardar registro del color (blanco) para pintarse en el mundo.
(define (figura-z)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista)) 
        )
    ((l1 'anexar) 5)
    ((l1 'anexar) 5)
    ((l1 'anexar) 0)
    ((l1 'prim))
    ((l2 'anexar) 0)
    ((l2 'anexar) 5)
    ((l2 'anexar) 5)
    ((l2 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 'z)
    ))


; Construye una matriz de ceros y seis (figura s); Y se hace un set a la variable "color" y "color2" para guardar registro del color (morado) para pintarse en el mundo.
(define (figura-o)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        )
    ((l1 'anexar) 6)
    ((l1 'anexar) 6)
    ((l1 'prim))
    ((l2 'anexar) 6)
    ((l2 'anexar) 6)
    ((l2 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 'o)
    ))

; Construye una matriz de ceros y sietes (figura i); Y se hace un set a la variable "color" y "color2" para guardar registro del color (negro) para pintarse en el mundo.
(define (figura-i)
  (let (
        (lista (tad-lista))
        (l1 (tad-lista))
        (l2 (tad-lista))
        (l3 (tad-lista))
        (l4 (tad-lista))
        )
    ((l1 'anexar) 7)
    ((l1 'prim))
    ((l2 'anexar) 7)
    ((l2 'prim))
    ((l3 'anexar) 7)
    ((l3 'prim))
    ((l4 'anexar) 7)
    ((l4 'prim))
    ((lista 'anexar) l1)
    ((lista 'anexar) l2)
    ((lista 'anexar) l3)
    ((lista 'anexar) l4)
    lista
    (set! figura-tmp lista)
    (set! n-ficha 'i)
    ))


; Recibe cualquier matriz y la imprime
(define (imprimir-figura m) 
   ((m 'prim))
   (do ()
     (((m 'indef)) ((m 'prim)))
     ((((m 'info)) 'prim))
     ((m 'sig))
     )
   (do ()
     (((m 'indef)) ((m 'prim)))
     ((((m 'info)) 'imprimir))
     ((m 'sig))
     (newline)
     ))

; El parametro direccion se utiliza para identificar el lado hacia donde va a girar la matriz de la figura, si recibe anexar girar� hacia la izquierda y si recibe insertar, girar� hacia la derecha.
 (define (girar dir)
   (let (
         (l1 (tad-lista))
         (l2 (tad-lista))
         (l3 (tad-lista))
         (l4 (tad-lista))
         (antidir null)
         (direccion null)
         )
     (if (eq? dir 'izquierda)
         (begin
           (set! antidir 'insertar)
           (set! direccion 'anexar)
           )
         (begin
           (set! antidir 'anexar)
           (set! direccion 'insertar)
           )
         )
     
     ((figura-actual 'prim))  
     ; Este do coloca todas las ventanas del info de la figura en la primera posicion
     (do (
          (cont (tam-y-fig) (- cont 1))
          )
       ((eq? cont 0) ((figura-actual 'prim)))
       ((((figura-actual 'info)) 'prim))
       ((figura-actual 'sig))
       )
     ; Coloca la primera columna de la matriz de la figura en la ultima fila de la nueva matriz sucesivamente hasta indefinir la matriz de la figura y la nueva matriz es seteada a "figura-actual"
     (do ()  
       (((figura-actual 'indef)))
       ((l1 direccion) ((((figura-actual 'info)) 'info)))
       ((((figura-actual 'info)) 'sig))
       ((figura-actual 'sig))
       )
     ((l1 'prim))
     ((figura-actual 'prim))
     
     (when (not ((((figura-actual 'info)) 'indef)))
         (begin
           (do ()
             (((figura-actual 'indef)))
             ((l2 direccion) ((((figura-actual 'info)) 'info)))
             ((((figura-actual 'info)) 'eliminar))
             ((figura-actual 'sig))
             )
           ((l2 'prim))
           ((figura-actual 'prim))
           (when (not ((((figura-actual 'info)) 'indef)))
               (begin
                 (do ()
                   (((figura-actual 'indef)))
                   ((l3 direccion) ((((figura-actual 'info)) 'info)))
                   ((((figura-actual 'info)) 'eliminar))
                   ((figura-actual 'sig))
                   )
                 ((l3 'prim))
                 ((figura-actual 'prim))
                 (when (not ((((figura-actual 'info)) 'indef)))
                     (begin
                       (do ()
                         (((figura-actual 'indef)))
                         ((l4 direccion) ((((figura-actual 'info)) 'info)))
                         ((((figura-actual 'info)) 'eliminar))
                         ((figura-actual 'sig))
                         )
                       ((l4 'prim))
                       ((figura-actual 'prim))
                       )
                     )
                 )
               )
           )
         )
     
     ((figura-actual 'prim)) 
    
     (set! figura-actual (tad-lista))
     
     ((figura-actual antidir) l1)
     (when (not (eq? ((l2 'longitud)) 0))
         (begin
           ((figura-actual antidir) l2)
           (when (not (eq? ((l3 'longitud)) 0))
               (begin
                 ((figura-actual antidir) l3)
                 (when (not (eq? ((l4 'longitud)) 0))
                     (begin
                       ((figura-actual antidir) l4)
                       )
                     )
                 )
               )
           )
         )
     ((figura-actual 'prim))
     )
   )
 
 
 ; Esta es una funcion auxiliar que copia una lista
 (define (copia lista)
   (let (
         (listacopia (tad-lista))
         )
     ((lista 'prim))
     (do ()
       (((lista 'indef)) (begin
                           ((listacopia 'prim))
                           ((lista 'prim))
                           listacopia))
       ((listacopia 'anexar) ((lista 'info)))
       ((lista 'sig))
       )
     )
   )
 
 
; Se hace el llamado a la funcion "copia" y construye el mundo 
(define (mundo filas columnas)
   (let (
         (lista-columnas (tad-lista))
         (lista-mundo (tad-lista))
         )
     (do ()
       ((eq? columnas 0) (begin
                           ((lista-columnas 'prim))
                           (set! lista-de-0 (copia lista-columnas)) 
                           (do()
                             ((eq? filas 0) (begin
                                              ((lista-mundo 'prim))
                                             lista-mundo
                                              ))
                             ((lista-mundo 'anexar) (copia lista-columnas))
                             (set! filas (- filas 1)))))
       ((lista-columnas 'anexar) 0)
       (set! columnas (- columnas 1))
       ))
   )





 ; Da el tama�o horizontal de la figura   
 (define (tam-x-fig)
   ((((figura-actual 'info)) 'longitud))
   )
 
 
  ; Da el tama�o vertical de la figura
 (define (tam-y-fig)
   ((figura-actual 'longitud))
   )
 
 
 
 ; Guarda en figura-tmp una figura de forma aleatoria
 (define (aleatoria)
   (let ( (a (+ (random 7) 1))
          )
     (cond
       [(= a 1) (figura-j)]
       [(= a 2) (figura-l)]
       [(= a 3) (figura-t)]
       [(= a 4) (figura-s)]
       [(= a 5) (figura-z)]
       [(= a 6) (figura-o)]
       [else (figura-i)])))
 
 
 
 ;Ubicar la ventana en la posicion x
 (define (matriz-ventanas-x pos-x)
   (when (>= pos-x 0)
       (begin
         ((matriz 'prim))
         (do ()
           (((matriz 'indef)) )
           ((((matriz 'info)) 'prim))
           ((matriz 'sig))
           )
         ((matriz 'prim))
         (do ()
           (((matriz 'indef)) ((matriz 'prim)))
           ((((matriz 'info)) 'prim))
           (do (
          (i (/ pos-x dim) (- i 1))
          )
             ((eq? i 0) )
             ((((matriz 'info)) 'sig))
             )
           ((matriz 'sig))
           )
         ) 
       )
   )
   
 
 
 ; Elimina una lista llena de numeros diferentes de ceros, es decir, elimina una linea en la matriz
 (define (borrar-unos)
  ((lista-pos-elim 'prim))
   ((matriz 'prim))
  (matriz-ventanas-x 0)
   (do ( 
        (cont-y 1 (+ cont-y 1))
        (cont 0) 
        (parada false)
         )
     (((matriz 'indef)) (begin
                          ((matriz 'prim))
                          (do ()
                            ((= cont 0))
                            ((lista-de-0 'prim))
                            ((matriz 'insertar) (copia lista-de-0))
                            (set! cont (- cont 1))
                            )
                            (matriz-ventanas-x 0)
                            ((matriz 'prim))
                            ))
     (do ( (parada2 false))
       ((or parada2 ((((matriz 'info)) 'indef))) 
        (begin
          ((((matriz 'info)) 'prim))
          (set! parada parada2))
        )
       (if (not (eq? 0 ((((matriz 'info)) 'info))))
           ((((matriz 'info)) 'sig))
           (set! parada2 true)
           )
       )
     (if (eq? parada #f)
         (begin
           ((lista-pos-elim 'anexar)  cont-y)
           ((matriz 'eliminar))
           (set! cont (+ 1 cont))
           )
         ((matriz 'sig))
         )
     )
   )
 

; Inserta la matriz de la figura en la matriz del mundo en la posicion i y j determinadas por el modo gr�fico
(define (agregar-ficha-mundo i j)
   (let (
         (posx (/ (- i 150) dim))
         (posy (/ (- j 130) dim))
         )
     ((matriz 'prim))
     (matriz-ventanas-x (- i 150))
     (do (
          (pos-y posy (- pos-y 1))
          )
       ((eq? pos-y 1))
       ((matriz 'sig))
       )
     ((figura-actual 'ult))
     ((((figura-actual 'info)) 'prim))
     (do ()
         ((or ((figura-actual 'indef)) ((matriz 'indef))) (begin
                                                            (when ((matriz 'indef))
                                                              (set! game-over #t)
                                                              )
                                                            (matriz-ventanas-x 0)
                                                            ((matriz 'prim))
                                                              ))
       (do (
            (cont (tam-x-fig) (- cont 1))
            )
         ((= cont 0) ((((figura-actual 'info)) 'prim)))
         (when (not (eq? ((((figura-actual 'info)) 'info)) 0))
             (begin
               ((((matriz 'info)) 'anexar) ((((figura-actual 'info)) 'info)))
               ((((matriz 'info)) 'ant))
               ((((matriz 'info)) 'eliminar))
               )
             )
         ((((figura-actual 'info)) 'sig))
         ((((matriz 'info)) 'sig))
         )
       ((figura-actual 'ant))
       (when (not ((figura-actual 'indef)))
           ((((figura-actual 'info)) 'prim))
           )
       ((matriz 'ant))
       )
     )
  )


; las variables i, j son variables determinadas por el entorno gr�fico, Verifica si la ficha puede caer
 (define (puede-abajo? i j)
   (let ((res true))
     ((matriz 'prim))
     ;pone las ventanitas en la posici�n de la figura
     (matriz-ventanas-x (- i 150))
     ;pone la ventana de la matriz en la posicion siguiente de donde va la figura para poder evaluar si se puede o no
     (do (
          (posy (/ (- j 130) dim) (- posy 1))
          )
       ((eq? posy 0) )
       ((matriz 'sig))
       )
     
     
     (when ((matriz 'indef))
         (set! res false)
         )
     ((figura-actual 'ult))
     ((((figura-actual 'info)) 'prim))
    ;evaluacion devuelve un boolenao
     (do ()
       (((figura-actual 'indef)) res)
       (do ()
         ((or ((((figura-actual 'info)) 'indef)) (eq? res false)) (begin
                                                                    (when (not ((matriz 'indef)))
                                                                        ((((matriz 'info)) 'prim))
                                                                        )
                                                                    ((((figura-actual 'info)) 'prim))
                                                                    ))
         (if (eq? ((((matriz 'info)) 'info)) 0)
             (begin 
               ((((matriz 'info)) 'sig))
               ((((figura-actual 'info)) 'sig))
               )
             (if (eq? ((((figura-actual 'info)) 'info)) 0)
                 (begin
                   ((((matriz 'info)) 'sig))
                   ((((figura-actual 'info)) 'sig))
                   )
                 (set! res false)
                 ))
         (when ((((matriz 'info)) 'indef))
             (when (not ((((figura-actual 'info)) 'indef)))
                 (set! res false)
                 )
             )
         )
       ((figura-actual 'ant))
       ((matriz 'ant))
     )))

; Verifica si la figura puede moverse a la derecha despues del evento del teclado, devuelve un booleano respondiendo a la pregunta
 (define (puede-derecha? i j)
  ((figura-actual 'prim))
  (matriz-ventanas-x (+ (- i 150) (* (tam-x-fig) dim)))
  ((matriz 'prim))
  (if ((((matriz 'info)) 'indef))
      #f
      (begin
        (do (
             (cont (/ (- j 130) dim) (- cont 1))
             )
          ((= cont 1))
          ((matriz 'sig))
          )
        ((figura-actual 'ult))
        (do (
             (res #t)
             )
          ((or (eq? res #f) ((figura-actual 'indef))) (begin
                                                        ((matriz 'prim))
                                                        ((figura-actual 'ult))
                                                        res
                                                        )
                                                      )
          ((((figura-actual 'info)) 'ult))
          (do ( (c 0 (add1 c)) )
            ((or (eq? res #f) ((((figura-actual 'info)) 'indef))))
            (if (= ((((matriz 'info)) 'info)) 0)
                (begin
                  ((((matriz 'info)) 'ant))
                  ((((figura-actual 'info)) 'ant))
                  )
                (if (= ((((figura-actual 'info)) 'info)) 0)
                    (begin
                      ((((matriz 'info)) 'ant))
                      ((((figura-actual 'info)) 'ant))
                      )
                    (set! res #f)
                    )
                )
            )
          ((((figura-actual 'info)) 'prim))
          ((figura-actual 'ant))
          ((matriz 'ant))
          )
        )
      )
  )
  
  
; Verifica si la ficha puede overse a la izquierda depsues del evento del teclado, devuelve un booleano respondiendo a la pregunta
(define (puede-izquierda? i j)
  ;((figura-actual 'prim))
  (matriz-ventanas-x (- (- i 150) dim)) 
  ((matriz 'prim))
  (if ((((matriz 'info)) 'indef))
      #f
      (begin
        (do (
             (cont (/ (- j 130) dim) (- cont 1))
             )
          ((= cont 1))
          ((matriz 'sig))
          )
        ((figura-actual 'ult))
        (do (
             (res #t)
             )
          ((or (eq? res #f) ((figura-actual 'indef))) (begin
                                                        ((matriz 'prim))
                                                        ((figura-actual 'ult))
                                                        res
                                                        )
                                                      )
          ((((figura-actual 'info)) 'prim))
          (do ()
            ((or (eq? res #f) ((((figura-actual 'info)) 'indef))))
            (if (= ((((matriz 'info)) 'info)) 0)
                (begin
                  ((((matriz 'info)) 'sig))
                  ((((figura-actual 'info)) 'sig))
                  )
                (if (= ((((figura-actual 'info)) 'info)) 0)
                    (begin
                      ((((matriz 'info)) 'sig))
                      ((((figura-actual 'info)) 'sig))
                      )
                    (set! res #f)
                        )
                )
            )
          ((((figura-actual 'info)) 'prim))
          ((figura-actual 'ant))
          ((matriz 'ant))
          )
        )
      )
  )


; Verifica si la figura puede ser rotada a la derecha despues del evento del teclado, devuelve un booleano respondiendo a la pregunta
(define (girar-derecha? i j)
  (matriz-ventanas-x (- i 150))
  ((figura-actual 'prim))
  (do (
       (cont (tam-y-fig) (- cont 1))
       )
    ((eq? cont 0) ((figura-actual 'ult)))
    ((((figura-actual 'info)) 'ult))
    ((figura-actual 'sig))
    )
  (do (
       (cont (/ (- j 130) dim) (- cont 1))
       )
    ((= cont 1))
    ((matriz 'sig))
    )
  (do (
       (res #t)
       (x (tam-x-fig) (- x 1))
       )
    ((or (eq? res #f) (eq? x 0)) res)
    ((figura-actual 'ult))
    (do (
         (y (tam-y-fig) (- y 1))
         )
      ((or (eq? res #f) (= y 0) ((((matriz 'info)) 'indef))) (when (and ((((matriz 'info)) 'indef))
                                                                      (not (= y 0)))
                                                                 (set! res #f)
                                                                 )
      )
      (if (eq? ((((matriz 'info)) 'info)) 0)
          (begin 
            ((((matriz 'info)) 'sig))
            ((((figura-actual 'info)) 'ant))
            ((figura-actual 'ant))
            )
          (if (eq? ((((figura-actual 'info)) 'info)) 0)
              (begin
                ((((matriz 'info)) 'sig))
                ((((figura-actual 'info)) 'ant))
                ((figura-actual 'ant))
                )
              (set! res #f)
              )
          )
      )
    ((matriz 'ant))
    ((figura-actual 'ult))
    )
  )



; Verifica si la figura puede ser rotada a la izquierda despues del evento del teclado, devuelve un booleano respondiendo a la pregunta
(define (girar-izquierda? i j)
  (let (
        (ubicar-ventanitas (- (- i 150) (* dim (- (tam-y-fig) 2))))
        )
    (matriz-ventanas-x  ubicar-ventanitas) 
    (if (>= ubicar-ventanitas 0)
        (begin
          ((figura-actual 'prim))
          (do (
               (cont (tam-y-fig) (- cont 1))
               )
            ((eq? cont 0) ((figura-actual 'prim)))
            ((((figura-actual 'info)) 'prim))
            ((figura-actual 'sig))
            )
          (do (
               (cont (/ (- j 130) dim) (- cont 1))
               )
            ((= cont 1))
            ((matriz 'sig))
            )
          (do (
               (res #t)
               (posx (tam-x-fig) (- posx 1))
               )
            ((or (eq? res #f) (eq? posx 0)) res)
            (do (
                 (posy (tam-y-fig) (- posy 1))
                 )
              ((or (eq? res #f) (= posy 0) ((((matriz 'info)) 'indef))) 
               (when (and ((((matriz 'info)) 'indef))
                        (not (= posy 0)))
                   (set! res #f)
                   )
               )
              
              (if (eq? ((((matriz 'info)) 'info)) 0)
                  (begin 
                    ((((matriz 'info)) 'sig))
                    ((((figura-actual 'info)) 'sig))
                    ((figura-actual 'sig))
                    )
                  (if (eq? ((((figura-actual 'info)) 'info)) 0)
                      (begin
                        ((((matriz 'info)) 'ant))
                        ((((figura-actual 'info)) 'sig))
                        ((figura-actual 'ant))
                        )
                      (set! res #f)
                      )
                  )
              )
            ((matriz 'ant))
            ((figura-actual 'prim))
            )
          )
        #f
        )
    )
  )

;---- FRAMES

(define frame (instantiate frame% (" ThetriX ") (x 330) (y 250) (width 300) (height 200)
                (style '(no-resize-border))))

(define mal-dim (instantiate frame% (" Error! ") (parent frame) (x 380) (y 300) (width 220) (height 100)
                (style '(no-resize-border))))

(define puntajes (instantiate frame% (" Los mejores Puntajes! ") (parent frame) (x 330) (y 250) (width 350)
                   (height 250) (style '(no-resize-border))))

(define acerca-de (instantiate frame% (" Acerca de ThetriX ") (parent frame) (x 330) (y 250) (width 350)
                    (height 250) (style '(no-resize-border))))


;---- MENUs

(define menu (new menu-bar% (parent frame)))
(define Juego (new menu% (label "&Juego") (parent menu)))


(define Menu-Nuevo (new menu-item% (label "Nuevo") (parent Juego) (shortcut #\n)
                     (callback (lambda (control event) 
                                 (begin
                                   (start)
                                   )))))

(new separator-menu-item% (parent Juego))

; 
(define Menu-Nivel (new menu% (label "Nivel") (parent Juego)))
(define Nivel-1 (new checkable-menu-item% (label " 1 ") (parent Menu-Nivel) (checked #t)
                     (callback (lambda (control event) 
                                 (begin 
                                   (if (not (eq? nivel 1))
                                       (begin
                                         (set! nivel 1)
                                         (send Nivel-1 check #t)
                                         (send Nivel-2 check #f)
                                         (send Nivel-3 check #f)
                                         )
                                       (send Nivel-1 check #t)
                                       )
                                   )))))
(define Nivel-2 (new checkable-menu-item% (label " 2 ") (parent Menu-Nivel) (checked #f)
                     (callback (lambda (control event) 
                                 (begin 
                                   (if (not (eq? nivel 2))
                                       (begin
                                         (set! nivel 2)
                                         (send Nivel-2 check #t)
                                         (send Nivel-1 check #f)
                                         (send Nivel-3 check #f)
                                         )
                                       (send Nivel-2 check #t)
                                       )
                                   )))))
(define Nivel-3 (new checkable-menu-item% (label " 3 ") (parent Menu-Nivel) (checked #f)
                     (callback (lambda (control event) 
                                 (begin 
                                   (if (not (eq? nivel 3))
                                       (begin
                                         (set! nivel 3)
                                         (send Nivel-3 check #t)
                                         (send Nivel-1 check #f)
                                         (send Nivel-2 check #f)
                                         )
                                       (send Nivel-3 check #t)
                                       )
                                   )))))


(define Menu-Puntajes (new menu-item% (label "Puntajes") (parent Juego) 
                     (callback (lambda (control event) 
                                 (begin
                                   (send puntajes show #t)
                                   )))))


(define Ayuda (new menu% (label "Ay&uda") (parent menu)))

(define Menu-Acerca-de (new menu-item% (label "Acerca de ThetriX...") (parent Ayuda) 
                     (callback (lambda (control event) 
                                 (begin
                                   (send acerca-de show #t)
                                   )))))

;; Frame
(instantiate message% (" " frame)) ;(instantiate message% ("" frame))
(define panel (instantiate horizontal-panel% (frame) (alignment '(center center))))

(instantiate message% (" " panel))
(define panel1 (instantiate vertical-panel% (panel) (alignment '(center center)) (style '(border))))
(instantiate message% ("Escoge el Tama�o del mundo." panel1))

(define panel-c (instantiate horizontal-panel% (panel1) (alignment '(center center))))
(define escribir-cols (new text-field% (label " Columnas:") (parent panel-c) (init-value "11") 
                           (callback void)
                           ))
(instantiate message% (" " panel-c))


(define panel-f (instantiate horizontal-panel% (panel1) (alignment '(center center))))
(define escribir-fills (new text-field% (label "         Filas:") (parent panel-f) (init-value "20") 
                            (callback void)
                           ))
(instantiate message% (" " panel-f))

(define panel2 (instantiate vertical-panel% (panel) (alignment '(center center))))


(define pos-izquierda (new check-box% (label "Izquierda") (parent panel2) 
                           (callback 
                            (lambda (check izquierda)
                              (begin
                                (if (eq? start-pos 'der)
                                    (begin
                                      (set! start-pos 'izq)
                                      (send pos-derecha set-value #f)
                                      )
                                      (if (eq? start-pos 'cen)
                                          (begin
                                            (set! start-pos 'izq)
                                            (send pos-centro set-value #f)
                                            )
                                          (send pos-izquierda set-value #t)
                                          )
                                      )
                                    ))) (value #f)))

(define pos-centro (new check-box% (label "Centro    ") (parent panel2) 
                           (callback 
                            (lambda (check centro)
                              (begin
                                (if (eq? start-pos 'der)
                                    (begin
                                      (set! start-pos 'cen)
                                      (send pos-derecha set-value #f)
                                      )
                                      (if (eq? start-pos 'izq)
                                          (begin
                                            (set! start-pos 'cen)
                                            (send pos-izquierda set-value #f)
                                            )
                                           (send pos-centro set-value #t)
                                          )
                                      )
                                    ))) (value #t)))

(define pos-derecha (new check-box% (label "Derecha  ") (parent panel2) 
                           (callback 
                            (lambda (check derecha)
                              (begin
                                (if (eq? start-pos 'cen)
                                    (begin
                                      (set! start-pos 'der)
                                      (send pos-centro set-value #f)
                                      )
                                      (if (eq? start-pos 'izq)
                                          (begin
                                            (set! start-pos 'der)
                                            (send pos-izquierda set-value #f)
                                            )
                                          (send pos-derecha set-value #t)
                                          )
                                      )
                                    ))) (value #f)))


(instantiate message% (" " panel2))

(define b (make-object bitmap% "../media/img/jugar.png" 'unknown/mask #f))
(define boton (new button% (label b) (parent panel2) (style '(border)) (enabled #t)
                   (callback (lambda (button event) 
                                 (begin
                                   (start)
                                   )))))
(instantiate message% (" " frame))

(define (start)
  (let (
        (cols (string->number(send escribir-cols get-value)))
        (fils (string->number(send escribir-fills get-value)))
        )
  (if (and (number? cols) (number? fils)) 
      (begin
        (set! x-m  cols)  
        (set! y-m fils) 
        (if (and (and (not (< x-m 4)) (not (< y-m 4))) (and (not (> x-m 35)) (not (> y-m 25))))
            (if (and (integer? x) (integer? y))
                (begin
                  (set! x (* dim x-m))
                  (set! y (* dim y-m))
                  (send mal-dim show #f)
                  (send frame show #f)
                  (jugar)
                  )
                (begin
                  (bell)
                  (send mal-dim show #t)
                  )
                )
            (begin
              (bell)
              (send mal-dim show #t)
              )
            )
        )
      (begin
        (bell)
        (send mal-dim show #t)
        )
      )
    )
  )
  
            
            
;; Mala-dimension

(instantiate message% ( "   Las Columnas deben medir entre 4 y 35, y las filas entre 4 y 25.  " mal-dim) 
  (vert-margin 10)) 

(define bot-mal-dim (new button% (label "Aceptar") (parent mal-dim) (style '(border)) (vert-margin 2)
                   (callback (lambda (button event) 
                                 (begin
                                   (send mal-dim show #f)
                                   )))))


;; Ventana del Juego !!!!-------------------
 
(define (color-aleatorio)
   (let ( (a (+ (random 8) 1))
          )
     (cond
       [(= a 1) (make-rgb 0 0 0.8)]
       [(= a 2) (make-rgb 0 0.4 0)]
       [(= a 3) (make-rgb 0.6 0 0)]
       [(= a 4) (make-rgb 0.8 0.7 0)]
       [(= a 5) (make-rgb 0.7 0.7 0.7)]
       [(= a 6) (make-rgb 0.2 0 0.2)]
       [(= a 7) (make-rgb 0.7 0.7 0.7)]
       [else (make-rgb 0.7 0.7 0.7)])))

(define (pintar m v)
  (let ( (posy 150) 
         (posx-tmp 150)
         (posx-final 0)
         )
    (do ()
      (((m 'indef)) 
       ; Dibuja una peque�a figura que conecta la raya horizontal con la vertical.
       (((draw-pixmap-posn "../media/img/cuadro-abajo-izq.png" 'unknown/mask) v) (make-posn (- posx-tmp 16) posy))
       ;Este "do" dibuja la raya que queda en el fondo del contenedor del tetris.
       (do () 
         ((= posx-tmp posx-final) 
          (begin
            ; Dibuja una peque�a figura que conecta la raya horizontal con la vertical.
            (((draw-pixmap-posn "../media/img/cuadro-abajo-der.png" 'unknown/mask) v) (make-posn (- posx-final 1) posy))
            ((m 'prim)))
          )
         (((draw-pixmap-posn "../media/img/raya-abajo.png" 'unknown/mask) v) (make-posn posx-tmp posy))
         (set! posx-tmp (+ posx-tmp dim))
         ))
      (((draw-pixmap-posn "../media/img/raya-izq.png" 'unknown/mask) v) (make-posn (- posx-tmp dim) posy))
      (do ()
        (((((m 'info)) 'indef)) ((((m 'info)) 'prim)))
        (when (eq? 0 ((((m 'info)) 'info)))
            ((draw-solid-rectangle v) (make-posn posx-tmp posy) dim dim bgcolor)
            )
        (set! posx-tmp (+ posx-tmp dim))
        ((((m 'info)) 'sig))
        )
      (((draw-pixmap-posn "../media/img/raya-der.png" 'unknown/mask) v) (make-posn posx-tmp posy))
      (set! posx-final posx-tmp)
      (set! posx-tmp 150)
      (set! posy (+ posy dim))
      ((m 'sig))
      )))
    
           
(define (dibujar-fig x y v)
  (let ((x-tmp x)
        (y-tmp y)
        )
    ((figura-actual 'prim))
    (do (
       (cont (tam-y-fig) (- cont 1))
       )
    ((eq? cont 0) ((figura-actual 'ult)))
    ((((figura-actual 'info)) 'prim))
    ((figura-actual 'sig))
    )
    (do ()
      (((figura-actual 'indef)) ((figura-actual 'prim)))
      (do ()
        (((((figura-actual 'info)) 'indef)) ((((figura-actual 'info)) 'prim)))
        (when (not (eq? ((((figura-actual 'info)) 'info)) 0))
            (begin
              ((draw-solid-rectangle v) (make-posn x-tmp y-tmp) dim dim color) 
              ((draw-solid-rectangle v) (make-posn (+ x-tmp 1) (+ y-tmp 1)) 18 18 color2)
              )
            )
        ((((figura-actual 'info)) 'sig))
        (set! x-tmp (+ dim x-tmp))
        )
      (set! x-tmp x)
      (set! y-tmp (- y-tmp dim))
      ((figura-actual 'ant))
      )))
        
       
  (define (borrar-fig x y v)
  (let ((x-tmp x)
        (y-tmp y)
        )
    ((figura-actual 'prim))
    (do (
       (cont (tam-y-fig) (- cont 1))
       )
    ((eq? cont 0) ((figura-actual 'ult)))
    ((((figura-actual 'info)) 'prim))
    ((figura-actual 'sig))
    )
    (do ()
      (((figura-actual 'indef)) ((figura-actual 'prim)))
      (do ()
        (((((figura-actual 'info)) 'indef)) ((((figura-actual 'info)) 'prim)))
        (when (not (eq? ((((figura-actual 'info)) 'info)) 0))
            (begin
              ((clear-solid-rectangle v) (make-posn x-tmp y-tmp) dim dim)
             ((draw-solid-rectangle v) (make-posn x-tmp y-tmp) dim dim bgcolor) 
              )
            )
        ((((figura-actual 'info)) 'sig))
        (set! x-tmp (+ dim x-tmp))
        )
      (set! x-tmp x)
      (set! y-tmp (- y-tmp dim))
      ((figura-actual 'ant))
      )))    



  
(define (mov-figura x y v)
  (let ((i x) (xi x) (yi y)
        (bajar? true)
        )
   (do (
        (j y (+ dim j)) 
        (parar false)
        )
     ((or parar (eq? #f (puede-abajo? i j)) (eq? bajar? #f))  (begin
                                                                (dibujar-fig i j v)
                                                                (do (
                                                                     (terminar 0 (add1 terminar))
                                                                     (push (press? v) (press? v))
                                                                     )
                                                                  ((or parar (eq? terminar 20)) (viewport-flush-input v) )
                                                                  (begin
                                                                    ; Condici�n para undir pause
                                                                    (when (eq? push #\p)
                                                                        (do ( (stop-pause #f)
                                                                              (push2 (press? v) (press? v))
                                                                              )
                                                                          ((eq? #t stop-pause))
                                                                          (when (eq? push2 #\p)
                                                                              (set! stop-pause #t)
                                                                              )
                                                                          )
                                                                        )
                                                                    
                                                                    (when (eq? push 'left)
                                                                        (begin
                                                                          (when (> i 150)
                                                                              (when (eq? (puede-izquierda? i j) #t)
                                                                                  (begin
                                                                                    (borrar-fig i j v)
                                                                                    (set! i (- i dim))
                                                                                    (dibujar-fig i j v)
                                                                                    )
                                                                                  )
                                                                              )
                                                                          )
                                                                        )
    
                                                                    (when (eq? push 'right)
                                                                        (begin
                                                                          (when (eq? (puede-derecha? i j) #t)
                                                                              (begin
                                                                                (borrar-fig i j v)
                                                                                (set! i (+ i dim))
                                                                                (dibujar-fig i j v)
                                                                                 )
                                                                              )
                                                                          )
                                                                        )
                                                                    (sleep 0.025)
                                                                    )
                                                                  )
                                                                  
                                                                (if (eq? #t (puede-abajo? i j))
                                                                    (mov-figura i j v)
                                                                    (begin
                                                                      (play-sound "../media/sfx/caida1.wav" #t)
                                                                      (agregar-ficha-mundo i j)
                                                                      #t)
                                                                    )
                                                                )
                                                              )
     (dibujar-fig i j v)
     (do (
          (terminar 0 (add1 terminar))
          (push (press? v) (press? v))
          (mouse (query-mouse-posn v) (query-mouse-posn v))
          )
       ((or parar (eq? terminar 20)) (viewport-flush-input v) )
       (begin
          ; Condici�n para undir pause
         (when (eq? push #\p)
             (do ( (stop-pause #f)
                   (push2 (press? v) (press? v))
                   )
               ((eq? #t stop-pause))
               (when (eq? push2 #\p)
                   (set! stop-pause #t)
                   )
               )
             )
         
         (when (eq? push 'left)
             (when (> i 150)
                 (when (eq? (puede-izquierda? i j) #t)
                     (begin
                       (borrar-fig i j v)
                       (set! i (- i dim))
                       (dibujar-fig i j v)
                       (when (eq? #f (puede-abajo? i j))
                           (set! bajar? #f)
                           )
                       )
                     )
                 )
             )
         
         (when (eq? push 'right)
             (when (eq? (puede-derecha? i j) #t)
                 (begin
                   (borrar-fig i j v)
                   (set! i (+ i dim))
                   (dibujar-fig i j v)
                   (when (eq? #f (puede-abajo? i j))
                       (set! bajar? #f)
                       )
                   )
                 )
             )
         
             
         
         (when (eq? push #\x)
             (when (not (= j (+ (* (tam-y-fig) dim) 130))) 
                 (when (eq? (girar-derecha? i j) #t)
                     (begin
                       (play-sound "../media/sfx/mov.wav" #t)
                       (borrar-fig i j v)
                       (girar 'derecha)
                       (dibujar-fig i j v)
                       )
                     )
                 )
             )
         
         
         (when (eq? push #\z)
             (when (eq? n-ficha 'i)
                 (when (not (= j (+ (* (tam-y-fig) dim) 130))) 
                     (when (eq? (girar-derecha? i j) #t)
                         (begin
                           (play-sound "../media/sfx/mov.wav" #t)
                           (borrar-fig i j v)
                           (girar 'derecha)
                           (dibujar-fig i j v)
                           )
                         )
                     )
                 (when (not (= j (+ (* (tam-y-fig) dim) 130))) 
                     (when (eq? (girar-izquierda? i j) #t)
                         (begin
                           (play-sound "../media/sfx/mov.wav" #t)
                           (borrar-fig i j v)
                           (girar 'izquierda)
                           (when (eq? (puede-derecha? i j) #f)
                               (begin
                                 (set! i (- i dim))
                                 (dibujar-fig i j v)
                                 )
                           (dibujar-fig i j v)
                           )
                           
                           )
                         ))))
                        
             
         (when (eq? push 'down)
             (begin
               (play-sound "../media/sfx/caida2.wav" #t)
               (do ()
                 ((eq? (puede-abajo? i (+ j dim)) #f) (begin
                                                        (set! parar true)
                                                        ))
                 (borrar-fig i j v)
                 (set! j (+ j dim))
                 (dibujar-fig i j v)
                 )
               )
             )
         
         (sleep 0.025)
         )
       )
     (if (eq? bajar? #t)
         (borrar-fig i j v)
         (begin
           (borrar-fig i j v)
           (set! j (- j dim))
           )
         )
    )
   ))
  
(define (quitar-lineas v)
  (let ( (x-pos 150)
         (y-pos (+ 130 y))
         (time 0.035)
         )
    (if (not ((lista-pos-elim 'indef)))
        (begin
          (play-sound "../media/sfx/line.wav" #t)
          (set! puntaje (+ puntaje ((lista-pos-elim 'longitud))))
          ((lista-pos-elim 'prim))
          (set! puntaje (+ (- ((lista-pos-elim 'longitud)) 1) puntaje))
          (do ((long ((lista-pos-elim 'longitud))))
            ((eq? x-pos (+ x 150))  #t)
            (if (eq? long 1)
                (begin
                  ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                            dim dim (color-aleatorio))
                  (sleep time)
                  ((lista-pos-elim 'prim))
                  ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                130)) dim dim bgcolor)
                  )
                (if (eq? long 2)
                    (begin
                      ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                dim dim (color-aleatorio))
                      ((lista-pos-elim 'sig))
                      ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                dim dim (color-aleatorio))
                      (sleep time)
                      ((lista-pos-elim 'prim))
                      ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                    130)) dim dim bgcolor)
                      ((lista-pos-elim 'sig))
                      ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                    130)) dim dim bgcolor)
                      )
                    (if (eq? long 3)
                        (begin
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                    dim dim (color-aleatorio))
                          ((lista-pos-elim 'sig))
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                    dim dim (color-aleatorio))
                          ((lista-pos-elim 'sig))
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                    dim dim (color-aleatorio))
                          (sleep time)
                          ((lista-pos-elim 'prim))
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                        130)) dim dim bgcolor)
                          ((lista-pos-elim 'sig))
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                        130)) dim dim bgcolor)
                          ((lista-pos-elim 'sig))
                          ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                        130)) dim dim bgcolor)
                          )
                        (when (eq? long 4)
                            (begin
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                        dim dim (color-aleatorio))
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                        dim dim (color-aleatorio))
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                        dim dim (color-aleatorio))
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 130))
                                                        dim dim (color-aleatorio))
                              (sleep time)
                              ((lista-pos-elim 'prim))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                            130)) dim dim bgcolor)
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                            130)) dim dim bgcolor)
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                            130)) dim dim bgcolor)
                              ((lista-pos-elim 'sig))
                              ((draw-solid-rectangle v) (make-posn x-pos (+ (* ((lista-pos-elim 'info)) dim) 
                                                                            130)) dim dim bgcolor)
                              )
                            )
                        )
                    )
                )
            ((lista-pos-elim 'prim))
            (set! x-pos (+ x-pos dim))
            )
          )
        #f
        )))

; Re-pintar la matriz
(define (re-pintar v)
  (let ( 
        (y-pos 130)
        (x-pos 150)
        )
    ((lista-pos-elim 'ult))
    ((matriz 'ult))
    (set! y-pos (+ y y-pos))
     
    ;  Do que pinta de acuerdo al nuevo estado de la matriz.
    (do ()
      (((matriz 'indef)) ((matriz 'prim)))
      ((((matriz 'info)) 'prim))
      (do ()
        (((((matriz 'info)) 'indef)) ((((matriz 'info)) 'prim)))
        (cond
          [(eq? ((((matriz 'info)) 'info)) 1)
           (begin
             (set! color (make-rgb 0 0 0.4)) ; Color AZUL
             (set! color2 (make-rgb 0 0 0.8))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
             )]
          [(eq? ((((matriz 'info)) 'info)) 2)
           (begin
             (set! color (make-rgb 0 0.4 0)) ; Color VERDE
             (set! color2 (make-rgb 0 0.8 0))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
             )]
          [(eq? ((((matriz 'info)) 'info)) 3)
           (begin
             (set! color (make-rgb 0.6 0 0)) ; Color ROJO
             (set! color2 (make-rgb 1 0 0))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
                     )]
          [(eq? ((((matriz 'info)) 'info)) 4)
           (begin
             (set! color (make-rgb 0.8 0.7 0)) ; Color AMARILLO
             (set! color2 (make-rgb 1 0.8 0))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
                     )]
          [(eq? ((((matriz 'info)) 'info)) 5)
           (begin
             (set! color (make-rgb 0.7 0.7 0.7)) ; Color BLANCO
             (set! color2 (make-rgb 1 1 1))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
             )]
          [(eq? ((((matriz 'info)) 'info)) 6)
           (begin
             (set! color (make-rgb 0.2 0 0.2)) ; Color MORADO
             (set! color2 (make-rgb 0.7 0 0.7))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
             )]
          [(eq? ((((matriz 'info)) 'info)) 7)
           (begin
             (set! color (make-rgb 0.7 0.7 0.7)) ; Color NEGRO
             (set! color2 (make-rgb 0 0 0))
             ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim color) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ y-pos 1)) 18 18 color2)
             )]
          [else
           ((draw-solid-rectangle v) (make-posn x-pos y-pos) dim dim bgcolor)
           ]
          )
        (set! x-pos (+ x-pos dim))
        ((((matriz 'info)) 'sig))
        )
      ((matriz 'ant))
      (set! x-pos 150)
      (set! y-pos (- y-pos dim))
      )
    )
  )

(define (set-colors)
  (set! color color3) 
  (set! color2 color4)
  )


(define (set-colors2)
  (cond
    [(eq? n-ficha 'j) (begin
                        (set! color3 (make-rgb 0 0 0.4)) ; Color AZUL
                        (set! color4 (make-rgb 0 0 0.8)))]
    [(eq? n-ficha 'l) (begin
                        (set! color3 (make-rgb 0 0.4 0)) ; Color VERDE
                        (set! color4 (make-rgb 0 0.8 0)))]
    [(eq? n-ficha 't) (begin
                        (set! color3 (make-rgb 0.6 0 0)) ; Color ROJO
                        (set! color4 (make-rgb 1 0 0)))]
    [(eq? n-ficha 's) (begin
                        (set! color3 (make-rgb 0.8 0.7 0)) ; Color AMARILLO
                        (set! color4 (make-rgb 1 0.8 0)))]
    [(eq? n-ficha 'z) (begin
                        (set! color3 (make-rgb 0.7 0.7 0.7)) ; Color BLANCO
                        (set! color4 (make-rgb 1 1 1)))]
    [(eq? n-ficha 'o) (begin
                        (set! color3 (make-rgb 0.2 0 0.2)) ; Color MORADO
                        (set! color4 (make-rgb 0.7 0 0.7)))]
    [(eq? n-ficha 'i) (begin
                        (set! color3 (make-rgb 0.7 0.7 0.7)) ; Color NEGRO
                        (set! color4 (make-rgb 0 0 0)))]
   ))

(define (dibujar-next-fig v)
  (let ( (i 30)
         (j (+ (/ y 2) 75))
         (itera 0) )
    (cond 
     [(<= ((((figura-tmp 'info)) 'longitud)) 3) (begin
                                                  (set! i (+ i dim))
                                                  (set! itera 3)
                                                  )]
     [else (set! itera 4)]
     )
    (when (= ((figura-tmp  'longitud)) 2) 
        (set! j (+ j dim))
        )
     
    ((figura-tmp 'prim))
    ((((figura-tmp 'info)) 'prim))
    (do ()
      (((figura-tmp 'indef)) ((figura-tmp 'prim)))
      (do ((cont 0 (+ 1 cont)) 
           (x-pos i))
        ((or  (= cont itera) ((((figura-tmp 'info)) 'indef))) ((((figura-tmp 'info)) 'prim)))
        (cond
          [(eq? ((((figura-tmp 'info)) 'info)) 1)
           (begin
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
             )]
          [(eq? ((((figura-tmp 'info)) 'info)) 2)
           (begin
            ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
             )]
          [(eq? ((((figura-tmp 'info)) 'info)) 3)
           (begin
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
                     )]
          [(eq? ((((figura-tmp 'info)) 'info)) 4)
           (begin
            ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
                     )]
          [(eq? ((((figura-tmp 'info)) 'info)) 5)
           (begin
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
             )]
          [(eq? ((((figura-tmp 'info)) 'info)) 6)
           (begin
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
             )]
          [(eq? ((((figura-tmp 'info)) 'info)) 7)
           (begin
             ((draw-solid-rectangle v) (make-posn (+ x-pos 1) (+ 3 j)) dim dim color3) 
             ((draw-solid-rectangle v) (make-posn (+ x-pos 2) (+ 4 j)) 18 18 color4)
             )]
          )
        (set! x-pos (+ x-pos dim))
        ((((figura-tmp 'info)) 'sig))
        )
      (set! j (+ j 20))
      ((figura-tmp 'sig))
      )
    )
  )
    
    
(define (jugar)
  (open-graphics)
  (let ( 
        (ventana (open-viewport "ThetriX" (+  x 300) (+ y 200)))
        (pixmap (open-pixmap "graphics" (+  x 300) (+ y 200))) 
        (x-start 0)
        )
    (((draw-pixmap-posn "../media/img/fondo-pasto.png" 'unknown/mask) pixmap) (make-posn 0 0))
    (((draw-pixmap-posn "../media/img/siguiente.png" 'unknown/mask) pixmap) (make-posn -2 (+ (/ y 2) 25)))
    (((draw-pixmap-posn "../media/img/puntaje.png" 'unknown/mask) pixmap) (make-posn (+ 153 x) (+ (/ y 2) 25)))
    ((draw-string pixmap) (make-posn (+ 220 x) (+ (/ y 2) 110)) (number->string (* 100 puntaje)) "white") 
    (sleep 1)
    (set! matriz (mundo y-m x-m))
    (aleatoria)
    (set-colors2)
    (set! figura-actual figura-tmp)
    (set-colors)
    (aleatoria)
    (set-colors2)
    (dibujar-next-fig pixmap)
    (copy-viewport pixmap ventana) 
    ventana
    ((clear-viewport pixmap)) 
    (pintar matriz ventana)
    (if (eq? start-pos 'izq)
        (set! x-start 150)
        (if (eq? start-pos 'der)
            (set! x-start (- (+ 150 x) (* dim (tam-x-fig))))
            (if (eq? (remainder x-m 2) 0)
                (set! x-start (+ 130 (/ x 2)))
                (set! x-start (+ 110 (/ (+ x dim) 2)))
                )
            )
        )
    (set! ficha (mov-figura x-start (+ (* (tam-y-fig) dim) 130) ventana))
    ficha
    (do ( (game-ove null))
      ((eq? #t game-over) (begin
                            (((draw-pixmap-posn "../media/img/oscuridad.png" 'unknown/mask) ventana) (make-posn 0 0))
                            ;(((draw-pixmap-posn "../media/img/per1.png" 'unknown/mask) ventana) (make-posn (-  x 105) (- y 150)))
                            ;(((draw-pixmap-posn "../media/img/per2.png" 'unknown/mask) ventana) (make-posn (-  x 105) (- y 150)))
                            ;(((draw-pixmap-posn "../media/img/per3.png" 'unknown/mask) ventana) (make-posn (- x 105) (- y 150)))
                            ;(((draw-pixmap-posn "../media/img/per4.png" 'unknown/mask) ventana) (make-posn (-  x 105) (- y 150)))
                            (((draw-pixmap-posn "../media/img/per5.png" 'unknown/mask) ventana) (make-posn (-  x 105) (- y 150)))
                            (((draw-pixmap-posn "../media/img/per6.png" 'unknown/mask) ventana) (make-posn (- x 105) (- y 150)))
                            (sleep 5)
                            ((clear-viewport ventana))
                            (set! puntaje 0)
                            (close-graphics)
                            (set! matriz (tad-lista))
                            (matriz-ventanas-x 0)
                            ((matriz 'prim))
                            (set! game-over #f)
                            (send frame show #t)
                            ; Para inicializar todas las variables. 
                            )
       )
      (when (eq? true ficha)
          (begin
            (borrar-unos)
            (when (eq? (quitar-lineas ventana) #t)
                (begin
                  (((draw-pixmap-posn "../media/img/puntaje.png" 'unknown/mask) ventana) (make-posn (+ 153 x) (+ (/ y 2) 25)))
                  ((draw-string ventana) (make-posn (+ 220 x) (+ (/ y 2) 110)) (number->string (* 100 puntaje)) "white")
                  (set! lista-pos-elim (tad-lista))
                  (matriz-ventanas-x 0)
                  ((matriz 'prim))
                  (re-pintar ventana)
                  )
                )
            (set! figura-actual figura-tmp)
            (set-colors)
            (aleatoria)
            (set-colors2)
            (((draw-pixmap-posn "../media/img/siguiente.png" 'unknown/mask) ventana) (make-posn -2 (+ (/ y 2) 25)))
            (dibujar-next-fig ventana)
            (matriz-ventanas-x 0)
            ((matriz 'prim))
            (if (eq? start-pos 'izq)
                (set! x-start 150)
                (if (eq? start-pos 'der)
                    (set! x-start (- (+ 150 x) (* dim (tam-x-fig))))
                    (if (eq? (remainder x-m 2) 0)
                        (set! x-start (+ 130 (/ x 2)))
                        (set! x-start (+ 110 (/ (+ x dim) 2)))
                        )
                    )
                )
            (set! ficha (mov-figura x-start (+ (* (tam-y-fig) dim) 130) ventana))
            ficha
            )
          )
    )))



; Funciones para la jugabilidad del tetris

(define (press? v)
  (let (
        (press (ready-key-press v))
        )
    (when (not (eq? press #f))
        (key-value press)
        )
    )
  )

(intro)
(send frame show #t)
