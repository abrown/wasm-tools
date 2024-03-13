;; Styled after ../../testsuite/global.wast

(module
  (global $x (mut i32) (i32.const -1))
  (global $sx (shared i64) (i64.const 1))
  (func (export "get-x") (result i32) (global.get $x))
  (func (export "get-x-seqconst") (result i32) (global.atomic.get seq_cst $x))
  ;; (func (export "get-x-relacq") (result i32) (global.atomic.get rel_acq $x))
  ;; (func (export "set-x-seqconst") (result i32) (global.atomic.set seq_cst $x))
  ;; (func (export "set-x-relacq") (result i32) (global.atomic.set rel_acq $x))
)
