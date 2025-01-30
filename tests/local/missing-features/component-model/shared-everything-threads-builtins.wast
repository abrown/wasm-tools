(assert_invalid
  (component
    ;; Refer to a non-existent function type (i.e., 0); validation for
    ;; `thread.spawn` happens first.
    (core func $spawn (canon thread.spawn 0))
  )
  "`thread.spawn` requires the shared-everything-threads proposal")

(assert_invalid
  (component
    (core module $libc (table (export "start-table") 1 funcref))
    (core instance $libc (instantiate $libc))
    (core func $spawn_indirect (canon thread.spawn_indirect (table $libc "start-table")))
  )
  "`thread.spawn_indirect` requires the shared-everything-threads proposal")

(assert_invalid
  (component
    (core func $concurrency (canon thread.hw_concurrency))
  )
  "`thread.hw_concurrency` requires the shared-everything-threads proposal")
