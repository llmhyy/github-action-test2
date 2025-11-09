/**
 * @id java/hardcoded-password
 * @kind problem
 * @problem.severity error
 * @language java
 */

import java

from Variable v, StringLiteral s, Assignment a
where
  v.getName().toLowerCase().matches("(?i).*password.*") and
  s.getValue().length() > 0 and
  (
    // assignment: password = "..."
    (a.getDest() = v.getAnAccess() and a.getSource() = s)
    or
    // local variable declaration with initializer: String password = "..."
    exists(LocalVariable lv | lv = v and lv.getAnInitializer() = s)
    or
    // field declaration with initializer: private String password = "..."
    exists(Field f | f = v and f.getInitializer() = s)
  )
select s, "This string contains a hardcoded password which should be removed."
