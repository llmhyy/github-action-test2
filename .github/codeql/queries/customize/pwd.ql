/**
 * @id java/hardcoded-password
 * @kind problem
 * @problem.severity error
 * @language java
 * @description Detect hardcoded passwords in Java source code.
 */

import java

/**
 * This query detects string literals that are directly assigned
 * to variables whose names indicate they may store a password.
 */
from LocalVariableDecl v, StringLiteral s
where
  // 变量名包含 “password”，不区分大小写
  v.getName().matches("(?i).*password.*") and

  // 确认该变量的初始化表达式是一个字符串字面量
  v.getInitializer() = s and
  s.getValue().length() > 0
select v, s,
  "Variable '" + v.getName() +
  "' is initialized with a hardcoded password string \"" + s.getValue() +
  "\". Remove hardcoded passwords from source code."
