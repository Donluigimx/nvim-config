; extends

;; Inject sql into `sql` tagged template literals
(call_expression
  function: (identifier) @_sql_tag
  arguments: (template_string) @injection.content
  (#eq? @_sql_tag "sql")
  (#set! injection.language "sql")
  (#set! injection.include-children)
)
