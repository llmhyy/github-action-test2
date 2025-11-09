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
  )
select s, "This string contains a hardcoded password which should be removed."
