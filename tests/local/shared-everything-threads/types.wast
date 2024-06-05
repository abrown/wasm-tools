;;(module
;;  (type (func shared))
;;  (type (func (param i32) shared))
;;  (type (func (param (externref shared)) shared))
;;  (type (func (param (ref null (extern shared))) shared))
;;
;;  (type (array i32 shared))
;;  (type (array (funcref shared) shared))
;;  (type (array (ref null (func shared)) shared))
;;
;;  (type (struct shared))
;;  (type (struct (field i32) shared))
;;  (type (struct (field (shared anyref) shared))
;;  (type (struct (field (ref null (shared any)) shared))
;;)

(module
  (type (shared (func)))
  (type (shared (func (param i32))))
  (type (shared (func (param (shared externref)))))
  (type (shared (func (param (ref null (shared extern))))))

  (type (shared (array i32)))
  (type (shared (array (shared funcref))))
  (type (shared (array (ref null (shared func)))))

  (type (shared (struct)))
  (type (shared (struct (field i32))))
  (type (shared (struct (field (shared anyref))))
  (type (shared (struct (field (ref null (shared any)))))
)

;; (assert_invalid
;;   (module
;;     (type (func (param externref) shared))
;;   )
;;   "invalid type")
;;
;; (assert_invalid
;;   (module
;;     (type (struct (field anyref) shared))
;;   )
;;   "invalid type")
;;
;; (assert_invalid
;;   (module
;;     (type (array (anyfunc) shared))
;;   )
;;   "invalid type")

(assert_invalid
  (module
    (type (shared (func (param externref))))
  )
  "invalid type")

(assert_invalid
  (module
    (type (shared (struct (field anyref))))
  )
  "invalid type")

(assert_invalid
  (module
    (type (shared (array (anyfunc))))
  )
  "invalid type")

(assert_invalid
  (module
    (type $t (func))
    (global (shared (ref null (shared $t))))
  )
  "invalid type")
