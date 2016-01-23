#lang racket

(define (tad-lista)
  (define-struct nodo ([info #:mutable] [ant #:mutable] [sig #:mutable]))
  (let ( 
        (ventana null)
        (primero null)
        (ultimo null)
        (longitud 0)
        )
    (local (
            
            (define (indefinida)
              (null? ventana)
              )
            
            (define (info)
              (if (indefinida)
                  (error 'info "La ventana no puede estar indefinida")
                  (nodo-info ventana)
                  ))
            
            (define (siguiente)
              (when (not (indefinida))
                  (set! ventana (nodo-sig ventana))
                  ))
            
            (define (anterior)
              (when (not (indefinida))
                  (set! ventana (nodo-ant ventana))
                  ))
            
            (define (anexar elem)
              (if (or (= longitud 0) (not (indefinida)))
                  (let ((nodoElem (make-nodo elem null null)))
                    (cond
                      [(null? primero)
                       (set! primero nodoElem)
                       (set! ultimo nodoElem)]
                      [(eq? ventana ultimo)
                       (set-nodo-ant! nodoElem ventana) "2"
                       (set-nodo-sig! ventana nodoElem) "4"
                       (set! ultimo nodoElem)]
                      [else 
                       (set-nodo-sig! nodoElem (nodo-sig ventana)) "1"
                       (set-nodo-ant! nodoElem ventana) "2"
                       (set-nodo-ant! (nodo-sig ventana) nodoElem) "3"
                       (set-nodo-sig! ventana nodoElem) "4"]
                      )
                    (set! ventana nodoElem) "5"
                    (set! longitud (add1 longitud))
                    )
                  (error 'anexar "ventana indefinida")
                  )
              )
            
            (define (insertar elem)
              (if (or (= longitud 0) (not (indefinida)))
                  (let ((nodoElem (make-nodo elem null null)))
                    (cond
                      [(null? primero)
                       (set! primero nodoElem)
                       (set! ultimo nodoElem)]
                      [(eq? ventana primero)
                       (set-nodo-sig! nodoElem ventana) "1"
                       (set-nodo-ant! ventana nodoElem) "4"
                       (set! primero nodoElem)]
                      [else 
                       (set-nodo-sig! nodoElem ventana) "1"
                       (set-nodo-ant! nodoElem (nodo-ant ventana)) "2"
                       (set-nodo-sig! (nodo-ant ventana) nodoElem) "3"
                       (set-nodo-ant! ventana nodoElem) "4"]
                      )
                    (set! ventana nodoElem) "5"
                    (set! longitud (add1 longitud))
                    )
                  (error 'insertar "ventana indefinida")
                  )
              )
            
            (define  (eliminar)
              (if (indefinida)
                  (error 'elim "No se puede eliminar")
                  (begin
                    (cond
                     [(eq? ventana primero)
                      (set! ventana (nodo-sig ventana))
                      (set! primero ventana)
                      (if (eq? primero ultimo)
                          (set! ultimo null)
                          (begin
                            (set-nodo-sig! (nodo-ant ventana) null)
                            (set-nodo-ant! ventana null)
                            ))]
                     [else
                      (if (eq? ventana ultimo)
                          (set! ultimo (nodo-ant ventana))
                          (set-nodo-ant! (nodo-sig ventana) (nodo-ant ventana))
                          )
                      (set-nodo-sig! (nodo-ant ventana) (nodo-sig ventana))
                      (let (
                            (tmp ventana)
                            )
                        (set! ventana (nodo-sig ventana))
                        (set-nodo-ant! tmp null)
                        (set-nodo-sig! tmp null)
                        )
                      ]
                     )
                    (set! longitud (sub1 longitud))
                    )
                  )
              )
            
            (define (prim)
              (set! ventana primero))
            
            (define (ult)
              (set! ventana ultimo))
            
            (define (long)
              longitud
              )
            
            (define (imprimir)
              (if (indefinida)
                  (display "empty")
                  (begin
                    (prim)
                    (do ((i (long) (sub1 i))
                         )
                      ((= i 1) (begin
                                 (display
                                  (nodo-info ventana)
                                  )
                                 (prim)
                                 (display " ")
                                 ))
                      (begin
                        (display (nodo-info ventana))
                        (display "  ")
                        (siguiente)
                        )
                      ))))
            
            
            
            (define (introducir elem)
              (if (or (not (indefinida)) (= longitud 0))
                  (begin
                    (set! ventana primero)
                    (cond
                     [(null? primero)
                      (insertar elem)]
                     [else 
                      (if (= (nodo-info ventana) elem)
                          (anexar elem)
                          (if (< (nodo-info ventana) elem)
                              (do ((i 0)
                                   ) 
                                ((or (> (nodo-info ventana) elem) (= i 1)) 
                                 (begin
                                   (if (= i 1)
                                       (anexar elem)
                                       (insertar elem)
                                       )))
                                (if (null? (nodo-sig ventana))
                                    (set! i 1)
                                    (set! ventana (nodo-sig ventana))
                                    ))
                              (insertar elem)
                               )
                            )
                        ])
                    )
                  (error 'insertar "ventana indefinida")
                  )
              )
              
                      
            ; FUNCI�N MANEJADOR
            (define (manejador msg)
              (cond
                [(eq? msg 'longitud) long]
                [(eq? msg 'indef) indefinida]
                [(eq? msg 'imprimir) imprimir]
                [(eq? msg 'eliminar) eliminar]
                [(eq? msg 'anexar) anexar]
                [(eq? msg 'insertar) insertar]	
                [(eq? msg 'info) info]
                [(eq? msg 'prim) prim]
                [(eq? msg 'sig) siguiente]
                [(eq? msg 'ult) ult]
                [(eq? msg 'ant) anterior]
                [else "La funci�n no existe"]))
            ) manejador
      )
    )
  )
(provide (all-defined-out))
