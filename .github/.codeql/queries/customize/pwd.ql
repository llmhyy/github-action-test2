/**
 * @id java/hardcoded-password
 * @kind problem
 * @problem.severity error
 * @language java
 * @description Detect hardcoded passwords in variable declarations.
 */

import java

from LocalVariable v
select v, "Found variable " + v.getName()


// from LocalVariableDecl v, StringLiteral s
// where
//   v.getName().regexpMatch("(?i).*pass(word)?|pwd.*") //and
//   //v.getInitializer() = s and
//   //s.getValue().length() > 0
// select v, "Variable '" + v.getName() +
//           "' is initialized with a hardcoded password: \"" + s.getValue() + "\"."
